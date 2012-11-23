unit unRelTrocaConsumiveis;

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
  DB, DBClient, Provider, SqlExpr, RpRenderHTML, RpDefine, RpRender,
  RpRenderPDF, StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, ExtCtrls, Mask, LabeledDBEdit, RpBase, RpSystem, RpCon, RpConDS,
  RpRave, unPadraoCadastro, XPMan;

type
  TfrmRelTrocaConsumiveis = class(TfrmPadraoCadastro)
    RvProject1: TRvProject;
    rvdsConsumiveis: TRvDataSetConnection;
    RvSystem: TRvSystem;
    Panel1: TPanel;
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    edtImpressora: TGigatronLblEdit;
    edtConsumivel: TGigatronLblEdit;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    RvProject2: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    btnImprimir: TcxButton;
    procedure edtImpressoraEnter(Sender: TObject);
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraFrmPesquisaClose(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtConsumivelExit(Sender: TObject);
    procedure edtConsumivelFrmPesquisaClose(Sender: TObject);
    procedure edtConsumivelSubButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caminho_relatorio: string;
    function Montar_SQL:boolean;
    procedure Conf_Tela(Etapa: Smallint); virtual;
  end;

var
  frmRelTrocaConsumiveis: TfrmRelTrocaConsumiveis;

implementation

{$R *.dfm}
uses unDM, unDatas, unRegrasForm;

procedure TfrmRelTrocaConsumiveis.btnImprimirClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmRelTrocaConsumiveis.Conf_Tela(Etapa: Smallint);
begin
  PainelDados.Enabled := True;
  edtDataInicial.SetFocus;
end;

procedure TfrmRelTrocaConsumiveis.edtConsumivelExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitConsumiveis(edtConsumivel, edtConsumivel.DescrEdit);
end;

procedure TfrmRelTrocaConsumiveis.edtConsumivelFrmPesquisaClose(
  Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := Controlefoco;
  if edtConsumivel.ValoresRetorno.Count > 2 then
  begin
    edtConsumivel.Text           := edtConsumivel.ValoresRetorno[0];
    edtConsumivel.DescrEdit.Text := edtConsumivel.ValoresRetorno[2];
  end;
end;

procedure TfrmRelTrocaConsumiveis.edtConsumivelSubButtonPesquisaClick(
  Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoConsumiveis(edtConsumivel);
end;

procedure TfrmRelTrocaConsumiveis.edtImpressoraEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TfrmRelTrocaConsumiveis.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
end;

procedure TfrmRelTrocaConsumiveis.edtImpressoraFrmPesquisaClose(
  Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := Controlefoco;
end;

procedure TfrmRelTrocaConsumiveis.edtImpressoraSubButtonPesquisaClick(
  Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;

procedure TfrmRelTrocaConsumiveis.FormShow(Sender: TObject);
begin
  Conf_Tela(0);
  caminho_relatorio := DM.ParamGeral.CaminhoRelatorioConsumiveis;
  frmRelTrocaConsumiveis := self;
end;

function TfrmRelTrocaConsumiveis.Montar_SQL: boolean;
var
  texto: string;
begin

  texto :=
    'SELECT                                   ' + #13 +
    '    TROCA.ID_TROCA,                      ' + #13 +
    '    TROCA.ID_CONSUMIVEL,                 ' + #13 +
    '    TROCA.DATA,                          ' + #13 +
    '    TROCA.CONTADOR,                      ' + #13 +
    '    TROCA.OBSERVACAO,                    ' + #13 +
    '    IMP.NOME,                            ' + #13 +
    '    CONS.DESC_CONSUMIVEL                 ' + #13 +
    'FROM CONSUMIVEIS_TROCA TROCA             ' + #13 +
    '    INNER JOIN CONSUMIVEIS CONS ON       ' + #13 +
    '        TROCA.ID_CONSUMIVEL = CONS.ID    ' + #13 +
    '    INNER JOIN IMPRESSORAS IMP ON        ' + #13 +
    '        IMP.ID = CONS.ID_IMPRESSORA      ' + #13 +
    'WHERE TROCA.DATA BETWEEN ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND ' + QuotedStr(FormataDataFirebird(edtDataFinal.Text)) + #13 +
    '  AND IMP.ID = ' + edtImpressora.Text;

  if edtConsumivel.Text <> '' then
    texto := texto + ' AND TROCA.ID_CONSUMIVEL = ' + edtConsumivel.Text;

  texto := texto + ' ORDER BY TROCA.DATA, CONS.DESC_CONSUMIVEL ';

  Result := DM.BuscaCDS(cds, texto);
end;

initialization

RegisterClass(TfrmRelTrocaConsumiveis);

end.
