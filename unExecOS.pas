unit unExecOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls, ExtCtrls,
  ComCtrls, AdvDateTimePicker, AdvDBDateTimePicker, Mask, DBCtrls, LabeledDBEdit,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, Grids,
  DBGrids, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCheckBox,
  cxDBEdit, cxGroupBox, cxRadioGroup;

type
  TfrmExecOS = class(TFrmPadrao)
    sdsDet: TSQLDataSet;
    dspDet: TDataSetProvider;
    cdsDet: TClientDataSet;
    dsDet: TDataSource;
    PainelCodigo: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    gridItens: TDBGrid;
    Panel3: TPanel;
    Label3: TLabel;
    edtCodigo: TLabeledDBEdit;
    edtCliente: TLabeledDBEdit;
    edtUsuario: TLabeledDBEdit;
    edtQtdPaginas: TLabeledDBEdit;
    edtQtd: TLabeledDBEdit;
    LabeledDBEdit1: TLabeledDBEdit;
    MemoObservações: TDBMemo;
    edtImpressora: TLabeledDBEdit;
    btnExecutar: TcxButton;
    btnFechar: TcxButton;
    btnSair: TcxButton;
    edtContadorInicial: TGigatronLblEdit;
    edtContadorFinal: TGigatronLblEdit;
    grpTipo: TcxDBRadioGroup;
    grpFinalidade: TcxDBRadioGroup;
    procedure edtClienteExit(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure cdsAfterClose(DataSet: TDataSet);
    procedure edtImpressoraExit(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ValidarDados;
  end;

var
  frmExecOS: TfrmExecOS;

implementation

{$R *.dfm}
uses unRegrasForm, unDM, unDatas;

procedure TfrmExecOS.btnExecutarClick(Sender: TObject);
var
  texto: string;
begin
  inherited;
  if edtContadorInicial.Text = '' then
  begin
    Aviso('Contador inicial não pode ficar em branco!!!');
    edtContadorInicial.SetFocus;
    exit;
  end;

  texto := 'SELECT CONTADOR_INICIAL, CONTADOR_FINAL FROM IMPRESSORAS_CONTADOR WHERE ID_IMPRESSORA = ' + edtImpressora.Text + ' AND DATA = ' + QuotedStr(Formatadatafirebird(date()));
  DM.BuscaQry(DM.QR_Busca, texto);
  if DM.QR_Busca.IsEmpty then
  begin
    Aviso('Não foi aberto contador para esta impressora!!!');
    exit;
  end
  else if not (DM.QR_Busca.FieldByName('CONTADOR_FINAL').IsNull) then
  begin
    Aviso('Contador já foi fechado e não poderá ser modificado!');
    exit;
  end
  else if StrToInt(edtContadorInicial.Text) < DM.QR_Busca.FieldByName('CONTADOR_INICIAL').AsInteger then
  begin
    Aviso('Contador inicial não pode ser menor que ' + DM.QR_Busca.FieldByName('CONTADOR_INICIAL').AsString);
    exit;
  end;

  Try
    cds.Edit;
    cds.FieldByName('STATUS').AsString := '1';
    cds.FieldByName('CONTADOR_INICIAL').AsString := edtContadorInicial.Text;
    DM.Salvar(cds);
    cds.Refresh;

    btnExecutar.Enabled := False;
    btnFechar.Enabled   := True;
    edtContadorInicial.ReadOnly := True;
    edtContadorFinal.ReadOnly   := False;
    btnFechar.SetFocus;

    ValidarDados;

  except
    on E: Exception do
    begin
      Erro('Ocorreu um erro na finalização do processo. '                   + #13 +
           'Todo o processo foi cancelado para evitar maiores problemas. '  + #13 +
           'Caso o problema persistir, contate o administrador do sistema.' + #13 +
           'Segue abaixo o erro retornado:' + #13 + #13 + E.Message );
    end;
  End;
end;

procedure TfrmExecOS.btnFecharClick(Sender: TObject);
var
  texto: string;
begin
  inherited;

  if edtContadorFinal.Text = '' then
  begin
    Aviso('Contador final não pode ficar em branco!!!');
    edtContadorFinal.SetFocus;
    exit;
  end;

  Try
    cds.Edit;
    cds.FieldByName('STATUS').AsString := '2';
    cds.FieldByName('CONTADOR_FINAL').AsString := edtContadorFinal.Text;
    DM.Salvar(cds);
    cds.Refresh;

    btnExecutar.Enabled := False;
    btnFechar.Enabled   := False;
    edtContadorInicial.ReadOnly := True;
    edtContadorFinal.ReadOnly   := True;
    btnSair.SetFocus;

  except
    on E: Exception do
    begin
      Erro('Ocorreu um erro na finalização do processo. '                   + #13 +
           'Todo o processo foi cancelado para evitar maiores problemas. '  + #13 +
           'Caso o problema persistir, contate o administrador do sistema.' + #13 +
           'Segue abaixo o erro retornado:' + #13 + #13 + E.Message );
    end;
  End;
end;

procedure TfrmExecOS.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmExecOS.cdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Close;
end;

procedure TfrmExecOS.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsDet.CommandText :=
   'SELECT                                              ' +
   '  ITEM_OS.COD_OS,                                   ' +
   '  TIPO.DESC_TIPO || '' '' || ITEM.DESC_ITEM AS ITEM ' +
   'FROM OS_ITENS ITEM_OS                               ' +
   '  INNER JOIN ITEM ON                                ' +
   '    ITEM_OS.ID_TIPO = ITEM.ID_TIPO AND              ' +
   '    ITEM_OS.ID_ITEM = ITEM.ID_ITEM                  ' +
   '  INNER JOIN ITEM_TIPO TIPO ON                      ' +
   '    ITEM.ID_TIPO    = TIPO.ID_TIPO                  ' +
   'WHERE ITEM_OS.COD_OS = ' + edtCodigo.Text;
  cdsDet.Open;
  edtContadorInicial.Text := cds.FieldByName('CONTADOR_INICIAL').AsString;
  edtContadorFinal.Text   := cds.FieldByName('CONTADOR_FINAL'  ).AsString;
end;

procedure TfrmExecOS.edtClienteExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitCliente(edtCliente, edtCliente.DescrEdit);
end;

procedure TfrmExecOS.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
end;

procedure TfrmExecOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cds.Close;
end;

procedure TfrmExecOS.FormShow(Sender: TObject);
begin
  inherited;
  ValidarDados;
end;

procedure TfrmExecOS.ValidarDados;
var
  texto: string;
begin
  if not cds.Active then
    cds.Open;
  edtClienteExit(Self);
  edtImpressoraExit(Self);

  if cds.FieldByName('CONTADOR_INICIAL').AsString <> '' then
  begin
    btnExecutar.Enabled := False;
    btnFechar.Enabled   := True;
    edtContadorInicial.ReadOnly := True;
    edtContadorFinal.ReadOnly   := False;
    edtContadorFinal.Text := FloatToStr(StrToInt(edtContadorInicial.Text) + (cds.FieldByName('QTD').AsFloat));
    btnFechar.SetFocus;
  end
  else
  begin
    texto := 'SELECT MAX(CONTADOR_FINAL) CONTADOR_FINAL FROM OS WHERE ID_IMPRESSORA = ' + edtImpressora.Text + ' AND COD_OS <> ' + edtCodigo.Text;
    DM.BuscaQry(DM.QR_Busca, texto);
    btnExecutar.Enabled := True;
    btnFechar.Enabled   := False;
    edtContadorInicial.ReadOnly := False;
    edtContadorFinal.ReadOnly   := True;
    edtContadorInicial.Text := DM.QR_Busca.FieldByName('CONTADOR_FINAL').AsString;
    btnExecutar.SetFocus;
  end;
end;

initialization

RegisterClass(TfrmExecOS);

end.
