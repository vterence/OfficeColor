unit unRelOSResumido;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, FMTBcd,
  DB, DBClient, Provider, SqlExpr, RpRenderPDF, RpRender, RpRenderHTML, RpBase,
  RpSystem, RpCon, RpConDS, RpDefine, RpRave, StdCtrls, cxButtons, Mask,
  LabeledDBEdit, cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ExtCtrls, unPadraoRelatorios, RvLDCompiler;

type
  TfrmRelOsResumido = class(TFrmPadrao)
    PainelCodigo: TPanel;
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    grpStatus: TcxRadioGroup;
    edtCliente: TGigatronLblEdit;
    edtImpressora: TGigatronLblEdit;
    Panel1: TPanel;
    btnSair: TcxButton;
    btnImprimir: TcxButton;
    RvProject1: TRvProject;
    rvdsOS: TRvDataSetConnection;
    RvSystem: TRvSystem;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderPDF1: TRvRenderPDF;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    grpOrdenar: TcxRadioGroup;
    rdgTipo: TcxRadioGroup;
    edtUsuario: TGigatronLblEdit;
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteFrmPesquisaClose(Sender: TObject);
    procedure edtClienteSubButtonPesquisaClick(Sender: TObject);
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtUsuarioSubButtonPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caminho_relatorio: string;
    function Montar_SQL:boolean;
  end;

var
  frmRelOsResumido: TfrmRelOsResumido;

implementation

{$R *.dfm}
uses unDM, unDatas, unRegrasForm;

{ TfrmRelOsResumido }

procedure TfrmRelOsResumido.btnImprimirClick(Sender: TObject);
begin
  inherited;
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

procedure TfrmRelOsResumido.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelOsResumido.edtClienteEnter(Sender: TObject);
begin
  inherited;
  Keypreview := True;
end;

procedure TfrmRelOsResumido.edtClienteExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitCliente(edtCliente, edtCliente.DescrEdit);
  keypreview := false;
end;

procedure TfrmRelOsResumido.edtClienteFrmPesquisaClose(Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := ControleFoco;
end;

procedure TfrmRelOsResumido.edtClienteSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoCliente(edtCliente);
end;

procedure TfrmRelOsResumido.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
end;

procedure TfrmRelOsResumido.edtImpressoraSubButtonPesquisaClick(
  Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;

procedure TfrmRelOsResumido.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitUsuario(edtUsuario, edtUsuario.DescrEdit);
end;

procedure TfrmRelOsResumido.edtUsuarioSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoUsuario(edtUsuario);
end;

procedure TfrmRelOsResumido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmRelOsResumido := nil;
end;

procedure TfrmRelOsResumido.FormShow(Sender: TObject);
begin
  inherited;
  caminho_relatorio := DM.ParamGeral.CaminhoRelatorioOSResumido;;
end;

function TfrmRelOsResumido.Montar_SQL: boolean;
var
  texto: string;
begin

  texto :=
    'SELECT                                                                                   ' + #13 +
    '    LPAD(OS.COD_OS, 6, ''0'') AS "COD_OS",                                               ' + #13 +
    '    OS.DATA,                                                                             ' + #13 +
    '    OS.USUARIO,                                                                          ' + #13 +
    '    OS.QTD,                                                                              ' + #13 +
    '    OS.QTD_PAGINAS,                                                                      ' + #13 +
    '    OS.OBSERVACAO,                                                                       ' + #13 +
    '    OS.ARQUIVO,                                                                          ' + #13 +
    '    DECODE(OS.STATUS, 0, ''Em Aberto'', 1, ''Em Execução'', 2, ''Encerrada'') AS STATUS, ' + #13 +
    '    IIF(OS.FLAG_FRENTE_VERSO IN (0,2), '''', ''SIM'') AS FRENTE_VERSO,                   ' + #13 +
    '    OS.CONTADOR_INICIAL,                                                                 ' + #13 +
    '    OS.CONTADOR_FINAL,                                                                   ' + #13 +
    '    IMP.ID,                                                                              ' + #13 +
    '    IMP.NOME AS NOME_IMPRESSORA,                                                         ' + #13 +
    '    CLI.ID_CLIENTE,                                                                      ' + #13 +
    '    CLI.NOME AS NOME_CLIENTE,                                                            ' + #13 +
    '    CLI.ENDERECO || '', '' || CLI.NUMERO AS ENDERECO,                                    ' + #13 +
    '    CID.NOME_CIDADE || '' / '' || CID.UF AS NOME_CIDADE,                                 ' + #13 +
    '    COALESCE(IIF(OS.FLAG_FRENTE_VERSO IN(0,2), QTD, QTD * 2), 0) AS TOTAL,               ' + #13 +
    '    COALESCE(IIF(OS.FLAG_FRENTE_VERSO IN(0,2),                                           ' + #13 +
    '        (COALESCE(OS.CONTADOR_FINAL, OS.CONTADOR_INICIAL) - COALESCE(OS.CONTADOR_INICIAL, 0) - (QTD * QTD_PAGINAS)),                   ' + #13 +
    '        (COALESCE(OS.CONTADOR_FINAL, OS.CONTADOR_INICIAL) - COALESCE(OS.CONTADOR_INICIAL, 0) - ((QTD * QTD_PAGINAS) * 2))), 0) AS ERRO ' + #13 +
    'FROM OS                                                                                  ' + #13 +
    '    INNER JOIN CLIENTES CLI ON                                                           ' + #13 +
    '        CLI.ID_CLIENTE = OS.ID_CLIENTE                                                   ' + #13 +
    '    INNER JOIN CIDADES CID ON                                                            ' + #13 +
    '        CLI.COD_CIDADE = CID.COD_CIDADE                                                  ' + #13 +
    '    INNER JOIN IMPRESSORAS IMP ON                                                        ' + #13 +
    '        OS.ID_IMPRESSORA = IMP.ID                                                        ' + #13 +
    'WHERE OS.DATA BETWEEN ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND ' + QuotedStr(FormataDataFirebird(edtDataFinal.Text));

  if rdgTipo.ItemIndex < 4 then
    texto := texto + ' AND OS.FLAG_FINALIDADE = ' + IntToStr(rdgTipo.ItemIndex);

  if edtCliente.Text <> '' then
    texto := texto + ' AND CLI.ID_CLIENTE = ' + edtCliente.Text;

  if edtImpressora.Text <> '' then
    texto := texto + ' AND IMP.ID = ' + edtImpressora.Text;

  if edtUsuario.Text <> '' then
    texto := texto + ' AND OS.USUARIO = ' + QuotedStr(edtUsuario.Text);

  if grpStatus.ItemIndex < 3 then
    texto := texto + ' AND OS.STATUS = ' + IntToStr(grpStatus.ItemIndex);

  case grpOrdenar.ItemIndex of
    0: texto := texto + ' ORDER BY OS.COD_OS      ';
    1: texto := texto + ' ORDER BY CLI.NOME       ';
    2: texto := texto + ' ORDER BY OS.DATA        ';
    3: texto := texto + ' ORDER BY OS.QTD_PAGINAS ';
  end;

  Result := DM.BuscaCDS(cds, texto);
end;

initialization

RegisterClass(TfrmRelOsResumido);

end.
