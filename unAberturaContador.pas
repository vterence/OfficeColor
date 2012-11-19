unit unAberturaContador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  StdCtrls, cxButtons, Mask, LabeledDBEdit, ExtCtrls, dxGDIPlusClasses, FMTBcd,
  DB, DBClient, Provider, SqlExpr;

type
  TfrmAberturaContador = class(TFrmPadrao)
    pnlFundo01: TPanel;
    Panel1: TPanel;
    imgIcon: TImage;
    lblCaption: TLabel;
    lblStatus: TLabel;
    shpTop: TShape;
    pnlBotoes: TPanel;
    shpBottom: TShape;
    pnlPV: TPanel;
    edtImpressora: TGigatronLblEdit;
    edtContador: TGigatronLblEdit;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    btnFechar: TcxButton;
    Shape1: TShape;
    procedure edtImpressoraExit(Sender: TObject);
    procedure edtImpressoraSubButtonPesquisaClick(Sender: TObject);
    procedure edtImpressoraEnter(Sender: TObject);
    procedure edtImpressoraFrmPesquisaClose(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    contador_inicial, contador_final: string;
  public
    { Public declarations }
    function ValidarDados:boolean;
  end;

var
  frmAberturaContador: TfrmAberturaContador;

implementation

{$R *.dfm}
uses unDM, unRegrasForm, unPrincipal, unDatas;

procedure TfrmAberturaContador.btnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmAberturaContador.btnFecharClick(Sender: TObject);
var texto: String;
begin
  inherited;

  if edtContador.Text = '' then
  begin
    Aviso('Informe o contador final do dia!!');
    edtContador.Text;
    exit;
  end;

  DM.BuscaQry(DM.QR_Busca, 'SELECT STATUS FROM OS WHERE STATUS = 1 AND ID_IMPRESSORA = ' + edtImpressora.Text);
  if DM.QR_Busca.RecordCount > 0 then
  begin
    Aviso('Não será possível fechar o contador enquanto houver OS em execução!');
    btnFechar.Enabled := False;
    exit;
  end;

  Try
    cds.Close  ;
    cds.CommandText := 'SELECT * FROM IMPRESSORAS_CONTADOR WHERE CONTADOR_FINAL IS NULL AND ID_IMPRESSORA = ' + edtImpressora.Text;
    cds.Open   ;
    cds.Edit;
    cds.FieldByName('CONTADOR_FINAL').AsString := edtContador.Text;
    DM.Salvar(cds);
    btnFechar.Enabled := False;
    btnOk.Enabled := False;
    edtContador.Text := '';
    edtImpressora.Text := '';
    edtImpressora.DescrEdit.Text := '';
    lblStatus.Visible := False;
    edtImpressora.SetFocus;

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

procedure TfrmAberturaContador.btnOKClick(Sender: TObject);
var
  texto: String;
begin
  inherited;
  if edtImpressora.Text = ''  then
  begin
    Aviso('Informe a impressora para abrir o contador!!');
    edtImpressora.Text;
    exit;
  end;

  if edtContador.Text = '' then
  begin
    Aviso('Informe o contador inicial do dia!!');
    edtContador.Text;
    exit;
  end;

  if StrToInt(edtContador.Text) < StrToInt(contador_final) then
  begin
    Aviso('O Contador não pode ser menor do que o fechamento anterior!');
    edtContador.SetFocus;
    exit;
  end;

  texto := 'SELECT * FROM IMPRESSORAS_CONTADOR WHERE ID_IMPRESSORA = ' + edtImpressora.Text + ' AND DATA = ' +QuotedStr(FormataDataFirebird(date));
  DM.BuscaQry(DM.QR_Busca, texto);
  if not DM.QR_Busca.IsEmpty then
  begin
    Aviso('Contador do dia já foi fechado!!!');
    edtImpressora.SetFocus;
    exit;
  end;

  try
    //-- Novo lançamento de contador.
    cds.Close  ;
    cds.CommandText := 'SELECT * FROM IMPRESSORAS_CONTADOR WHERE ID_IMPRESSORA IS NULL ';
    cds.Open   ;
    cds.Append ;
    cds.FieldByName('ID_IMPRESSORA'   ).AsString   := edtImpressora.Text;
    cds.FieldByName('DATA'            ).AsDateTime := Date();
    cds.FieldByName('CONTADOR_INICIAL').AsString   := edtContador.Text;
    DM.Salvar(cds);
    btnOk.Enabled := False;
    btnFechar.Enabled := False;
    lblStatus.Visible := False;
    edtContador.Text := '';
    edtImpressora.Text := '';
    edtImpressora.DescrEdit.Text := '';
    edtImpressora.SetFocus;

  except
    on E: Exception do
    begin
      Erro('Ocorreu um erro na finalização do processo. '                   + #13 +
           'Todo o processo foi cancelado para evitar maiores problemas. '  + #13 +
           'Caso o problema persistir, contate o administrador do sistema.' + #13 +
           'Segue abaixo o erro retornado:' + #13 + #13 + E.Message );
    end;
  end;
end;

procedure TfrmAberturaContador.edtImpressoraEnter(Sender: TObject);
begin
  inherited;
  Keypreview := True;
end;

procedure TfrmAberturaContador.edtImpressoraExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitImpressora(edtImpressora, edtImpressora.DescrEdit);
  if edtImpressora.Text <> '' then
  begin
    if ValidarDados then
    begin
      edtContador.Text := contador_final;
      edtContador.SetFocus;
    end;
  end;
end;

procedure TfrmAberturaContador.edtImpressoraFrmPesquisaClose(Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := ControleFoco;
end;

procedure TfrmAberturaContador.edtImpressoraSubButtonPesquisaClick(
  Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoImpressora(edtImpressora);
end;


procedure TfrmAberturaContador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmAberturaContador.FormShow(Sender: TObject);
begin
  inherited;
  contador_inicial := '0';
  contador_final   := '0';
end;

function TfrmAberturaContador.ValidarDados: boolean;
var
  texto: String;
begin
  Result := False;

  texto := 'SELECT ID_IMPRESSORA, DATA, COALESCE(CONTADOR_INICIAL, 0) CONTADOR_INICIAL, COALESCE(CONTADOR_FINAL, 0) CONTADOR_FINAL FROM IMPRESSORAS_CONTADOR WHERE ID_IMPRESSORA = ' + edtImpressora.Text + ' AND CONTADOR_FINAL IS NULL ';
  DM.BuscaQry(DM.QR_Busca, texto);

  if not DM.QR_Busca.IsEmpty then
  begin
    lblStatus.Caption   := 'CONTADOR ABERTO';
    lblStatus.Visible   := true;
    edtContador.Text    := '';
    edtContador.Enabled := True;
    btnOk.Enabled       := DM.QR_Busca.IsEmpty;
    btnFechar.Enabled   := True;

    texto := 'SELECT COALESCE(MAX(CONTADOR_FINAL), 0) CONTADOR_FINAL FROM OS WHERE ID_IMPRESSORA = ' + edtImpressora.Text ;
    if DM.BuscaQry(DM.QR_Busca, texto) then
    begin
      contador_final := DM.QR_Busca.FieldByName('CONTADOR_FINAL').AsString;
      edtContador.Text := contador_final;
      edtContador.Enabled := True;
      edtContador.SetFocus;
    end;

    exit;
  end;

  texto := 'SELECT COALESCE(MAX(CONTADOR_FINAL), 0) CONTADOR_FINAL FROM OS WHERE ID_IMPRESSORA = ' + edtImpressora.Text ;
  if DM.BuscaQry(DM.QR_Busca, texto) then
  begin
    contador_final   := DM.QR_Busca.FieldByName('CONTADOR_FINAL').AsString;
    lblStatus.Caption   := 'CONTADOR FECHADO';
    lblStatus.Visible   := true;
    edtContador.Text := contador_final;
    edtContador.Enabled := True;
    btnOk.Enabled       := True;
    btnFechar.Enabled   := False;
    exit;
  end
  else
  begin
    texto :=
      'SELECT                    ' +
      ' COALESCE(CONTADOR_FINAL, 0) CONTADOR_FINAL           ' +
      'FROM IMPRESSORAS_CONTADOR ' +
      'WHERE ID_IMPRESSORA =     ' + edtImpressora.Text +
      '  AND DATA =              ' +
      '   (SELECT MAX(DATA) FROM IMPRESSORAS_CONTADOR WHERE ID_IMPRESSORA = ' + edtImpressora.Text + ')' ;
    if DM.BuscaQry(DM.QR_Busca, texto) then
    begin
      contador_final   := DM.QR_Busca.FieldByName('CONTADOR_FINAL').AsString;
      edtContador.Text := contador_final;
      lblStatus.Caption := 'CONTADOR FECHADO';
      lblStatus.Visible := true;
      btnOk.Enabled     := True;
      btnFechar.Enabled := False;
    end;
  end;
  Result := True;
end;

initialization

RegisterClass(TfrmAberturaContador);

end.
