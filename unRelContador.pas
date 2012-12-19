unit unRelContador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, FMTBcd,
  DB, DBClient, Provider, SqlExpr, RpRenderHTML, RpRender, RpRenderPDF, RpBase,
  RpSystem, RpRave, RpDefine, RpCon, RpConDS, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, Mask, LabeledDBEdit,
  cxGroupBox, cxRadioGroup, unPadraoCadastro, XPMan;

type
  TfrmRelContador = class(TfrmPadraoCadastro)
    rvdsContador: TRvDataSetConnection;
    RvProject1: TRvProject;
    RvSystem: TRvSystem;
    Panel1: TPanel;
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    edtImpressora: TGigatronLblEdit;
    grpStatus: TcxRadioGroup;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    btnImprimir: TcxButton;
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure edtImpressoraEnter(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caminho_relatorio: String;
    function Montar_SQL:boolean;
    procedure Conf_Tela(Etapa: Smallint); virtual;
  end;

var
  frmRelContador: TfrmRelContador;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas;

procedure TfrmRelContador.btnImprimirClick(Sender: TObject);
begin
  if edtImpressora.Text = '' then
  begin
    Aviso('Informe uma impressora!!!');
    edtImpressora.SetFocus;
    exit;
  end;

  if (edtDataInicial.Text = '') or (edtDataFinal.Text = '') then
  begin
    Aviso('Informe data inicial e data final!!!');
    edtDataInicial.SetFocus;
    exit;
  end;

  if Montar_SQL then
  begin
    RvProject1.ProjectFile := caminho_relatorio;
    RvProject1.Execute;
  end
  else
    Aviso('Nenhum registro foi encontrado!!!');
end;

procedure TfrmRelContador.Conf_Tela(Etapa: Smallint);
begin
  PainelDados.Enabled := True;
  edtDataInicial.SetFocus;
end;

procedure TfrmRelContador.edtImpressoraEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TfrmRelContador.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
end;

procedure TfrmRelContador.edtImpressoraSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;

procedure TfrmRelContador.FormShow(Sender: TObject);
begin
  Conf_Tela(0);
  caminho_relatorio := DM.ParamGeral.CaminhoRelatorioContador;
  frmRelContador := Self;
end;

function TfrmRelContador.Montar_SQL: boolean;
var
  texto: string;
begin

  texto :=
    'SELECT                                                                       ' + #13 +
    '    IMP.ID,                                                                  ' + #13 +
    '    IMP.NOME,                                                                ' + #13 +
    '    CONT.DATA,                                                               ' + #13 +
    '    COALESCE(CONT.CONTADOR_INICIAL, 0) CONTADOR_INICIAL,                     ' + #13 +
    '    COALESCE(CONT.CONTADOR_FINAL, 0) CONTADOR_FINAL,                         ' + #13 +
    '    COALESCE(CONT.CONTADOR_FINAL - CONT.CONTADOR_INICIAL, 0) AS DIFERENCA    ' + #13 +
    'FROM IMPRESSORAS_CONTADOR CONT                                               ' + #13 +
    '    INNER JOIN IMPRESSORAS IMP ON                                            ' + #13 +
    '        IMP.ID = CONT.ID_IMPRESSORA                                          ' + #13 +
    'WHERE CONT.DATA BETWEEN ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND ' + QuotedStr(FormataDataFirebird(edtDataFinal.Text)) + #13 +
    '  AND IMP.ID = ' + edtImpressora.Text;

  if grpStatus.ItemIndex = 0 then
    texto := texto + ' AND CONT.CONTADOR_FINAL IS NOT NULL ';

  texto := texto + ' ORDER BY CONT.DATA ';

  Result := DM.BuscaCDS(cds, texto);
end;

initialization

RegisterClass(TfrmRelContador);

end.
