unit unDM;

interface

uses
  SysUtils, Classes, DB, SqlExpr, DBXFirebird, StdCtrls, Forms, FMTBcd, DBClient,
  Provider, labeleddbedit;

type
  TDadosUsuario = record
    Login: string;
    Senha: string;
    Nome_Usuario: string;
    Nome_Maquina: string;
    IP_Maquina: string;
    Grupo: string;
    Dba: Integer;
    Empresa: Integer;
    RazaoEmpresa:string;
    EmailConta: String;
    EmailHost: String;
    EmailPorta: Integer;
    EmailUsuario: String;
    EmailSenha: String;
    EmailAtenticacaoSSL: Boolean;
    EmailCopia: String;
    CodVendedor:string;
  end;

  TParametrosGeral = record
    CaminhoRelatorioOS         : string  ;
    CaminhoRelatorioOSResumido : string  ;
    CaminhoRelatorioOSErro     : string  ;
    CaminhoRelatorioContador   : string  ;
    CaminhoRelatorioConsumiveis: string  ;
  end;

  TDM = class(TDataModule)
    Conn: TSQLConnection;
    QR_Busca: TSQLQuery;
    sdsPesquisasGeral: TSQLDataSet;
    dspPesquisasGeral: TDataSetProvider;
    cdsPesquisasGeral: TClientDataSet;
    dsPesquisasGeral: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ParamGeral :TParametrosGeral;
    Retornar: Boolean; // usada na tela de pesquisas
    Retorno_Pesquisa,
    Retorno_Pesquisa1,
    Retorno_Pesquisa2,
    Retorno_Pesquisa3,
    Retorno_Pesquisa4,
    Retorno_Pesquisa5: string;
    Pos_Ret_Pesquisa: Integer;
    Confirmar:boolean;
    DadosUsu: TDadosUsuario;

    strBotaoMunicipio,
    strBotaoUsuario,
    strBotaoCliente,
    strBotaoImpressora,
    strBotaoConsumiveis: String;

    strExitMunicipio,
    strExitUsuario,
    strExitCliente,
    strExitImpressora,
    strExitConsumiveis: String;

    function BuscaBotao(edtCodigo: TCustomEdit; Sql, Titulo_Pesquisa, Titulo_Label: String):String;
    procedure BuscaBotaoUsuario(edtCodigo: TCustomEdit);
    procedure BuscaBotaoImpressora(edtCodigo: TCustomEdit);
    procedure BuscaBotaoCliente(edtCodigo: TCustomEdit);
    procedure BuscaBotaoItens(edtTipo, edtItem: TCustomEdit);
    procedure BuscaBotaoMunicipio(edtCodigo: TCustomEdit);
    procedure BuscaBotaoConsumiveis(edtCodigo: TCustomEdit);

    procedure BuscaExit(edtCod, edtDesc: TCustomEdit; Sql: String; Fechar_Cds: Boolean = True; Emitir_Aviso_Nao_Encontado : Boolean = True);
    procedure BuscaExitItens(edtTipo,edtItem,edtDesc: TCustomEdit; Fechar_Cds: Boolean = True);
    procedure BuscaExitUsuario(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean = True);
    procedure BuscaExitImpressora(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean = True);
    procedure BuscaExitCliente(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean = True);
    procedure BuscaExitMunicipio(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean = True);
    procedure BuscaExitConsumiveis(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean = True);

    function IncCodigo(Tabela, Campo: string; where: String = ''):Integer;
    function Salvar(cds: TClientDataSet):Integer;
    function Excluir(cds: TClientDataSet):boolean;

    function Pesquisa(const pSQL: String; const pTituloForm: String = ''; const pTituloLabel: String = '';
      const pColRet: Integer = 0): String;

    function PesquisaOS(const pSQL: String; const pTituloForm: String = ''; const pTituloLabel: String = '';
      const pColRet: Integer = 0): String;

    function BuscaCDS(cds: TClientDataSet; Sql: String): Boolean;
    function BuscaQry(qry: TSQLQuery; Sql: String): Boolean;

    procedure AtualizaParametros;

  end;

var
  DM: TDM;

implementation

{$R *.dfm}
uses unPadraoPesquisas, unRegrasForm, unPesquisaOS;

function TDM.Excluir(cds:TClientDataSet):boolean;
var
  qtd_erros: Integer;
