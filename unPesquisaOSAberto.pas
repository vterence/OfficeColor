unit unPesquisaOSAberto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus, StdCtrls,
  cxButtons, ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ComCtrls,
  AdvDateTimePicker, AdvDBDateTimePicker, Mask, LabeledDBEdit, cxContainer,
  cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  FMTBcd, DBClient, Provider, SqlExpr, unDatas, unPesquisasGeral,
  cxImageComboBox, unPadraoCadastro, XPMan;

type
  TfrmPesquisaOSAberto = class(TFrmPadraoCadastro)
    grid: TcxGrid;
    gridView1: TcxGridDBTableView;
    gridView1Column5: TcxGridDBColumn;
    gridView1Column1: TcxGridDBColumn;
    gridView1Column2: TcxGridDBColumn;
    gridView1Column3: TcxGridDBColumn;
    gridView1Column4: TcxGridDBColumn;
    gridView1Column6: TcxGridDBColumn;
    gridDBTableView1: TcxGridDBTableView;
    gridDBTableView1Column1: TcxGridDBColumn;
    gridDBTableView1Column2: TcxGridDBColumn;
    gridLevel1: TcxGridLevel;
    gridLevel2: TcxGridLevel;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    grpTipo: TcxRadioGroup;
    grpStatus: TcxRadioGroup;
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    btnBuscar: TcxButton;
    edtConteudo: TEdit;
    btnFechar: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure gridView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cdsAfterClose(DataSet: TDataSet);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaOSAberto: TfrmPesquisaOSAberto;

implementation

{$R *.dfm}
uses unRegrasForm, unDM, unExecOS;

procedure TfrmPesquisaOSAberto.btnBuscarClick(Sender: TObject);
var texto: String;
begin
  if edtDataInicial.Text = '' then
  begin
    Aviso('Data inicial não foi informada!');
    edtDataInicial.SetFocus;
    Exit;
  end;

  if edtDataFinal.Text = '' then
  begin
    Aviso('Data final não foi informada!');
    edtDataFinal.SetFocus;
    Exit;
  end;

  texto :=
    ' SELECT       ' +
    '   OS.COD_OS, ' +
    '   OS.DATA,   ' +
    '   OS.ARQUIVO,' +
    '   CLI.NOME,  ' +
    '   OS.ID_IMPRESSORA, ' +
    '   IMP.MARCA || '' - '' || IMP.NOME AS IMPRESSORA, ' +
    '   DECODE(OS.STATUS, 0, ''EM ABERTO'', 1, ''EM EXECUÇÃO'', 2, ''ENCERRADA'') AS Status' +
    ' FROM OS                            ' +
    '   LEFT OUTER JOIN CLIENTES CLI ON  ' +
    '     CLI.ID_CLIENTE = OS.ID_CLIENTE ' +
    '   LEFT OUTER JOIN IMPRESSORAS IMP ON ' +
    '     OS.ID_IMPRESSORA = IMP.ID      ' +
    ' WHERE OS.DATA >= ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND OS.DATA <=' + QuotedStr(FormataDataFirebird(edtDataFinal.Text)) +
    '   AND OS.USUARIO = ' + QuotedStr(DM.DadosUsu.Login);
  texto := texto + ' AND OS.STATUS = ' + IntToStr(grpStatus.ItemIndex);

  if edtConteudo.Text <> '' then
  begin
    if grpTipo.ItemIndex = 0 then
    begin
      texto := texto + ' AND CLI.NOME CONTAINING ' + QuotedStr(UpperCase(edtConteudo.Text));
    end
    else
    begin
      texto := texto + ' AND OS.ARQUIVO CONTAINING ' + QuotedStr(UpperCase(edtConteudo.Text));
    end;
  end;

  DM.BuscaCDS(cds, texto);

end;

procedure TfrmPesquisaOSAberto.cdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Close;
end;

procedure TfrmPesquisaOSAberto.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Close;
  cdsDet.CommandText :=
    ' SELECT                             ' + #13 +
    '  OS_ITENS.*,                       ' + #13 +
    '  TP.DESC_TIPO || '' '' || IT.DESC_ITEM AS "Desc" ' + #13 +
    ' FROM OS_ITENS                      ' + #13 +
    '   INNER JOIN ITEM IT ON            ' + #13 +
    '     IT.ID_ITEM = OS_ITENS.ID_ITEM AND ' + #13 +
    '     IT.ID_TIPO = OS_ITENS.ID_TIPO     ' + #13 +
    '   INNER JOIN ITEM_TIPO TP ON       ' + #13 +
    '     IT.ID_TIPO = TP.ID_TIPO        ' ;
  cdsDet.Open;
end;

procedure TfrmPesquisaOSAberto.cxButton1Click(Sender: TObject);
begin
  btnSairClick(self);
end;

procedure TfrmPesquisaOSAberto.FormShow(Sender: TObject);
begin
  edtDataInicial.Text := DateToStr(Date);
  edtDataFinal.Text   := DateToStr(Date);
  edtDataInicial.SetFocus;
end;

procedure TfrmPesquisaOSAberto.gridView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  texto: string;
begin
  inherited;
  if not cds.IsEmpty then
  begin
    if Trim(cds.FieldByName('STATUS').AsString) = 'ENCERRADA' then
    begin
      Aviso('Esta OS ja foi encerrada!');
      exit;
    end;

    texto := 'SELECT * FROM OS WHERE STATUS = 1 AND ID_IMPRESSORA = ' + cds.FieldByName('ID_IMPRESSORA').AsString + ' AND COD_OS <> ' + cds.FieldByName('COD_OS').AsString;
    DM.BuscaQry(DM.QR_Busca, texto);
    if not DM.QR_Busca.IsEmpty then
    begin
      Aviso('Existe uma outra OS em aberto para essa impressora! Finalize antes de abrir outra OS!!!');
      exit;
    end;

    if not Assigned(frmExecOS) then
      Application.CreateForm(TfrmExecOS, frmExecOS);
    frmExecOS.cds.CommandText := 'SELECT * FROM OS WHERE COD_OS = ' + cds.FieldByName('COD_OS').AsString;
    frmExecOS.Show;
  end;
end;

initialization

RegisterClass(TfrmPesquisaOSAberto);


end.
