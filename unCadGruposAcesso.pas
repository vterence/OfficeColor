unit unCadGruposAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, XPMan, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons,
  ExtCtrls, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, ComCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Mask, DBCtrls, LabeledDBEdit;

type
  PTreeMenu = ^TTreeMenu;
  TTreeMenu = record
    Selecionado: Boolean;
    NomeMenu: String;
end;

type
  TAbrirMenu  = procedure (tipoMenu: Word) of object;
  TfrmCadGruposAcesso = class(TfrmPadraoCadastro)
    sdsItens: TSQLDataSet;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    edtDescricao: TLabeledDBEdit;
    cmbModulo: TcxDBLookupComboBox;
    Tree: TTreeView;
    PopupMenu1: TPopupMenu;
    MarcarTodos1: TMenuItem;
    MarcarTodososFilhosdoItem1: TMenuItem;
    sdsModulos: TSQLDataSet;
    dspModulos: TDataSetProvider;
    cdsModulos: TClientDataSet;
    dsModulos: TDataSource;
    btnMenu: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure MarcarTodos1Click(Sender: TObject);
    procedure MarcarTodososFilhosdoItem1Click(Sender: TObject);
    procedure cmbModuloClick(Sender: TObject);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure cdsAfterClose(DataSet: TDataSet);
    procedure TreeEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure TreeKeyPress(Sender: TObject; var Key: Char);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure TreeClick(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    TempPointer : PTreeMenu;
    procedure MontaTreeView(Cod_Menu, Ordem, Ordem_Papai_Dele: String; Menu: TTreeNode);
    procedure BuscarFilhos(var Qry : TSQLQuery; Cod_Menu: String);
    procedure MarcarItem(Marca: Boolean);
    procedure Marcar_Papai(Menu: TTreeNode);
  public
    { Public declarations }
    function ValidarDados: Boolean; override;
    procedure Conf_Tela(Etapa: Smallint = 0); override;
    procedure Conf_Registro; override;
    procedure MarcarTodos(marcar: smallint = 0);
    procedure Marcar_Filhos(Menu: TTreeNode;marcar:integer);
    { Public declarations }
  end;

var
  frmCadGruposAcesso: TfrmCadGruposAcesso;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas, unPrincipal;

procedure TfrmCadGruposAcesso.btnExcluirClick(Sender: TObject);
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

procedure TfrmCadGruposAcesso.btnMenuClick(Sender: TObject);
var
  ItemTree : TTreeNode;
begin
  inherited;
  New(TempPointer);
  TempPointer.Selecionado := False;
  TempPointer.NomeMenu := cdsModulos.FieldByName('MODULO').AsString;
  ItemTree := Tree.Items.AddObject(nil, cdsModulos.FieldByName('ORDEM').AsString+'. '+cdsModulos.FieldByName('DESC_MODULO').AsString, TempPointer);
  MontaTreeView('', cdsModulos.FieldByName('ORDEM').AsString, '', ItemTree);
  Tree.FullExpand;
end;

procedure TfrmCadGruposAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  if ( edtCodigo.Text = '' ) then
  begin
    cds.FieldByName('COD_ACESSO').AsInteger := DM.IncCodigo('GRUPOS_ACESSOS','COD_ACESSO');
    edtCodigo.Text := cds.FieldByName('COD_ACESSO').AsString;
  end
  else
    cds.FieldByName('COD_ACESSO').AsString := edtCodigo.Text;
end;

procedure TfrmCadGruposAcesso.BuscarFilhos(var Qry: TSQLQuery;
  Cod_Menu: String);
begin
  Qry := TSQLQuery.Create(nil);
  Qry.SQLConnection := DM.Conn;
  Qry.SQL.Text :=
    'SELECT                  ' + #13 +
    '  MENU.MODULO,          ' + #13 +
    '  MENU.NOME_MENU,       ' + #13 +
    '  MENU.DESC_MENU,       ' + #13 +
    '  MENU.ORDEM            ' + #13 +
    'FROM MENUS MENU ';
  if ( Cod_Menu <> '' ) then
    Qry.SQL.Text := Qry.SQL.Text + #13 +
      'WHERE MENU.PAPAI_NOME_MENU = ' + QuotedStr(Cod_Menu)+ #13
  else
    Qry.SQL.Text := Qry.SQL.Text + #13 +
      'WHERE MENU.PAPAI_NOME_MENU IS NULL' + #13 ;

  Qry.SQL.Text := Qry.SQL.Text + '  AND MENU.MODULO = ' + QuotedStr(cdsModulos.FieldByName('MODULO').AsString);
  Qry.SQL.Text := Qry.SQL.Text + #13 +
    'ORDER BY     ' + #13 +
    '  MENU.ORDEM ';
  Qry.Open;

end;

procedure TfrmCadGruposAcesso.cdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsItens.Close;
end;

procedure TfrmCadGruposAcesso.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsItens.Open;
  cdsModulos.Open;
end;

procedure TfrmCadGruposAcesso.cmbModuloClick(Sender: TObject);
begin
  inherited;
  cdsModulos.First;
  while ( not cdsModulos.Eof ) do
  begin
    if ( cdsModulos.RecNo = (cmbModulo.ItemIndex + 1) ) then
      Break;
    cdsModulos.Next;
  end;
  Tree.Items.Clear;
end;

procedure TfrmCadGruposAcesso.Conf_Registro;
var
  i: Integer;
begin
  PainelDados.Enabled := True;
  cmbModulo.SetFocus;
  edtDescricao.SetFocus;
  cmbModulo.Enabled := False;
  btnMenu.Enabled   := False;
  cmbModuloClick(Self);
  btnMenuClick(Self);
  cdsItens.First;
  while ( not cdsItens.Eof ) do
  begin
    for i := 0 to (Tree.Items.Count - 1) do
    begin
      if ( cdsItens.fieldbyname('NOME_MENU').Asstring = PTreemenu(Tree.Items.Item[i].Data).nomeMenu ) then
      begin
        Tree.Items.Item[i].ImageIndex    := 1;
        Tree.Items.Item[i].SelectedIndex := 1;
      end;
    end;
    cdsItens.Next;
  end;
end;

procedure TfrmCadGruposAcesso.Conf_Tela(Etapa: Smallint);
begin
  inherited;
  if ( Etapa = 0 ) then
  begin
    cdsModulos.Close;
    sql_busca := 'SELECT * FROM GRUPOS_ACESSOS WHERE COD_ACESSO = ';
    cmbModulo.Enabled := True;
    btnMenu.Enabled := True;
    Tree.Items.Clear;
    MarcarTodos1.Caption                  := 'Marcar Todos'                  ;
    MarcarTodos1.ImageIndex               := 53                               ;
    MarcarTodososFilhosdoItem1.Caption    := 'Marcar Todos os Filhos do Item';
    MarcarTodososFilhosdoItem1.ImageIndex := 53                               ;
  end;
end;

procedure TfrmCadGruposAcesso.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  cdsItens.Close;
  cdsItens.Open;
end;

procedure TfrmCadGruposAcesso.FormShow(Sender: TObject);
begin
  inherited;
  sql_insercao := 'SELECT * FROM GRUPOS_ACESSOS WHERE COD_ACESSO IS NULL '   ;
  sql_pesquisa :=
    'SELECT                                                          ' +
    '  GRP_ACE.COD_ACESSO as "Código",                               ' +
    '  CAST(GRP_ACE.DESC_GRUPO_ACESSO AS VARCHAR(40)) as "Descrição" ' +
    'FROM GRUPOS_ACESSOS GRP_ACE                                     ' +
    '  LEFT OUTER JOIN MODULOS MOD                                   ' +
    '    ON ( GRP_ACE.MODULO = MOD.MODULO )                          ' +
    'WHERE GRP_ACE.DESC_GRUPO_ACESSO LIKE :TEXTO                     ';
  titulo_pesquisa := 'Pesquisa de Grupos de Acesso';
  titulo_label := 'Digite a Descrição do Grupo' ;

  DM.BuscaCDS(cdsModulos,
    ' SELECT *               '+
    ' FROM MODULOS           '+
    ' ORDER BY MODULO '       );

  inherited;
  frmCadGruposAcesso := Self;
end;

procedure TfrmCadGruposAcesso.MarcarItem(Marca: Boolean);
begin
  if ( Marca ) then
    PTreemenu(Tree.Selected.data).Selecionado := not PTreemenu(Tree.Selected.Data).Selecionado;
  if ( PTreemenu(Tree.Selected.Data).Selecionado ) then
  begin
    Tree.Selected.ImageIndex    := 1;
    Tree.Selected.SelectedIndex := 1;
    Marcar_Papai(Tree.Selected);
  end
  else
  begin
    Tree.Selected.ImageIndex    := 0;
    Tree.Selected.SelectedIndex := 0;
  end;
  Tree.Repaint;
end;

procedure TfrmCadGruposAcesso.MarcarTodos(marcar: smallint);
var i: integer;
begin
   for i := 0 to tree.Items.Count-1 do
   begin
      tree.Items.Item[i].ImageIndex    := marcar;
      tree.Items.Item[i].SelectedIndex := marcar;
   end;
   tree.Repaint;
end;

procedure TfrmCadGruposAcesso.MarcarTodos1Click(Sender: TObject);
begin
  if MarcarTodos1.Caption = 'Marcar Todos' then
  begin
    MarcarTodos(1);
    MarcarTodos1.Caption    := 'Desmarcar Todos';
    MarcarTodos1.ImageIndex := 52;
  end
  else if MarcarTodos1.Caption = 'Desmarcar Todos' then
  begin
    MarcarTodos(0);
    MarcarTodos1.Caption    := 'Marcar Todos';
    MarcarTodos1.ImageIndex := 53;
  end;
end;

procedure TfrmCadGruposAcesso.MarcarTodososFilhosdoItem1Click(Sender: TObject);
begin
  inherited;
  if MarcarTodososFilhosdoItem1.Caption = 'Marcar Todos os Filhos do Item' then
  begin
    Marcar_filhos(Tree.Selected,1);
    MarcarTodososFilhosdoItem1.Caption    := 'Desmarcar Todos os Filhos do Item';
    MarcarTodososFilhosdoItem1.ImageIndex := 52;
  end
  else if MarcarTodososFilhosdoItem1.Caption = 'Desmarcar Todos os Filhos do Item' then
  begin
    Marcar_filhos(Tree.Selected,0);
    MarcarTodososFilhosdoItem1.Caption    := 'Marcar Todos os Filhos do Item';
    MarcarTodososFilhosdoItem1.ImageIndex := 53;
  end;
  Tree.Repaint;
end;

procedure TfrmCadGruposAcesso.Marcar_Filhos(Menu: TTreeNode; marcar: integer);
var i:integer;
begin
  for i := 0 to (Menu.Count-1) do
  begin
    Menu.Item[i].ImageIndex    := marcar;
    Menu.Item[i].SelectedIndex := marcar;
    Marcar_Filhos(Menu.Item[i],marcar);
  end;
end;

procedure TfrmCadGruposAcesso.Marcar_Papai(Menu: TTreeNode);
begin
  if ( Menu.Parent <> nil ) then
  begin
    Menu.Parent.ImageIndex    := 1;
    Menu.Parent.SelectedIndex := 1;
    Marcar_Papai(Menu.parent);
  end;
end;

procedure TfrmCadGruposAcesso.MontaTreeView(Cod_Menu, Ordem,
  Ordem_Papai_Dele: String; Menu: TTreeNode);
var
  Qry: TSQLQuery;
  Item: TTreeNode;
  Descricao: String;
begin
  BuscarFilhos(Qry, Cod_Menu);
  if ( not Qry.IsEmpty ) then
  begin
    if ((Ordem <> '') and (Ordem_Papai_Dele <> '')) then
      Ordem := Ordem + '.';
    Ordem := Ordem + Ordem_Papai_Dele;
  end;
  while ( not Qry.Eof ) do
  begin
    if ( Ordem <> '' ) then
      Descricao := Ordem + '.' + Qry.FieldByName('ORDEM').AsString + '   ' + Qry.FieldByName('DESC_MENU').AsString
    else
      Descricao := Qry.FieldByName('ORDEM').AsString + '   ' + Qry.FieldByName('DESC_MENU').AsString;
    New(TempPointer);
    TempPointer.Selecionado := False;
    TempPointer.NomeMenu := Qry.FieldByName('NOME_MENU').AsString;
    Item := Tree.Items.AddChildObject(Menu, Descricao, TempPointer);
    Item.ImageIndex := 0;
    MontaTreeView(Qry.FieldByName('NOME_MENU').AsString, Ordem, Qry.FieldByName('ORDEM').Asstring, Item);
    Qry.Next;
  end;
  Qry.Close;
  Qry.Free ;

end;

procedure TfrmCadGruposAcesso.TreeClick(Sender: TObject);
begin
  inherited;
  MarcarItem(true);
end;

procedure TfrmCadGruposAcesso.TreeEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := false;
end;

procedure TfrmCadGruposAcesso.TreeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = ' ' ) then
  begin
    MarcarItem(True);
    Key := #0;
    Abort;
  end;