begin
  cds.Delete;
  qtd_erros := cds.ApplyUpdates(-1);
  Result := ( qtd_erros <= 0 );
end;

procedure TDM.AtualizaParametros;
begin
  DM.BuscaQry(QR_Busca,'SELECT * FROM PARAMETROS');
  QR_Busca.First;

  ParamGeral.CaminhoRelatorioOS          := QR_Busca.fieldbyname('CAMINHO_REL_OS'         ).AsString;
  ParamGeral.CaminhoRelatorioOSResumido  := QR_Busca.fieldbyname('CAMINHO_REL_OS_RESUMIDO').AsString;
  ParamGeral.CaminhoRelatorioOSErro      := QR_Busca.fieldbyname('CAMINHO_REL_OS_ERRO'    ).AsString;
  ParamGeral.CaminhoRelatorioContador    := QR_Busca.fieldbyname('CAMINHO_REL_CONTADOR'   ).AsString;
  ParamGeral.CaminhoRelatorioConsumiveis := QR_Busca.fieldbyname('CAMINHO_REL_CONSUMIVEIS').AsString;

  QR_Busca.close;
end;

function TDM.BuscaBotao(edtCodigo: TCustomEdit; Sql, Titulo_Pesquisa, Titulo_Label: String):String;
begin
  if ( edtCodigo.ClassType = TLabeledDBEdit ) then
  begin
    if (edtCodigo as TLabeledDBEdit).ReadOnly then exit;

    (edtCodigo as TLabeledDBEdit).pesquisaSQL.Clear;
    (edtCodigo as TLabeledDBEdit).pesquisaSQL.Add(Sql);
    Application.CreateForm(TfrmPadraoPesquisas, frmPadraoPesquisas);
    (edtCodigo as TLabeledDBEdit).FrmPesquisaFK := frmPadraoPesquisas;
  end
  else
    if ( edtCodigo.ClassType = TGigatronLblEdit ) then
    begin
      if (edtCodigo as TGigatronLblEdit).ReadOnly then exit;

      (edtCodigo as TGigatronLblEdit).pesquisaSQL.Clear;
      (edtCodigo as TGigatronLblEdit).pesquisaSQL.Add(Sql);
      Application.CreateForm(TfrmPadraoPesquisas, frmPadraoPesquisas);
      (edtCodigo as TGigatronLblEdit).FrmPesquisaFK := frmPadraoPesquisas;
    end;
end;

function TDM.BuscaCDS(cds: TClientDataSet; Sql: String): Boolean;
begin
  Result := True;
  cds.Close;
  cds.CommandText := Sql;
  try
    cds.Open;
  except
    with TStringList.Create do
    begin
      Text := cds.CommandText;
      SaveToFile('SQLError.SQL');
    end;
  end;
  if ( cds.IsEmpty ) then
    Result := False;
end;

function TDM.BuscaQry(qry: TSQLQuery; Sql: String): Boolean;
begin
  Result := True;
  Qry.Close;
  Qry.SQL.Text := Sql;
  Qry.Open;
  if ( Qry.IsEmpty ) then
    Result := False;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var caminho: String;
begin
  with Conn do
  begin
    caminho := ExtractFilePath(Application.ExeName) + '\' + 'OfficeColor.ini';
    Conn.Params.LoadFromFile(caminho);
    Conn.Open;
  end;
  DadosUsu.Login := 'admin';
  DadosUsu.Grupo := '1';

  AtualizaParametros;

///////////////////////
///
///  STRING EXIT
///
///////////////////////
  strExitUsuario :=
  ' SELECT               ' +
  '   U.LOGIN,           ' +
  '   GRP.DESC_USR_GRUPO ' +
  ' FROM USUARIOS U      ' +
  '   INNER JOIN USUARIOS_GRUPOS GRP ON ' +
  '     U.COD_GRUPO = GRP.COD_GRUPO     ' +
  ' WHERE U.LOGIN =      ';

  strExitImpressora :=
  ' SELECT                ' +
  '   IMP.ID AS "Código", ' +
  '   IMP.MARCA || '' - '' || IMP.NOME AS "Descrição" ' +
  ' FROM IMPRESSORAS IMP  ' +
  ' WHERE IMP.ID =        ';

  strExitMunicipio :=
  ' SELECT                                        ' + #13 +
  '   CAST(M.COD_CIDADE AS VARCHAR(07)) "Código", ' + #13 +
  '   CAST(M.NOME_CIDADE AS VARCHAR(35)) "Nome"   ' + #13 +
  ' FROM CIDADES M                                ' + #13 +
  ' WHERE M.COD_CIDADE =                          ' + #13 ;

  strExitCliente :=
  ' SELECT                   ' +
  '   C.ID_CLIENTE "Código", ' +
  '   C.NOME "Nome"          ' +
  ' FROM CLIENTES C          ' +
  ' WHERE C.ID_CLIENTE =     ' ;

  strExitConsumiveis :=
  ' SELECT                      ' +
  '   C.ID "Código",            ' +
  '   C.DESC_CONSUMIVEL "Nome"  ' +
  ' FROM CONSUMIVEIS C          ' +
  ' WHERE C.ID =                ' ;

