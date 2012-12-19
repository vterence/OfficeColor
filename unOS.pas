unit unOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, XPMan, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons,
  ExtCtrls, Grids, DBGrids, Mask, DBCtrls, AdvDateTimePicker,
  AdvDBDateTimePicker, ComCtrls, LabeledDBEdit, cxControls, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGroupBox, cxCheckBox, cxDBEdit, cxRadioGroup;

type
  TfrmOS = class(TfrmPadraoCadastro)
    Label2: TLabel;
    Label7: TLabel;
    edtData: TAdvDBDateTimePicker;
    MemoObservações: TDBMemo;
    edtUsuario: TLabeledDBEdit;
    edtCliente: TLabeledDBEdit;
    edtArquivo: TLabeledDBEdit;
    edtQtdPaginas: TLabeledDBEdit;
    edtQtd: TLabeledDBEdit;
    sdsItens: TSQLDataSet;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    lblStatus: TLabel;
    PopupMenu1: TPopupMenu;
    mExcluirItem: TMenuItem;
    mExcluirTodos: TMenuItem;
    edtImpressora: TLabeledDBEdit;
    Panel1: TPanel;
    btnItens: TcxButton;
    gridItens: TDBGrid;
    Label1: TLabel;
    edtItem: TGigatronLblEdit;
    edtTipo: TGigatronLblEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    grpFinalidade: TcxDBRadioGroup;
    edtValor: TLabeledDBEdit;
    procedure FormShow(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure cdsAfterClose(DataSet: TDataSet);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure edtItemExit(Sender: TObject);
    procedure LabeledDBEdit1SubButtonPesquisaClick(Sender: TObject);
    procedure edtUsuarioEnter(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteSubButtonPesquisaClick(Sender: TObject);
    procedure btnItensClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure cdsDetBeforeInsert(DataSet: TDataSet);
    procedure cdsDetAfterInsert(DataSet: TDataSet);
    procedure gridItensDblClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure mExcluirTodosClick(Sender: TObject);
    procedure mExcluirItemClick(Sender: TObject);
    procedure edtItemFrmPesquisaClose(Sender: TObject);
    procedure edtItemSubButtonPesquisaClick(Sender: TObject);
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure btnFaturarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atribuir_Busca      ; override;
    function ValidarDados:boolean ; override;
    procedure Abrir_Itens_OS(codigo_os: String);
    procedure Conf_Tela(Etapa: smallint);
  end;

var
  frmOS: TfrmOS;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unPadrao;

procedure TfrmOS.Abrir_Itens_OS(codigo_os: String);
var texto: String;
begin

  texto :=
    ' SELECT                                              ' +
    '   ITEM_OS.ID,                                       ' +
    '   TIPO.DESC_TIPO || '' '' || ITEM.DESC_ITEM AS DESC ' +
    ' FROM OS_ITENS ITEM_OS                               ' +
    '   INNER JOIN ITEM ON                                ' +
    '     ITEM_OS.ID_TIPO = ITEM.ID_TIPO AND              ' +
    '     ITEM_OS.ID_ITEM = ITEM.ID_ITEM                  ' +
    '   INNER JOIN ITEM_TIPO TIPO ON                      ' +
    '     ITEM.ID_TIPO    = TIPO.ID_TIPO                   ' +
    ' WHERE ITEM_OS.COD_OS = ' + codigo_os                  ;

  DM.BuscaCDS(cdsItens, texto);

end;

procedure TfrmOS.Atribuir_Busca;
begin
  inherited;
  sql_busca :=  'SELECT * FROM OS WHERE COD_OS = '+ QuotedStr(edtCodigo.Text);
end;

procedure TFrmOS.btnBuscaClick(Sender: TObject);
begin
  if ( Trim(edtCodigo.Text) = '' ) or ( Trim(edtCodigo.Text) = '0' ) then
    edtCodigo.Text := DM.PesquisaOS(Sql_Pesquisa, Titulo_Pesquisa, Titulo_Label, 0);
  if ( edtCodigo.Text <> '' ) and ( Trim(edtCodigo.Text) <> '0' ) then
  begin
    Atribuir_Busca;
    if ( DM.BuscaCDS(cds, Sql_Busca) ) then
    begin
      Conf_Tela(ctEdit);
      cds.Edit;
      Abrir_Itens_OS(cds.FieldByName('COD_OS').AsString);
      if cds.FieldByName('STATUS').AsInteger > 0 then
      begin
        PainelDados.Enabled := False;
        btnConfirmar.Enabled := False;
        btnExcluir.Enabled := False;
        btnRetornar.Enabled := True;
        btnRetornar.SetFocus;
      end;
    end
    else
    begin
      Aviso('Registro Não Encontrado!');
      edtCodigo.Clear;
      edtCodigo.SetFocus;
      Conf_Tela(ctSearch);
    end;
  end;
end;

procedure TfrmOS.btnConfirmarClick(Sender: TObject);
begin
  if ( ValidarDados ) then
  begin
    if cds.State in [dsEdit, dsInsert] then
      DM.Salvar(cds);
    Conf_Tela(ctSearch);
  end;
end;

procedure TfrmOS.btnFaturarClick(Sender: TObject);
begin
  inherited;
  Try
    cds.Edit;
    cds.FieldByName('DATA_FATURAMENTO').AsDateTime := now;
    cds.FieldByName('STATUS').AsInteger            := 3;
    DM.Salvar(cds);
    Conf_Tela(ctSearch);
  Except
    on e: Exception do
    begin
      Erro('Não foi possível alterar o status da OS ' + edtCodigo.Text + #13 + 'Segue baixo o erro retornado: ' + e.Message);
      Conf_Tela(ctSearch);
      exit;
    end;
  end;
end;

procedure TfrmOS.btnItensClick(Sender: TObject);
begin
  inherited;
  if (edtTipo.Text = '') or (edtItem.Text = '') then
  begin
    Aviso('Item nao pode ficar em branco!!!');
    edtTipo.SetFocus;
    Exit;
  end;

  if ( ValidarDados ) then
  begin
    if cds.state in [dsedit,dsinsert] then
    begin
      DM.Salvar(cds);
      cds.edit;
    end;
    cdsDet.Append;
    cdsDet.FieldByName('ID_ITEM').AsString := edtItem.Text;
    DM.Salvar(cdsDet);
    Abrir_Itens_OS(edtCodigo.Text);
    edtTipo.Text := '';
    edtItem.Text := '';
    edtItem.DescrEdit.Text := '';
    edtTipo.SetFocus;
  end;
end;

procedure TfrmOS.btnNovoClick(Sender: TObject);
begin
  inherited;
  if edtCodigo.Text = '' then
  begin
    edtCodigo.Text := IntToStr(DM.IncCodigo('OS', 'COD_OS'));
    cds.Append;
    cds.FieldByName('COD_OS').AsString := edtCodigo.Text;
    Conf_Tela(ctNew);
  end;
end;

procedure TfrmOS.btnRetornarClick(Sender: TObject);
begin
  Conf_Tela(ctSearch);
  cdsDet.Cancel;
end;

procedure TfrmOS.cdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Close;
end;

procedure TfrmOS.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Open;
  edtClienteExit(Self);
  edtImpressoraExit(Self);
  TNumericField(DataSet.FieldByName('VALOR')).DisplayFormat := '###,##0.00';
end;

procedure TfrmOS.cdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsDet.FieldByName('COD_OS').AsString  := edtCodigo.Text;
  cdsDet.FieldByName('ID').AsInteger     := DM.IncCodigo('OS_ITENS', 'ID', 'WHERE COD_OS = ' + edtCodigo.Text);
  cdsDet.FieldByName('ID_TIPO').AsString := edtTipo.Text;
end;

procedure TfrmOS.cdsDetBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if cds.state in [dsedit,dsinsert] then
  begin
    DM.Salvar(cds);
    cds.edit;
  end;
end;

procedure TfrmOS.cdsNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('DATA'             ).AsDateTime  := Now;
  DataSet.FieldByName('STATUS'           ).AsInteger := 0;
  DataSet.FieldByName('FLAG_FRENTE_VERSO').AsInteger := 0;
  DataSet.FieldByName('FLAG_FINALIDADE'  ).AsInteger := 0;
  DataSet.FieldByName('VALOR'            ).AsFloat   := 0.00;
end;

procedure TfrmOS.Conf_Tela(Etapa: smallint);
begin
  case Etapa of
    ctSearch:
    begin
      if cdsDet.State in [dsEdit, dsInsert] then
        DM.Salvar(cdsDet);
      edtCliente.DescrEdit.Text := '';
      edtImpressora.DescrEdit.Text := '';
      edtTipo.Text := '';
      edtItem.Text := '';
      lblStatus.Visible := False;
      cdsItens.Close;
    end;
    ctNew, ctEdit:
    begin
      Abrir_Itens_OS(edtCodigo.Text);
      edtUsuarioExit(Self);

      case cds.FieldByName('STATUS').AsInteger of
        0: lblStatus.Caption := 'EM ABERTO';
        1: lblStatus.Caption := 'EM EXECUÇÃO';
        2: lblStatus.Caption := 'ENCERRADA';
        3: lblStatus.Caption := 'FATURADA';
      end;

      lblStatus.Visible := True;
    end;
  end;
  inherited;
end;


procedure TfrmOS.FormShow(Sender: TObject);
begin
  inherited;
  sql_insercao := 'SELECT * FROM OS WHERE COD_OS IS NULL';
  sql_pesquisa :=
  ' SELECT                                       '+
  ' OS.COD_OS     "Id",                          '+
  ' OS.DATA       "Data",                        '+
  ' C.NOME        "Cliente",                     '+
  ' OS.ARQUIVO    "Arquivo",                     '+
  ' OS.USUARIO    "Usuario"                      '+
  ' FROM OS                                      '+
  '   INNER JOIN CLIENTES C                      '+
  '     ON C.ID_CLIENTE = OS.ID_CLIENTE          '+
  ' WHERE C.NOME LIKE :TEXTO                     ';

  titulo_pesquisa := 'Pesquisa de Ordens de Serviço';
  sql_busca := 'SELECT * FROM OS WHERE COD_OS = ';
  titulo_label := 'Digite a Descrição do Cliente';
end;

procedure TfrmOS.gridItensDblClick(Sender: TObject);
begin
  inherited;
  if not (cdsItens.IsEmpty) then
  begin

  end;

end;

procedure TfrmOS.LabeledDBEdit1SubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoUsuario(edtUsuario);
end;

procedure TfrmOS.edtClienteExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitCliente(edtCliente, edtCliente.DescrEdit);
end;

procedure TfrmOS.edtClienteSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoCliente(edtCliente);
end;

procedure TfrmOS.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
end;

procedure TfrmOS.edtImpressoraSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;

procedure TfrmOS.edtItemExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitItens(edtTipo, edtItem, edtItem.DescrEdit);
end;

procedure TfrmOS.edtItemFrmPesquisaClose(Sender: TObject);
begin
  inherited;
  if edtItem.ValoresRetorno.Count > 2 then
  begin
    edtTipo.Text := edtItem.ValoresRetorno[0];
    edtItem.Text := edtItem.ValoresRetorno[1];
    edtItem.DescrEdit.Text := edtItem.ValoresRetorno[2];
  end;
end;

procedure TfrmOS.edtItemSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoItens(edtTipo, edtItem);
end;

procedure TfrmOS.edtUsuarioEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TfrmOS.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitUsuario(edtUsuario, edtUsuario.DescrEdit);
end;

procedure TfrmOS.mExcluirItemClick(Sender: TObject);
begin
  inherited;
  with cdsDet do
  begin
    if Locate('ID', cdsItens.FieldByName('ID').AsString, []) then
    begin
      Delete;
      ApplyUpdates(-1);
    end;
  end;
  Abrir_Itens_OS(edtCodigo.Text);
end;

procedure TfrmOS.mExcluirTodosClick(Sender: TObject);
begin
  inherited;
  with cdsDet do
  begin
    while not IsEmpty do
      Delete;
    ApplyUpdates(-1);
  end;
  Abrir_Itens_OS(edtCodigo.Text);
end;

function TfrmOS.ValidarDados: boolean;
begin
  Result := true;
  if edtCliente.Text = '' then
  begin
    Aviso('É necessário informar um cliente!!!');
    edtCliente.SetFocus;
    Result := false;
    exit;
  end;

  if edtImpressora.Text = '' then
  begin
    Aviso('É necessário informar uma impressora!!!');
    edtImpressora.SetFocus;
    Result := false;
    exit;
  end;

  if edtUsuario.Text = '' then
  begin
    Aviso('É necessário informar um usuario!!!');
    edtUsuario.SetFocus;
    Result := false;
    exit;
  end;

  if edtArquivo.Text = '' then
  begin
    Aviso('É necessário informar um usuario!!!');
    edtArquivo.SetFocus;
    Result := false;
    exit;
  end;
end;

initialization

RegisterClass(TfrmOS);

end.
