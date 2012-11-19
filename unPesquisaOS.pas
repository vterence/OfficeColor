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
  cxClasses, cxGridCustomView, cxGrid, cxButtons, ExtCtrls;

type
  TfrmPesquisaOS = class(TfrmPadraoPesquisas)
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    grpStatus: TcxRadioGroup;
    grpTipo: TcxRadioGroup;
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaOS: TfrmPesquisaOS;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas;

procedure TfrmPesquisaOS.btnBuscarClick(Sender: TObject);
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
    '   DECODE(OS.STATUS, 0, ''EM ABERTO'', 1, ''EM EXECUÇÃO'', 2, ''ENCERRADA'') AS Status' +
    ' FROM OS                               ' +
    '   LEFT OUTER JOIN CLIENTES CLI ON     ' +
    '     CLI.ID_CLIENTE = OS.ID_CLIENTE    ' +
    '   LEFT OUTER JOIN IMPRESSORAS IMP ON  ' +
    '     IMP.ID = OS.ID_IMPRESSORA         ' +
    ' WHERE OS.DATA >= ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND OS.DATA <=' + QuotedStr(FormataDataFirebird(edtDataFinal.Text)) ;

  if grpStatus.ItemIndex < 3 then
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

end.
