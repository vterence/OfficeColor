unit unPadraoRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls,
  FMTBcd, DB, DBClient, Provider, SqlExpr, RpRenderHTML, RpRender, RpRenderPDF,
  RpBase, RpSystem, RpRave, RpDefine, RpCon, RpConDS;

type
  TfrmPadraoRelatorios = class(TFrmPadrao)
    PainelCodigo: TPanel;
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    Panel1: TPanel;
    btnSair: TcxButton;
    btnImprimir: TcxButton;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    procedure btnSairClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caminho_relatorio: string;
    function Montar_SQL:boolean;
  end;

var
  frmPadraoRelatorios: TfrmPadraoRelatorios;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas;

procedure TfrmPadraoRelatorios.btnImprimirClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmPadraoRelatorios.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

function TfrmPadraoRelatorios.Montar_SQL: boolean;
begin
//
end;

end.
