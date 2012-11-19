unit unCadItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, XPMan, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons,
  ExtCtrls, Grids, DBGrids, Mask, DBCtrls, ComCtrls;

type
  TfrmCadItens = class(TfrmPadraoCadastro)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    btnItens: TcxButton;
    PainelItem: TPanel;
    btnExcluirItem: TcxButton;
    Label3: TLabel;
    edtItem: TDBEdit;
    btnSalvarItem: TcxButton;
    btnNovoItem: TcxButton;
    Panel1: TPanel;
    Label1: TLabel;
    gridItens: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure cdsAfterClose(DataSet: TDataSet);
    procedure btnNovoItemClick(Sender: TObject);
    procedure btnItensClick(Sender: TObject);
    procedure cdsDetNewRecord(DataSet: TDataSet);
    procedure gridItensDblClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atribuir_Busca      ; override;
    procedure Conf_Tela(Etapa: Smallint); virtual;
  end;

var
  frmCadItens: TfrmCadItens;

implementation

{$R *.dfm}
uses unDM, unRegrasForm;

procedure TfrmCadItens.Atribuir_Busca;
begin
  inherited;
  sql_busca :=  'SELECT * FROM ITEM_TIPO WHERE ID_TIPO = '+ QuotedStr(edtCodigo.Text);
end;

procedure TfrmCadItens.btnBuscaClick(Sender: TObject);
begin
  if ( Trim(edtCodigo.Text) = '' ) or ( Trim(edtCodigo.Text) = '0' ) then
    edtCodigo.Text := DM.Pesquisa(Sql_Pesquisa, Titulo_Pesquisa, Titulo_Label, 0);
  if ( edtCodigo.Text <> '' ) and ( Trim(edtCodigo.Text) <> '0' ) then
  begin
    Atribuir_Busca;
    if ( DM.BuscaCDS(cds, Sql_Busca) ) then
    begin
      Conf_Tela(ctEdit);
      cds.Edit;
    end
    else
    begin
      Aviso('Registro Não Encontrado!');
      edtCodigo.Text := '';
      edtCodigo.SetFocus;
      Conf_Tela(ctSearch);
    end;
  end;
end;

procedure TfrmCadItens.btnExcluirItemClick(Sender: TObject);
begin
  inherited;
  DM.Excluir(cdsDet);
  Conf_Tela(ctSearchItem);
end;

procedure TfrmCadItens.btnItensClick(Sender: TObject);
begin
  inherited;
  Conf_Tela(ctSearchItem);
end;

procedure TfrmCadItens.btnNovoClick(Sender: TObject);
begin
  inherited;
  if edtCodigo.Text = '' then
  begin
    edtCodigo.Text := IntToStr(DM.IncCodigo('ITEM_TIPO', 'ID_TIPO'));
    cds.Append;
    cds.FieldByName('ID_TIPO').AsString := edtCodigo.Text;
    Conf_Tela(ctNew);
  end;
end;

procedure TfrmCadItens.btnNovoItemClick(Sender: TObject);
begin
  inherited;
  Conf_Tela(ctNewItem);
  DM.Salvar(cds);
  cdsDet.Append;
end;

procedure TfrmCadItens.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadItens.btnSalvarItemClick(Sender: TObject);
begin
  inherited;
  if ( ValidarDados ) then
  begin
    DM.Salvar(cdsDet);
    Conf_Tela(ctSearchItem);
  end;
end;

procedure TfrmCadItens.cdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Close;
end;

procedure TfrmCadItens.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Open;
end;

procedure TfrmCadItens.cdsDetNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsDet.FieldByName('ID_TIPO').AsInteger := cds.FieldByName('ID_TIPO').AsInteger;
  cdsDet.FieldByName('ID_ITEM').AsInteger := DM.IncCodigo('ITEM', 'ID_ITEM');
end;

procedure TfrmCadItens.Conf_Tela(Etapa: Smallint);
begin
  case Etapa of
    ctSearch:
    begin
      Ultimo_Registro := '';
      cds.Close;
      cds.CommandText      := Sql_Insercao;
      PainelBotoes.Enabled := True;
      PainelCodigo.Enabled := True;
      BtnBusca.Enabled     := True;
      BtnNovo.Enabled      := True;
      Novo_Registro        := False;
      edtCodigo.Text       := '';
//      if LimparCampos then
//      LimpaEdits(frmPadraoCadastro);
      try
        if ( edtCodigo.Visible ) then
          edtCodigo.SetFocus;
      except
      end ;
    end;
    ctNew, ctEdit:
    begin
      PainelCodigo.Enabled := False;
      PainelDados.Enabled  := True;
      PainelBotoes.Enabled := True;
      PainelItem.Enabled   := False;
      BtnConfirmar.Enabled := True;
      BtnRetornar.Enabled  := True;
      BtnExcluir.Enabled   := True;
      btnSalvarItem.Enabled  := False;
      btnExcluirItem.Enabled := False;
      btnNovoItem.Enabled    := False;
      PainelDados.SetFocus;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
    ctSearchItem:
    begin
      PainelItem.Enabled      := True;
      btnExcluirItem.Enabled  := ( not cdsDet.IsEmpty );
      btnNovoItem.Enabled     := True;
      btnSalvarItem.Enabled   := False;
      PainelItem.Enabled      := True;
      edtItem.Text := '';
      edtItem.SetFocus;
    end;
    ctNewItem:
    begin
      btnSalvarItem.Enabled  := True;
      btnExcluirItem.Enabled := false;
      btnNovoItem.Enabled    := false;
      PainelItem.Enabled     := True;
      cdsDet.DisableControls;
      edtItem.SetFocus;
    end;
    ctEditItem:
    begin
      cdsDet.Edit;
      PainelItem.Enabled     := True;
      btnSalvarItem.Enabled  := True;
      btnNovoItem.Enabled    := False;
      btnExcluirItem.Enabled := False;
      cdsDet.EnableControls;
      edtItem.SetFocus;
    end;
  end;

end;

procedure TfrmCadItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadItens := nil
end;

procedure TfrmCadItens.FormShow(Sender: TObject);
begin
  inherited;
  sql_insercao := 'SELECT * FROM ITEM_TIPO WHERE ID_TIPO IS NULL';
  sql_pesquisa :=
  ' SELECT                                       '+
  ' TIPO.ID_TIPO     "Item",                     '+
  ' TIPO.DESC_TIPO   "Descrição"                 '+
  ' FROM ITEM_TIPO TIPO                          '+
  ' WHERE TIPO.DESC_TIPO LIKE :TEXTO             ';
  titulo_pesquisa := 'Pesquisa de Itens';
  sql_busca := 'SELECT * FROM ITEM_TIPO WHERE ID_TIPO = ';
  titulo_label := 'Digite a Descrição do Item';
end;



procedure TfrmCadItens.gridItensDblClick(Sender: TObject);
begin
  inherited;
  Conf_Tela(ctEditItem);
end;

initialization

RegisterClass(TfrmCadItens);

end.
