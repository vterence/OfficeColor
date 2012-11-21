unit unRelOSErro;

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
  cxGroupBox, cxRadioGroup, StdCtrls, Mask, LabeledDBEdit, DB, DBClient,
  Provider, SqlExpr, RpRenderHTML, RpRender, RpRenderPDF, RpBase, RpSystem,
  RpRave, RpDefine, RpCon, RpConDS, cxButtons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ExtCtrls;

type
  TfrmRelOSErro = class(TfrmPadraoRelatorios)
    edtCliente: TGigatronLblEdit;
    edtImpressora: TGigatronLblEdit;
    grpOrdenar: TcxRadioGroup;
    rvdsOS: TRvDataSetConnection;
    rvdsDetalhe: TRvDataSetConnection;
    RvSystem: TRvSystem;
    RvProject1: TRvProject;
    edtUsuario: TGigatronLblEdit;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteFrmPesquisaClose(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtClienteSubButtonPesquisaClick(Sender: TObject);
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtUsuarioSubButtonPesquisaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Montar_SQL:boolean;
  end;

var
  frmRelOSErro: TfrmRelOSErro;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas;

procedure TfrmRelOSErro.btnImprimirClick(Sender: TObject);
begin
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

procedure TfrmRelOSErro.btnSairClick(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmRelOSErro.edtClienteEnter(Sender: TObject);
begin
  inherited;
  Keypreview := True;
end;

procedure TfrmRelOSErro.edtClienteExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitCliente(edtCliente, edtCliente.DescrEdit);
end;

procedure TfrmRelOSErro.edtClienteFrmPesquisaClose(Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := ControleFoco;
end;

procedure TfrmRelOSErro.edtClienteSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoCliente(edtCliente);
end;

procedure TfrmRelOSErro.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
end;

procedure TfrmRelOSErro.edtImpressoraSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;

procedure TfrmRelOSErro.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitUsuario(edtUsuario, edtUsuario.DescrEdit);
end;

procedure TfrmRelOSErro.edtUsuarioSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoUsuario(edtUsuario);
end;

procedure TfrmRelOSErro.FormShow(Sender: TObject);
begin
  inherited;
  caminho_relatorio := DM.ParamGeral.CaminhoRelatorioOSErro;
end;

function TfrmRelOSErro.Montar_SQL:boolean;
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
    '    IIF(OS.FLAG_FRENTE_VERSO IN (0,2), '''', ''X'') AS FRENTE_VERSO,                     ' + #13 +
    '    OS.CONTADOR_INICIAL,                                                                 ' + #13 +
    '    OS.CONTADOR_FINAL,                                                                   ' + #13 +
    '    IMP.ID,                                                                              ' + #13 +
    '    IMP.NOME AS NOME_IMPRESSORA,                                                         ' + #13 +
    '    CLI.ID_CLIENTE,                                                                      ' + #13 +
    '    CLI.NOME AS NOME_CLIENTE,                                                            ' + #13 +
    '    CLI.ENDERECO || '', '' || CLI.NUMERO AS ENDERECO,                                    ' + #13 +
    '    CID.NOME_CIDADE || '' / '' || CID.UF AS NOME_CIDADE,                                 ' + #13 +
    '    COALESCE(QTD, 0) AS TOTAL,                                                           ' + #13 +
    '    COALESCE(((COALESCE(OS.CONTADOR_FINAL, OS.CONTADOR_INICIAL) - COALESCE(OS.CONTADOR_INICIAL, 0)) - (QTD * QTD_PAGINAS)), 0) AS ERRO ' + #13 +
    'FROM OS                                                                                  ' + #13 +
    '    INNER JOIN CLIENTES CLI ON                                                           ' + #13 +
    '        CLI.ID_CLIENTE = OS.ID_CLIENTE                                                   ' + #13 +
    '    INNER JOIN CIDADES CID ON                                                            ' + #13 +
    '        CLI.COD_CIDADE = CID.COD_CIDADE                                                  ' + #13 +
    '    INNER JOIN IMPRESSORAS IMP ON                                                        ' + #13 +
    '        OS.ID_IMPRESSORA = IMP.ID                                                        ' + #13 +
    'WHERE OS.DATA BETWEEN ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND ' + QuotedStr(FormataDataFirebird(edtDataFinal.Text)) + #13 +
    '  AND OS.STATUS = 2 ' + #13 +
    '  AND COALESCE(((COALESCE(OS.CONTADOR_FINAL, OS.CONTADOR_INICIAL) - COALESCE(OS.CONTADOR_INICIAL, 0)) - (QTD * QTD_PAGINAS)), 0) > 0 ' ;

  if edtCliente.Text <> '' then
    texto := texto + ' AND CLI.ID_CLIENTE = ' + edtCliente.Text;

  if edtImpressora.Text <> '' then
    texto := texto + ' AND IMP.ID = ' + edtImpressora.Text;

  if edtUsuario.Text <> '' then
    texto := texto + ' AND OS.USUARIO = ' + QuotedStr(edtUsuario.Text);

  case grpOrdenar.ItemIndex of
    0: texto := texto + ' ORDER BY OS.COD_OS      ';
    1: texto := texto + ' ORDER BY CLI.NOME       ';
    2: texto := texto + ' ORDER BY OS.DATA        ';
    3: texto := texto + ' ORDER BY OS.QTD_PAGINAS ';
  end;

  Result := DM.BuscaCDS(cds, texto);
end;

initialization

RegisterClass(TfrmRelOSErro);

end.
