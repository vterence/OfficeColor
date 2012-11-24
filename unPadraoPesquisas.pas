unit unPadraoPesquisas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, ExtCtrls, cxControls, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FMTBcd, DBClient, Provider,
  SqlExpr, cxImageComboBox, unPadrao;

type
  TfrmPadraoPesquisas = class(TFrmPadrao)
    PainelCodigo: TPanel;
    Código: TLabel;
    edtConteudo: TEdit;
    btnBuscarPesquisa: TcxButton;
    PainelDados: TPanel;
    gradeTB: TcxGridDBTableView;
    gradeLevel1: TcxGridLevel;
    grade: TcxGrid;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    btnSair: TcxButton;
    grPadrao: TcxGrid;
    grPadraoTB: TcxGridDBTableView;
    cxColuna: TcxGridDBColumn;
    grPadraoLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure btnBuscarPesquisaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure gradeTBKeyPress(Sender: TObject; var Key: Char);
    procedure gradeTBDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AutoWidth: Boolean; // default TRUE
    // procedimento que retorna o registro selecionado da pesquisa
    procedure AdicionarColunas; virtual;
    procedure CarregaRetorno;
  published
    procedure RetornoFormAsString(pValsRetorno: TStrings);
    procedure PesquisaSQL(const pSQL: String);
  end;

var
  frmPadraoPesquisas: TfrmPadraoPesquisas;

implementation

{$R *.dfm}
uses unDM;

procedure TfrmPadraoPesquisas.PesquisaSQL(const pSQL: String);
begin
  if ( pSQL <> '' ) then
  begin
    DM.cdsPesquisasGeral.Close;
    DM.cdsPesquisasGeral.CommandText := pSQL;
  end;
end;

procedure TfrmPadraoPesquisas.AdicionarColunas;
var i : integer;
begin
  gradeTB.ClearItems;
  for i := 0 to gradeTB.DataController.DataSource.DataSet.FieldCount-1 do
  begin
    gradeTB.CreateColumn;
    gradeTB.Columns[i].Caption               := gradeTB.DataController.DataSource.DataSet.Fields[i].FieldName;
    gradeTB.Columns[i].DataBinding.FieldName := gradeTB.DataController.DataSource.DataSet.Fields[i].FieldName;
    gradeTB.Columns[i].Width                 := gradeTB.DataController.DataSource.DataSet.Fields[i].dataSize * 7;

    if (gradeTB.DataController.DataSource.DataSet.Fields[i].DataType in [ftinteger])
       and (gradeTB.Columns[i].Width < 50 ) then
      gradeTB.Columns[i].Width := 50;

    if (gradeTB.DataController.DataSource.DataSet.Fields[i].DataType in [ftDateTime,ftdate])
       and (gradeTB.Columns[i].Width < 80 ) then
      gradeTB.Columns[i].Width := 80;

    if (gradeTB.DataController.DataSource.DataSet.Fields[i].DataType in [ftFloat,ftCurrency,ftBCD])
       and (gradeTB.Columns[i].Width < 85 ) then
      gradeTB.Columns[i].Width := 85;

    gradeTB.Columns[i].ApplyBestFit;

    if uppercase(gradeTB.DataController.DataSource.DataSet.Fields[i].FieldName) = 'SELECAO' then
    begin
      gradeTB.Columns[i] := cxColuna;
    end;
  end;
end;

procedure TfrmPadraoPesquisas.btnBuscarPesquisaClick(Sender: TObject);
var i : integer;
begin
  DM.Retornar := True;
  DM.cdsPesquisasGeral.Close;
  DM.cdsPesquisasGeral.IndexFieldNames := '';
  if ( DM.cdsPesquisasGeral.Params.Count > 0 ) then
  begin
    if ( UpperCase(DM.cdsPesquisasGeral.Params[0].DisplayName) = 'TEXTO' ) then
    begin
      DM.cdsPesquisasGeral.Params[0].AsString := '%' + edtConteudo.Text + '%';
    end
    else
      if ( UpperCase(DM.cdsPesquisasGeral.Params[0].DisplayName) = 'EXATA' ) then
      begin
        if ( Trim(edtConteudo.Text) = '' ) then
          edtConteudo.Text := '0';
        DM.cdsPesquisasGeral.Params[0].AsString := edtConteudo.Text;
      end;
  end;
  DM.cdsPesquisasGeral.Open;
  AdicionarColunas;
  if not (DM.cdsPesquisasGeral.IsEmpty) then grade.SetFocus;
end;

procedure TfrmPadraoPesquisas.btnSairClick(Sender: TObject);
begin
  DM.Retornar := False;
  ModalResult := mrCancel;
end;

