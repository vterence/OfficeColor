unit unPesquisaOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoPesquisas, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox,
  FMTBcd, cxContainer, cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, DBClient, Provider, SqlExpr,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxButtons, ExtCtrls, unPesquisasGeral;

type
  TfrmPesquisaOS = class(TfrmPesquisasGeral)
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    grpStatus: TcxRadioGroup;
    grpTipo: TcxRadioGroup;
    procedure btnBuscarPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AdicionarColunas; override;
    procedure showSQL(sql: string);
    procedure CarregaRetorno;
  published
    procedure PesquisaSQL(const pSQL: String);
  end;

var
  frmPesquisaOS: TfrmPesquisaOS;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas;

procedure TfrmPesquisaOS.AdicionarColunas;
begin
  inherited;

end;

procedure TfrmPesquisaOS.btnBuscarPesquisaClick(Sender: TObject);
var
  texto: string;
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
    ' SELECT                                ' +
    '   OS.COD_OS "Código",                 ' +
    '   OS.DATA "Data de Emissão",          ' +
    '   OS.ARQUIVO "Nome Arquivo",          ' +
    '   CLI.NOME "Cliente",                 ' +
    '   IMP.NOME "Impressora",              ' +
    '   OS.USUARIO "Usuário",               ' +
    '   DECODE(OS.STATUS, 0, ''EM ABERTO'', 1, ''EM EXECUÇÃO'', 2, ''ENCERRADA'', 3, ''FATURADA'') AS Status' +
    ' FROM OS                               ' +
    '   LEFT OUTER JOIN CLIENTES CLI ON     ' +
    '     CLI.ID_CLIENTE = OS.ID_CLIENTE    ' +
    '   LEFT OUTER JOIN IMPRESSORAS IMP ON  ' +
    '     IMP.ID = OS.ID_IMPRESSORA         ' +
    ' WHERE OS.DATA >= ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND OS.DATA <=' + QuotedStr(FormataDataFirebird(edtDataFinal.Text)) ;

  if grpStatus.ItemIndex < 4 then
    texto := texto + ' AND OS.STATUS = ' + IntToStr(grpStatus.ItemIndex);

  if edtConteudo.Text <> '' then
  begin
    case grpTipo.ItemIndex of
      0: texto := texto + ' AND CLI.NOME   CONTAINING ' + QuotedStr(UpperCase(edtConteudo.Text));
      1: texto := texto + ' AND OS.ARQUIVO CONTAINING ' + QuotedStr(UpperCase(edtConteudo.Text));
      2: texto := texto + ' AND IMP.NOME   CONTAINING ' + QuotedStr(UpperCase(edtConteudo.Text));
      3: texto := texto + ' AND OS.USUARIO CONTAINING ' + QuotedStr(UpperCase(edtConteudo.Text));
    end;
  end;
  DM.Retornar := True;
  DM.cdsPesquisasGeral.Close;
  DM.cdsPesquisasGeral.CommandText := texto;
  DM.cdsPesquisasGeral.Open;
  AdicionarColunas;
  if not (DM.cdsPesquisasGeral.IsEmpty) then grade.SetFocus;
end;

procedure TfrmPesquisaOS.CarregaRetorno;
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

procedure TfrmPesquisaOS.PesquisaSQL(const pSQL: String);
begin

end;

procedure TfrmPesquisaOS.showSQL(sql: string);
begin

end;

end.
