unit unCadGruposUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, XPMan, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons,
  ExtCtrls, Mask, DBCtrls, LabeledDBEdit, Grids, DBGrids;

type
  TfrmCadGruposUsuarios = class(TfrmPadraoCadastro)
    edtDescricao: TLabeledDBEdit;
    sdsItens: TSQLDataSet;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    sdsAcessos: TSQLDataSet;
    dspAcessos: TDataSetProvider;
    cdsAcessos: TClientDataSet;
    dsAcessos: TDataSource;
    grade: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cdsAfterClose(DataSet: TDataSet);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure gradeCellClick(Column: TColumn);
    procedure gradeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure gradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Conf_Tela(Etapa: Smallint = 0); override;
    function ValidarDados: Boolean; override;
    procedure Conf_Registro; override;
  end;

var
  frmCadGruposUsuarios: TfrmCadGruposUsuarios;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas, unPrincipal;

procedure TfrmCadGruposUsuarios.btnExcluirClick(Sender: TObject);
begin
  if ( Confirma('Deseja Excluir Este Registro?') ) then
  begin
    cdsItens.First;
    while ( not cdsItens.Eof ) do
      cdsItens.Delete;
    cdsItens.ApplyUpdates(-1);
    if ( not DM.Excluir(cds) ) then
      Aviso('Este Registro Não Pode Ser Excluído. Existem Vínculos com Outros Registros!');
    Conf_Tela;
  end;
end;

procedure TfrmCadGruposUsuarios.btnNovoClick(Sender: TObject);
begin
  inherited;
  if ( edtCodigo.Text = '' ) then
  begin
    cds.FieldByName('COD_GRUPO').AsInteger := DM.IncCodigo('USUARIOS_GRUPOS','COD_GRUPO');
    edtCodigo.Text := cds.FieldByName('COD_GRUPO').AsString;
  end
  else
    cds.FieldByName('COD_GRUPO').AsString := edtCodigo.Text;
end;

procedure TfrmCadGruposUsuarios.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadGruposUsuarios.cdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsItens.Close;
  cdsAcessos.Close;
end;

procedure TfrmCadGruposUsuarios.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsItens.Open;
  cdsAcessos.Open;
end;

procedure TfrmCadGruposUsuarios.Conf_Registro;
begin
  cdsAcessos.DisableControls;
  cdsAcessos.First;
  while ( not cdsAcessos.Eof ) do
  begin
    if ( cdsItens.Locate('COD_ACESSO',VarArrayOf([cdsAcessos.FieldByName('COD_ACESSO').AsInteger]), [loCaseInsensitive]) ) then
    begin
      cdsAcessos.Edit;
      cdsAcessos.FieldByName('SELECAO').AsInteger := 1;
      cdsAcessos.Post;
    end;
    cdsAcessos.Next;
  end;
  cdsAcessos.First;
  cdsAcessos.EnableControls;
end;

procedure TfrmCadGruposUsuarios.Conf_Tela(Etapa: Smallint);
begin
  inherited;
  if ( Etapa = 0 ) then
    sql_busca := 'SELECT * FROM USUARIOS_GRUPOS WHERE COD_GRUPO = ';
end;

procedure TfrmCadGruposUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCadGruposUsuarios.FormShow(Sender: TObject);
begin
  sql_insercao := 'SELECT * FROM USUARIOS_GRUPOS WHERE COD_GRUPO IS NULL '   ;
  sql_pesquisa :=
    'SELECT                                                ' + #13 +
    'UG.COD_GRUPO as "Código",                             ' + #13 +
    'CAST(UG.DESC_USR_GRUPO AS VARCHAR(40)) as "Descrição" ' + #13 +
    'FROM USUARIOS_GRUPOS UG                               ' + #13 +
    'WHERE UG.DESC_USR_GRUPO LIKE :TEXTO                   ';
  titulo_pesquisa := 'Pesquisa de Grupos de Usuários';
  titulo_label := 'Digite a Descrição do Grupo' ;

  DM.BuscaCDS(cdsAcessos,
  ' SELECT                          '+
  '    0 AS SELECAO,                '+
  '    GRP.*,                       '+
  '    MOD.DESC_MODULO              '+
  '  FROM GRUPOS_ACESSOS GRP        '+
  '    INNER JOIN MODULOS MOD ON    '+
  '    MOD.MODULO = GRP.MODULO      '+
  '  ORDER BY                       '+
  '    GRP.DESC_GRUPO_ACESSO        ');
  inherited;
  frmCadGruposUsuarios := Self;
end;

procedure TfrmCadGruposUsuarios.gradeCellClick(Column: TColumn);
begin
  inherited;
  Marca_Desmarca(cdsAcessos, Column.FieldName);
end;

procedure TfrmCadGruposUsuarios.gradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if cdsAcessos.Active then
  begin
    if (UpperCase(Column.FieldName) = 'SELECAO') then
    begin
      grade.Canvas.FillRect(rect);
      if cdsAcessos.FieldByName('SELECAO').AsInteger = 0 then
        frmPrincipal.ImageList1.Draw( (Sender as TDBGrid).Canvas, Rect.Left + 4, Rect.Top, 2) // 0 Indica o índice da imagem no imagelist.
      else
        frmPrincipal.ImageList1.Draw( (Sender as TDBGrid).Canvas, Rect.Left + 4, Rect.Top, 3); // 0 Indica o índice da imagem no imagelist.
    end;
  end;
end;

procedure TfrmCadGruposUsuarios.gradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( Key = VK_SPACE ) then
    gradeCellClick(grade.Columns.Items[0]);
  if ( Key = VK_RETURN ) then
    btnConfirmar.SetFocus;
end;

function TfrmCadGruposUsuarios.ValidarDados: Boolean;
begin
  ValidarDados := False;
  if ( edtDescricao.Text = '' ) then
  begin
    Aviso('O Campo "Descrição"  Deve Ser Preenchido!');
    edtDescricao.SetFocus;
    Exit;
  end;
  ValidarDados := True;
  // grava os filhos aqui
  if ( cds.State in [dsInsert, dsEdit] ) then
    DM.Salvar(cds);
  cdsItens.First;
  while ( not cdsItens.Eof ) do
    cdsItens.Delete;
  cdsItens.ApplyUpdates(-1);
  cdsAcessos.First;
  while ( not cdsAcessos.Eof ) do
  begin
    if ( cdsAcessos.FieldByName('SELECAO').AsInteger = 1 ) then
    begin
      cdsItens.Append;
      cdsItens.FieldByName('COD_GRUPO' ).AsInteger := cds.FieldByName('COD_GRUPO' ).AsInteger;
      cdsItens.FieldByName('COD_ACESSO').AsInteger := cdsAcessos.FieldByName('COD_ACESSO').AsInteger;
      cdsItens.Post;
    end;
    cdsAcessos.Next;
  end;
  cdsItens.ApplyUpdates(-1);

end;

initialization

RegisterClass(TfrmCadGruposUsuarios);

end.
