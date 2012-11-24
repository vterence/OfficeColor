unit unPesquisasGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoPesquisas, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DB,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxRadioGroup,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCustomPivotGrid, cxDBPivotGrid,
  Mask, LabeledDBEdit, JvAppStorage, JvAppIniStorage, JvComponentBase,
  JvFormPlacement, cxImageComboBox, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, Menus, FMTBcd, DBClient, Provider,
  SqlExpr, cxButtons;

type
  TfrmPesquisasGeral = class(TfrmPadraoPesquisas)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscarPesquisaClick(Sender: TObject);
    procedure gradeTBDblClick(Sender: TObject);
    procedure gradeTBKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    IsFirstShow: Boolean;
  public
    { Public declarations }
    {: Executa a consulta especificada, abre o clientdataset e mostra os
    valores especificados para consulta. Mostra o form como modal.}
    procedure AdicionarColunas; override;
    procedure showSQL(sql: string);
    procedure CarregaRetorno;
  published
    procedure PesquisaSQL(const pSQL: String);    
  end;

var
  frmPesquisasGeral: TfrmPesquisasGeral;

implementation

uses
   unRegrasForm,  unDM;

{$R *.dfm}

procedure TfrmPesquisasGeral.AdicionarColunas; 
begin
  inherited;    
end;

procedure TfrmPesquisasGeral.btnBuscarPesquisaClick(Sender: TObject);
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

  inherited;    
end;

procedure TfrmPesquisasGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.cdsPesquisasGeral.IndexFieldNames := '';
  if ( DM.cdsPesquisasGeral.Active ) then
    DM.cdsPesquisasGeral.Close;
end;

procedure TfrmPesquisasGeral.FormCreate(Sender: TObject);
begin
  inherited;
  IsFirstShow := True;
end;

procedure TfrmPesquisasGeral.FormShow(Sender: TObject);
begin
  inherited;
  DM.Retorno_Pesquisa  := '';
  DM.Retorno_Pesquisa1 := '';
  DM.Retorno_Pesquisa2 := '';
  DM.Retorno_Pesquisa3 := '';
  DM.Retorno_Pesquisa4 := '';
  DM.Retorno_Pesquisa5 := '';

  // redimencionando o form de acordo com o tamanho e quantidade de campos retornados
  edtConteudo.SetFocus;
end;

procedure TfrmPesquisasGeral.CarregaRetorno;
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

procedure TfrmPesquisasGeral.gradeTBDblClick(Sender: TObject);
begin
  inherited;
  CarregaRetorno;
end;

procedure TfrmPesquisasGeral.gradeTBKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) and (not DM.cdsPesquisasGeral.IsEmpty) then
    CarregaRetorno;
  inherited;
end;

procedure TfrmPesquisasGeral.PesquisaSQL(const pSQL: String);
begin
  if ( pSQL <> '' ) then
  begin
    DM.cdsPesquisasGeral.Close;
    DM.cdsPesquisasGeral.CommandText := pSQL;
  end;
end;

procedure TfrmPesquisasGeral.showSQL(sql: string);
begin
  if sql <> '' then
  begin
    DM.cdsPesquisasGeral.Close;
    DM.cdsPesquisasGeral.CommandText := sql;
  end;
end;

end.