///////////////////////
///
///  STRING BOTÃO
///
///////////////////////
  strBotaoMunicipio  :=
  ' SELECT                                        ' + #13 +
  '   CAST(M.COD_CIDADE AS VARCHAR(07)) "Código", ' + #13 +
  '   CAST(M.NOME_CIDADE AS VARCHAR(35)) "Nome",  ' + #13 +
  '   CAST(M.UF AS VARCHAR(20)) "Estado"          ' + #13 +
  ' FROM CIDADES M                                ' + #13 +
  ' WHERE NOME_CIDADE LIKE :TEXTO                 ' + #13 +
  ' ORDER BY M.NOME_CIDADE                        ' ;

  strBotaoUsuario  :=
  ' SELECT                                                ' + #13 +
  '   CAST(U.LOGIN AS VARCHAR(20)) AS "Login",            ' + #13 +
  '   CAST(GRP.DESC_USR_GRUPO AS VARCHAR(40)) AS "Grupo"  ' + #13 +
  ' FROM USUARIOS U                                       ' + #13 +
  '   INNER JOIN USUARIOS_GRUPOS GRP ON                   ' + #13 +
  '     U.COD_GRUPO = GRP.COD_GRUPO                       ' + #13 +
  ' WHERE U.LOGIN LIKE :TEXTO                             ' + #13 +
  ' ORDER BY U.LOGIN                                      ' ;

  strBotaoCliente :=
  ' SELECT                                                ' + #13 +
  '   C.ID_CLIENTE "Código",                              ' + #13 +
  '   C.NOME "Nome"                                       ' + #13 +
  ' FROM CLIENTES C                                       ' + #13 +
  ' WHERE C.NOME LIKE :TEXTO                              ' + #13 +
  ' ORDER BY C.NOME                                       ' ;

  strBotaoImpressora  :=
  ' SELECT                                                ' + #13 +
  '   IMP.ID AS "Login",                                  ' + #13 +
  '   IMP.MARCA || '' - '' || IMP.NOME AS "Descrição"     ' + #13 +
  ' FROM IMPRESSORAS IMP                                  ' + #13 +
  ' WHERE IMP.NOME LIKE :TEXTO                            ' + #13 +
  ' ORDER BY IMP.NOME                                     ' ;

  strBotaoConsumiveis  :=
  ' SELECT                                               ' + #13 +
  '   C.ID AS "Código",                                  ' + #13 +
  '   IMP.MARCA || '' - '' || IMP.NOME AS "Impressora",  ' + #13 +
  '   C.DESC_CONSUMIVEL "Descrição"                      ' + #13 +
  ' FROM CONSUMIVEIS C                                   ' + #13 +
  '   INNER JOIN IMPRESSORAS IMP                         ' + #13 +
  '     ON C.ID_IMPRESSORA = IMP.ID                      ' + #13 +
  ' WHERE C.DESC_CONSUMIVEL LIKE :TEXTO                  ' + #13 +
  ' ORDER BY C.DESC_CONSUMIVEL                           ' ;

end;

function TDM.IncCodigo(Tabela, Campo: string; where: String = ''): Integer;
begin
  QR_Busca.Close;
  QR_Busca.SQL.Text := 'SELECT MAX('+campo+')+1 as codigo FROM ' +Tabela+ ' ' +where;
  QR_Busca.Open;

  if QR_Busca.FieldByName('CODIGO').IsNull then Result := 1
  else Result := QR_Busca.FieldByName('CODIGO').AsInteger;
  QR_Busca.Close;
end;