end;

function TfrmCadGruposAcesso.ValidarDados: Boolean;
var
  i: Integer;
begin
  ValidarDados := False;
  if ( edtDescricao.Text = '' ) then
  begin
    Aviso('O Campo "Descrição" Deve Ser Preenchido!');
    edtDescricao.SetFocus;
    Exit;
  end;
  if ( cmbModulo.ItemIndex < 0 ) then
  begin
    Aviso('O Campo "Módulo" Deve Ser Preenchido!');
    cmbModulo.SetFocus;
    Exit;
  end;
  ValidarDados := True;
  // SALVA OS FILHOS DO GRUPO DE ACESSO
  if ( cds.State in [dsinsert,dsedit] ) then
    DM.Salvar(cds);
  cdsItens.First;
  while ( not cdsItens.Eof ) do
    cdsItens.Delete;
  cdsItens.ApplyUpdates(-1);
  for i := 0 to (Tree.Items.Count - 1) do
  begin
    if ( Tree.Items.Item[i].ImageIndex = 1 ) then
    begin
      cdsItens.Insert;
      cdsItens.FieldByName('COD_ACESSO').AsInteger := cds.FieldByName('COD_ACESSO').AsInteger;
      cdsItens.FieldByName('NOME_MENU' ).AsString := PTreemenu(Tree.Items.Item[i].Data).nomeMenu;
      dm.Salvar(cdsItens);
    end;
  end;
end;

initialization

RegisterClass(TfrmCadGruposAcesso);


end.
