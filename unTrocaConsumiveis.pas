unit unTrocaConsumiveis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, StdCtrls,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Mask, DBCtrls, LabeledDBEdit, Menus, cxButtons;

type
  TfrmTrocaConsumiveis = class(TForm)
    PainelDados: TPanel;
    edtNome: TLabeledDBEdit;
    edtContador: TGigatronLblEdit;
    btnConfirmar: TcxButton;
    btnSair: TcxButton;
    Label1: TLabel;
    MemoObs: TMemo;
    LabeledDBEdit1: TLabeledDBEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    contador, observacao: string;
  end;

var
  frmTrocaConsumiveis: TfrmTrocaConsumiveis;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas, unCadConsumiveis;

procedure TfrmTrocaConsumiveis.btnConfirmarClick(Sender: TObject);
begin
  if edtContador.Text = '' then
  begin
    Aviso('Contador não pode ficar em branco!!!');
    edtContador.SetFocus;
    exit;
  end;

  contador := edtContador.Text;
  observacao := Trim(MemoObs.Text);

  ModalResult := mrOk;
end;

procedure TfrmTrocaConsumiveis.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTrocaConsumiveis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//
end;

procedure TfrmTrocaConsumiveis.FormShow(Sender: TObject);
begin
  inherited;
  edtContador.SetFocus;
end;

end.