function TDM.Salvar(cds: TClientDataSet): Integer;
begin
  try
    cds.Post;
    cds.ApplyUpdates(-1);
    Result := 1;
  Except
    on E:Exception do
    begin
      cds.Cancel;
      //('Ocorreu um erro ao tentar salvar o registro!', 'Confirmação', mb_YesNo+mb_IconInformation+mb_DefButton2);
      Result := 0;
    end;
  end;
end;

function TDM.Pesquisa(const pSQL: String; const pTituloForm: String = ''; const pTituloLabel: String = '';
  const pColRet: Integer = 0): string;
begin
  Result := '';
  Retorno_Pesquisa := '';
  Pos_Ret_Pesquisa := pColRet;
  Application.CreateForm(TfrmPadraoPesquisas, frmPadraoPesquisas);
  if ( pTituloLabel <> '' ) then
//    frmPadraoPesquisas.lblConteudo.Caption := pTituloLabel;
  frmPadraoPesquisas.Caption := pTituloForm;
  DM.cdsPesquisasGeral.Close;
  DM.cdsPesquisasGeral.CommandText := pSQL;

  frmPadraoPesquisas.ShowModal;
  if ( Trim(Retorno_Pesquisa) <> '' ) then
    Result := Retorno_Pesquisa
  else
    DM.cdsPesquisasGeral.Close;
end;

function TDM.PesquisaOS(const pSQL: String; const pTituloForm: String = ''; const pTituloLabel: String = '';
  const pColRet: Integer = 0): string;
begin
  Result := '';
  Retorno_Pesquisa := '';
  Pos_Ret_Pesquisa := pColRet;
  Application.CreateForm(TfrmPesquisaOS, frmPesquisaOS);
  if ( pTituloLabel <> '' ) then
  frmPesquisaOS.Caption := pTituloForm;
  DM.cdsPesquisasGeral.Close;
  DM.cdsPesquisasGeral.CommandText := pSQL;

  frmPesquisaOS.ShowModal;
  if ( Trim(Retorno_Pesquisa) <> '' ) then
    Result := Retorno_Pesquisa
  else
    DM.cdsPesquisasGeral.Close;
end;

procedure TDM.BuscaExit(edtCod, edtDesc: TCustomEdit; Sql: String; Fechar_Cds: Boolean = True; Emitir_Aviso_Nao_Encontado : Boolean = True);
begin
  if (trim(edtCod.Text) <> '') then
  begin
    if not BuscaQry(QR_Busca,sql) then
    begin
      edtDesc.Text := '';

      // Verificar se a pesquisa deve validar e executar alguma ação.
      if Emitir_Aviso_Nao_Encontado then
      begin
        aviso('Registro não Encontrado!!!');

        edtCod.Text := '';
        if (edtCod.ClassType = TLabeledDBEdit) and
           (TLabeledDBEdit(edtCod).DataSource.DataSet.state in [dsinsert,dsedit]) then
          TLabeledDBEdit(edtCod).DataSource.DataSet.FieldByName(TLabeledDBEdit(edtCod).DataField).value := '';

        edtCod.SetFocus;
      end;
    end
    else
    begin
      edtDesc.Clear;
      while not(QR_Busca.Eof) do
      begin
        if (trim(edtDesc.Text) = '') then
          edtDesc.Text := QR_Busca.Fields[1].AsString
        else
          edtDesc.Text := edtDesc.Text +', '+ QR_Busca.Fields[1].AsString;
        QR_Busca.Next;
      end;
      QR_Busca.first;
    end;
  end
  else
    EdtDesc.Text := '';
  TForm(edtCod.Owner).KeyPreview := True;
  if fechar_cds then QR_Busca.Close;
end;

procedure TDM.BuscaExitCliente(edtCod, edtDesc: TCustomEdit;
  Fechar_Cds: Boolean);
begin
  DM.BuscaExit(edtCod, edtDesc, strExitCliente + QuotedStr(edtCod.Text), Fechar_Cds);
end;

procedure TDM.BuscaExitConsumiveis(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean);
begin
  DM.BuscaExit(edtCod, edtDesc, strExitConsumiveis + QuotedStr(edtCod.Text), Fechar_Cds);
end;

procedure TDM.BuscaExitImpressora(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean = True);
begin
  DM.BuscaExit(edtCod, edtDesc, strExitImpressora + QuotedStr(edtCod.Text), Fechar_Cds);
end;

