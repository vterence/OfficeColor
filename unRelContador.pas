unit unRelContador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoRelatorios, cxGraphics, cxControls, cxLookAndFeels,
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
  cxGroupBox, cxRadioGroup;

type
  TfrmRelContador = class(TfrmPadraoRelatorios)
    edtImpressora: TGigatronLblEdit;
    grpStatus: TcxRadioGroup;
    rvdsContador: TRvDataSetConnection;
    RvProject1: TRvProject;
    RvSystem: TRvSystem;
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure edtImpressoraEnter(Sender: TObject);
    procedure edtImpressoraFrmPesquisaClose(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    caminho_relatorio: string;
    function Montar_SQL:boolean;
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

procedure TfrmRelContador.edtImpressoraFrmPesquisaClose(Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := Controlefoco;
end;

procedure TfrmRelContador.edtImpressoraSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;

procedure TfrmRelContador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmRelContador.FormShow(Sender: TObject);
begin
  inherited;
  caminho_relatorio := DM.ParamGeral.CaminhoRelatorioContador;
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