procedure TfrmPadraoPesquisas.FormShow(Sender: TObject);
begin
  DM.Retorno_Pesquisa  := '';
  DM.Retorno_Pesquisa1 := '';
  DM.Retorno_Pesquisa2 := '';
  DM.Retorno_Pesquisa3 := '';
  DM.Retorno_Pesquisa4 := '';
  DM.Retorno_Pesquisa5 := '';
end;

procedure TfrmPadraoPesquisas.gradeTBDblClick(Sender: TObject);
begin
  CarregaRetorno;
  ModalResult := mrOk;
end;

procedure TfrmPadraoPesquisas.gradeTBKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    CarregaRetorno;
    ModalResult := mrOk;
  end;
end;

procedure TfrmPadraoPesquisas.RetornoFormAsString(pValsRetorno: TStrings);
var
  i, j, maxColuna: Integer;
  retorno : array[0..5] of string;
begin
  pValsRetorno.Clear;

  if (ModalResult = mrOk) then
  begin
    // Seta o retorno somente das 5 primeiras colunas
    if (gradeTB.ColumnCount > 5) then
       maxColuna := 5
    else
       maxColuna := gradeTB.ColumnCount;

    // Inicializa o retorno
    for i := 0 to maxColuna do
      retorno[i] := '';

    // Percorre a seleção do grid para carga do retorno
    for i := 0 to gradeTB.Controller.SelectedRowCount - 1 do
    begin
      for j := 0 to maxColuna-1 do
      begin
        if (trim(retorno[j]) = '') then
          retorno[j] := VarToStr(gradeTB.Controller.SelectedRows[i].Values[j])
        else
          retorno[j] := retorno[j] +','+ VarToStr(gradeTB.Controller.SelectedRows[i].Values[j]);
      end;
    end;

    // Carrega retorno
    for i := 0 to maxColuna do
      pValsRetorno.Add(retorno[i]);
  end;
end;

procedure TfrmPadraoPesquisas.CarregaRetorno;
var i : integer;
begin
  if (not(gradeTB.DataController.DataSet.IsEmpty) and (gradeTB.Controller.SelectedRecordCount = 0)) then
    gradeTB.Controller.SelectCells(gradeTB.Columns[0],gradeTB.Columns[gradeTB.ColumnCount-1],gradeTB.DataController.FocusedRecordIndex, gradeTB.DataController.FocusedRecordIndex);

  for i := 0 to gradeTB.Controller.SelectedRecordCount - 1 do
  begin
    if (i = 0) then
    begin
      DM.Retorno_Pesquisa := VarToStr(gradeTB.Controller.SelectedRecords[i].Values[0]) ;
    end
    else
      DM.Retorno_Pesquisa := DM.Retorno_Pesquisa+','+VarToStr(gradeTB.Controller.SelectedRecords[i].Values[0]);
  end;

  if gradeTB.Controller.SelectedRecordCount = 1 then
  begin
      if (DM.cdsPesquisasGeral.Fields.Count - 1) >= (DM.Pos_Ret_Pesquisa + 1) then
        DM.Retorno_Pesquisa1 := DM.cdsPesquisasGeral.Fields[DM.Pos_Ret_Pesquisa + 1].AsString
      else
        DM.Retorno_Pesquisa1 := '';
      if (DM.cdsPesquisasGeral.Fields.Count - 1) >= (DM.Pos_Ret_Pesquisa + 2) then
        DM.Retorno_Pesquisa2 := DM.cdsPesquisasGeral.Fields[DM.Pos_Ret_Pesquisa + 2].AsString
      else
        DM.Retorno_Pesquisa2 := '';
      if (DM.cdsPesquisasGeral.Fields.Count - 1) >= (DM.Pos_Ret_Pesquisa + 3) then
        DM.Retorno_Pesquisa3 := DM.cdsPesquisasGeral.Fields[DM.Pos_Ret_Pesquisa + 3].AsString
      else
        DM.Retorno_Pesquisa3 := '';
      if (DM.cdsPesquisasGeral.Fields.Count - 1) >= (DM.Pos_Ret_Pesquisa + 4) then
        DM.Retorno_Pesquisa4 := DM.cdsPesquisasGeral.Fields[DM.Pos_Ret_Pesquisa + 4].AsString
      else
        DM.Retorno_Pesquisa4 := '';
      if (DM.cdsPesquisasGeral.Fields.Count - 1) >= (DM.Pos_Ret_Pesquisa + 5) then
        DM.Retorno_Pesquisa5 := DM.cdsPesquisasGeral.Fields[DM.Pos_Ret_Pesquisa + 5].AsString
      else
        DM.Retorno_Pesquisa5 := '';
  end;
end;

end.