procedure TDM.BuscaExitItens(edtTipo, edtItem, edtDesc: TCustomEdit;
  Fechar_Cds: Boolean);
var
  texto: String;
begin
  if (Trim(edtTipo.Text) = '') or (Trim(edtItem.Text) = '') then
  begin
    aviso('Informe um Item!!!!');
    edtTipo.SetFocus;
    Exit;
  end;
  texto :=
    ' SELECT                                          ' + #13 +
    '   ITEM.ID_TIPO,                                 ' + #13 +
    '   ITEM_TIPO.DESC_TIPO || '' - '' || ITEM.DESC_ITEM, ' + #13 +
    '   ITEM.ID_ITEM                                 ' + #13 +
    ' FROM ITEM                                       ' + #13 +
    '      INNER JOIN ITEM_TIPO ON                    ' + #13 +
    '      ( ITEM.ID_TIPO = ITEM_TIPO.ID_TIPO )       ' + #13 +
    ' WHERE ITEM.ID_TIPO = ' + edtTipo.Text +
    '   AND ITEM.ID_ITEM = ' + edtItem.Text ;

  if (Trim(edtTipo.Text) <> '') and (Trim(edtTipo.Text) <> '') then
    DM.BuscaExit(edtTipo, edtDesc, texto, Fechar_Cds)
  else
    edtDesc.Text := '';

end;

procedure TDM.BuscaExitMunicipio(edtCod, edtDesc: TCustomEdit;
  Fechar_Cds: Boolean);
begin
  DM.BuscaExit(edtCod, edtDesc, strExitMunicipio + QuotedStr(edtCod.Text), Fechar_Cds);
end;

procedure TDM.BuscaExitUsuario(edtCod, edtDesc: TCustomEdit; Fechar_Cds: Boolean);
begin
  DM.BuscaExit(edtCod, edtDesc, strExitUsuario + QuotedStr(edtCod.Text), Fechar_Cds);
end;

procedure TDM.BuscaBotaoCliente(edtCodigo: TCustomEdit);
begin
  DM.BuscaBotao(edtCodigo, strBotaoCliente, 'Pesquisa de Usuarios', 'Digite o nome do cliente.' );
end;

procedure TDM.BuscaBotaoConsumiveis(edtCodigo: TCustomEdit);
begin
  DM.BuscaBotao(edtCodigo, strBotaoConsumiveis, 'Pesquisa de Consumíveis', 'Digite o nome do consumível.' );
end;

procedure TDM.BuscaBotaoUsuario(edtCodigo: TCustomEdit);
begin
  DM.BuscaBotao(edtCodigo, strBotaoUsuario, 'Pesquisa de Usuarios', 'Digite o login do usuario.' );
end;

procedure TDM.BuscaBotaoImpressora(edtCodigo: TCustomEdit);
begin
  DM.BuscaBotao(edtCodigo, strBotaoImpressora, 'Pesquisa de Impressoras', 'Digite o nome da impressora.' );
end;

procedure TDM.BuscaBotaoItens(edtTipo, edtItem: TCustomEdit);
var
  texto : string;
begin
  texto :=
    ' SELECT                                              ' + #13 +
    '   ITEM.ID_TIPO "Código Tipo",                       ' + #13 +
    '   ITEM.ID_ITEM "Código Item",                       ' + #13 +
    '   ITEM_TIPO.DESC_TIPO || '' - '' || ITEM.DESC_ITEM "Descrição" ' + #13 +
    ' FROM ITEM                                           ' + #13 +
    '      INNER JOIN ITEM_TIPO ON                        ' + #13 +
    '      ( ITEM.ID_TIPO = ITEM_TIPO.ID_TIPO )           ' + #13 +
    ' WHERE ((ITEM_TIPO.DESC_TIPO LIKE :TEXTO) OR (ITEM.DESC_ITEM LIKE :TEXTO)) ' + #13 ;

  if Trim(edtTipo.Text) <> EmptyStr then
    texto := texto + ' AND ITEM.ID_TIPO = ' + edtTipo.Text ;

  DM.BuscaBotao(edtItem, texto, 'Pesquisa de Itens', 'Digite a descrição do item');
end;

procedure TDM.BuscaBotaoMunicipio(edtCodigo: TCustomEdit);
begin
  DM.BuscaBotao(edtCodigo, strBotaoMunicipio, 'Pesquisa de Cidades', 'Digite o nome da cidade.' );
end;

end.
