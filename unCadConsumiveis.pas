unit unCadConsumiveis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, Mask, DBCtrls, LabeledDBEdit, XPMan, DB, SqlExpr, Provider,
  DBClient, StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Grids, DBGrids;

type
  TfrmCadConsumiveis = class(TfrmPadraoCadastro)
    edtNome: TLabeledDBEdit;
    cmbImpressora: TcxDBLookupComboBox;
    Label2: TLabel;
    grade: TDBGrid;
    sdsTroca: TSQLDataSet;
    dspTroca: TDataSetProvider;
    cdsTroca: TClientDataSet;
    dsTroca: TDataSource;
    btnBuscar: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure cdsAfterClose(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure cdsTrocaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atribuir_Busca      ; override;
  end;

var
  frmCadConsumiveis: TfrmCadConsumiveis;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas, unTrocaConsumiveis;

{ TfrmCadConsumiveis }

procedure TfrmCadConsumiveis.Atribuir_Busca;
begin
  inherited;
  sql_busca :=  'SELECT * FROM CONSUMIVEIS WHERE ID = '+ QuotedStr(edtCodigo.Text);
end;

procedure TfrmCadConsumiveis.btnBuscarClick(Sender: TObject);
begin
  if not Assigned(frmTrocaConsumiveis) then
    Application.CreateForm(TFrmTrocaConsumiveis, frmTrocaConsumiveis);
  try
    frmTrocaConsumiveis.ShowModal;
  finally
    if frmTrocaConsumiveis.ModalResult = mrOk then
    begin
      cdsTroca.Append;
      cdsTroca.FieldByName('CONTADOR').AsString   := frmTrocaConsumiveis.contador;
      cdsTroca.FieldByName('OBSERVACAO').AsString := frmTrocaConsumiveis.observacao;
      DM.Salvar(cdsTroca);
    end;

    FreeAndNil(frmTrocaConsumiveis);
  end;
end;

procedure TfrmCadConsumiveis.btnNovoClick(Sender: TObject);
begin
  inherited;
  if edtCodigo.Text = '' then
  begin
    edtCodigo.Text := IntToStr(DM.IncCodigo('CONSUMIVEIS', 'ID'));
    cds.Append;
    cds.FieldByName('ID').AsString := edtCodigo.Text;
    PainelDados.Enabled  := True;
    PainelBotoes.Enabled := True;
    edtNome.SetFocus;
  end;
end;

procedure TfrmCadConsumiveis.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadConsumiveis.cdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Close;
  cdsTroca.Close;
end;

procedure TfrmCadConsumiveis.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Open;
  cdsTroca.Open;
end;

procedure TfrmCadConsumiveis.cdsTrocaNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('ID_CONSUMIVEL').AsInteger  := StrToInt(edtCodigo.Text);
  DataSet.FieldByName('ID_TROCA'     ).AsInteger  := DM.IncCodigo('CONSUMIVEIS_TROCA', 'ID_TROCA');
  DataSet.FieldByName('DATA'         ).AsDateTime := date;
end;

procedure TfrmCadConsumiveis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadConsumiveis := nil;
end;

procedure TfrmCadConsumiveis.FormShow(Sender: TObject);
begin
//  inherited;
  sql_insercao := 'SELECT * FROM CONSUMIVEIS WHERE ID IS NULL';
  sql_pesquisa :=
  ' SELECT                                        '+
  ' CONSUMIVEIS.ID "Código",                      '+
  ' CONSUMIVEIS.DESC_CONSUMIVEL "Descrição",      '+
  ' IMP.NOME "Impressora"                         '+
  ' FROM CONSUMIVEIS                              '+
  '   INNER JOIN IMPRESSORAS IMP ON               '+
  '     IMP.ID = CONSUMIVEIS.ID                   '+
  ' WHERE NOME LIKE :TEXTO                        ';
  titulo_pesquisa := 'Pesquisa de CONSUMÍVEIS';
  sql_busca := 'SELECT * FROM CONSUMIVEIS WHERE ID = ';
  titulo_label := 'Digite a Descrição do Consumível';
end;

initialization

RegisterClass(TfrmCadConsumiveis);

end.

