unit unRelOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, StdCtrls, Mask, DBCtrls, LabeledDBEdit,
  cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxButtons, ExtCtrls, RpRenderPDF, RpRender, RpRenderHTML, RpBase, RpSystem,
  RpCon, RpConDS, RpDefine, RpRave, FMTBcd, DB, DBClient, Provider, SqlExpr, unPadraoRelatorios;

type
  TfrmRelOS = class(TFrmPadrao)
    PainelCodigo: TPanel;
    grpData: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtDataInicial: TcxDateEdit;
    edtDataFinal: TcxDateEdit;
    grpStatus: TcxRadioGroup;
    Panel1: TPanel;
    edtCliente: TGigatronLblEdit;
    rvdsOS: TRvDataSetConnection;
    RvRenderHTML1: TRvRenderHTML;
    RvRenderPDF1: TRvRenderPDF;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    sdsDet: TSQLDataSet;
    dspDet: TDataSetProvider;
    cdsDet: TClientDataSet;
    dsDet: TDataSource;
    rvdsDetalhe: TRvDataSetConnection;
    edtImpressora: TGigatronLblEdit;
    btnSair: TcxButton;
    btnImprimir: TcxButton;
    RvProject1: TRvProject;
    RvSystem: TRvSystem;
    rdgTipo: TcxRadioGroup;
    edtUsuario: TGigatronLblEdit;
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteFrmPesquisaClose(Sender: TObject);
    procedure edtClienteSubButtonPesquisaClick(Sender: TObject);
    procedure cdsDetAfterClose(DataSet: TDataSet);
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtUsuarioSubButtonPesquisaClick(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    caminho_relatorio: string;
    function Montar_SQL:boolean;
  end;

var
  frmRelOS: TfrmRelOS;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unDatas, unRelClientes;

procedure TfrmRelOS.btnImprimirClick(Sender: TObject);
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

procedure TfrmRelOS.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmRelOS.cdsDetAfterClose(DataSet: TDataSet);
begin

  cdsDet.Close;
  cdsDet.MasterSource    := nil;
  cdsDet.IndexFieldNames := '';
  cdsDet.MasterFields    := '';

end;

procedure TfrmRelOS.edtClienteEnter(Sender: TObject);
begin
  inherited;
  Keypreview := True;
end;

procedure TfrmRelOS.edtClienteExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitCliente(edtCliente, edtCliente.DescrEdit);
  keypreview := false;
end;

procedure TfrmRelOS.edtClienteFrmPesquisaClose(Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := ControleFoco;
end;

procedure TfrmRelOS.edtClienteSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoCliente(edtCliente);
end;

procedure TfrmRelOS.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
end;

procedure TfrmRelOS.edtImpressoraSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;

procedure TfrmRelOS.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitUsuario(edtUsuario, edtUsuario.DescrEdit);
end;

procedure TfrmRelOS.edtUsuarioSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoUsuario(edtUsuario);
end;

procedure TfrmRelOS.FormShow(Sender: TObject);
begin
  inherited;
  caminho_relatorio := DM.ParamGeral.CaminhoRelatorioOS;
end;

function TfrmRelOS.Montar_SQL: boolean;
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
    '    OS.VALOR,                                                                            ' + #13 +
    '    DECODE(OS.STATUS, 0, ''Em Aberto'', 1, ''Em Execução'', 2, ''Encerrada'') AS STATUS, ' + #13 +
    '    IIF(OS.FLAG_FRENTE_VERSO IN(0,2), '''', ''SIM'') AS FRENTE_VERSO,                    ' + #13 +
    '    OS.CONTADOR_INICIAL,                                                                 ' + #13 +
    '    OS.CONTADOR_FINAL,                                                                   ' + #13 +
    '    IMP.ID,                                                                              ' + #13 +
    '    IMP.NOME AS NOME_IMPRESSORA,                                                         ' + #13 +
    '    CLI.ID_CLIENTE,                                                                      ' + #13 +
    '    CLI.NOME AS NOME_CLIENTE,                                                            ' + #13 +
    '    CLI.ENDERECO || '', '' || CLI.NUMERO AS ENDERECO,                                    ' + #13 +
    '    CID.NOME_CIDADE || '' / '' || CID.UF AS NOME_CIDADE                                  ' + #13 +
    'FROM OS                                                                                  ' + #13 +
    '    INNER JOIN CLIENTES CLI ON                                                           ' + #13 +
    '        CLI.ID_CLIENTE = OS.ID_CLIENTE                                                   ' + #13 +
    '    INNER JOIN CIDADES CID ON                                                            ' + #13 +
    '        CLI.COD_CIDADE = CID.COD_CIDADE                                                  ' + #13 +
    '    INNER JOIN IMPRESSORAS IMP ON                                                        ' + #13 +
    '        OS.ID_IMPRESSORA = IMP.ID                                                        ' + #13 +
    'WHERE OS.DATA BETWEEN ' + QuotedStr(FormataDataFirebird(edtDataInicial.Text)) + ' AND ' + QuotedStr(FormataDataFirebird(edtDataFinal.Text)) + #13 +
    '  AND OS.DATA_FATURAMENTO IS NULL                                                        ';

  if rdgTipo.ItemIndex < 5 then
    texto := texto + ' AND OS.FLAG_FINALIDADE = ' + IntToStr(rdgTipo.ItemIndex);

  if edtCliente.Text <> '' then
    texto := texto + ' AND CLI.ID_CLIENTE = ' + edtCliente.Text;

  if edtImpressora.Text <> '' then
    texto := texto + ' AND IMP.ID = ' + edtImpressora.Text;

  if edtUsuario.Text <> '' then
    texto := texto + ' AND OS.USUARIO = ' + QuotedStr(edtUsuario.Text);

  if grpStatus.ItemIndex < 3 then
    texto := texto + ' AND OS.STATUS = ' + IntToStr(grpStatus.ItemIndex);

  texto := texto + ' ORDER BY OS.COD_OS, OS.DATA ';

  Result := DM.BuscaCDS(cds, texto);

  texto :=
    ' SELECT                                                   ' +
    '   OS_ITENS.*,                                            ' +
    '   TIPO.DESC_TIPO || '' '' || ITEM.DESC_ITEM AS DESC_TIPO ' +
    ' FROM OS_ITENS                                            ' +
    '   INNER JOIN ITEM ON                                     ' +
    '     ITEM.ID_ITEM = OS_ITENS.ID_ITEM AND                  ' +
    '     ITEM.ID_TIPO = OS_ITENS.ID_TIPO                      ' +
    '   INNER JOIN ITEM_TIPO TIPO ON                           ' +
    '     ITEM.ID_TIPO = TIPO.ID_TIPO                          ' ;

  DM.BuscaCDS(cdsDet, texto);

  cdsDet.Open;
  cdsDet.MasterSource := ds;
  cdsDet.IndexFieldNames := 'COD_OS';
  cdsDet.MasterFields    := 'COD_OS';

end;

initialization

RegisterClass(TfrmRelOS);

end.
