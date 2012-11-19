unit unCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, XPMan, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons,
  ExtCtrls, Mask, DBCtrls, ComCtrls, cxControls, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGroupBox, cxRadioGroup, cxDBEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  LabeledDBEdit;

type
  TfrmCadClientes = class(TfrmPadraoCadastro)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    grpEndereco: TGroupBox;
    edtCidade: TLabeledDBEdit;
    edtNome: TLabeledDBEdit;
    edtCnpjCpf: TLabeledDBEdit;
    edtRGIE: TLabeledDBEdit;
    edtEndereco: TLabeledDBEdit;
    edtBairro: TLabeledDBEdit;
    edtTelefone1: TLabeledDBEdit;
    edtNumero: TLabeledDBEdit;
    edtCep: TLabeledDBEdit;
    rdgTipo: TDBRadioGroup;
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure edtCidadeExit(Sender: TObject);
    procedure edtCidadeSubButtonPesquisaClick(Sender: TObject);
    procedure edtCidadeFrmPesquisaClose(Sender: TObject);
    procedure edtCidadeEnter(Sender: TObject);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure rdgTipoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atribuir_Busca      ; override;
    procedure Conf_Tela(Etapa: smallint);
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

{$R *.dfm}
uses unDM, unRegrasForm;

{ TfrmCadClientes }

procedure TfrmCadClientes.Atribuir_Busca;
begin
  inherited;
  sql_busca :=  'SELECT * FROM CLIENTES WHERE ID_CLIENTE = '+ QuotedStr(edtCodigo.Text);
end;

procedure TfrmCadClientes.btnBuscaClick(Sender: TObject);
begin
  inherited;
  Conf_Tela(ctEdit);
end;

procedure TfrmCadClientes.btnNovoClick(Sender: TObject);
begin
  inherited;
  if edtCodigo.Text = '' then
  begin
    edtCodigo.Text := IntToStr(DM.IncCodigo('CLIENTES', 'ID_CLIENTE'));
    cds.Append;
    cds.FieldByName('ID_CLIENTE').AsString := edtCodigo.Text;
    PainelDados.Enabled  := True;
    PainelBotoes.Enabled := True;
    edtNome.SetFocus;
  end;
end;

procedure TfrmCadClientes.btnRetornarClick(Sender: TObject);
begin
  inherited;
  Conf_Tela(ctSearch);
end;

procedure TfrmCadClientes.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadClientes.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    if FieldByName('TIPO').AsInteger = 1 then
      FieldByName('CNPJ_CPF').EditMask := '!999\.999\.999\-99;0;_'
    else
      FieldByName('CNPJ_CPF').EditMask := '!99\.999\.999\/9999\-99;0;_';

    FieldByName('CEP').EditMask := '!99\.999\-999;0;_';
    FieldByName('TEL1').EditMask := '!\(99\)9999\-9999;0;_';
{
    TNumericField(fieldbyname('LIMITE_CREDITO'     )).DisplayFormat := '###,##0.00';
    TNumericField(fieldbyname('TRAB_RENDA'         )).DisplayFormat := '###,##0.00';
    TNumericField(fieldbyname('CONJ_RENDA'         )).DisplayFormat := '###,##0.00';
    TNumericField(fieldbyname('PERC_DESCONTO_VENDA')).DisplayFormat := '###,##0.00';
}
  end;

end;

procedure TfrmCadClientes.cdsNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('TIPO').AsInteger := 1;
end;

procedure TfrmCadClientes.Conf_Tela(Etapa: smallint);
begin
  inherited;
  case Etapa of
    ctSearch:
    begin
      edtCidade.DescrEdit.Text := '';
    end;
    ctNew, ctEdit:
    begin
      edtCidadeExit(Self);
      edtNome.SetFocus;
    end;
  end;
end;

procedure TfrmCadClientes.edtCidadeEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TfrmCadClientes.edtCidadeExit(Sender: TObject);
begin
  inherited;
  DM.BuscaExitMunicipio(edtCidade, edtCidade.DescrEdit);
end;

procedure TfrmCadClientes.edtCidadeFrmPesquisaClose(Sender: TObject);
begin
  inherited;
  Screen.OnActiveControlChange := ControleFoco;
end;

procedure TfrmCadClientes.edtCidadeSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  DM.BuscaBotaoMunicipio(edtCidade);
end;

procedure TfrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadClientes := nil;
end;

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  inherited;
  sql_insercao := 'SELECT * FROM CLIENTES WHERE ID_CLIENTE IS NULL';
  sql_pesquisa :=
  ' SELECT                                        '+
  ' ID_CLIENTE "ID",                              '+
  ' NOME  "Cliente"                               '+
  ' FROM CLIENTES                                 '+
  ' WHERE NOME LIKE :TEXTO                        ';
  titulo_pesquisa := 'Pesquisa de Clientes';
  sql_busca := 'SELECT * FROM CLIENTES WHERE ID_CLIENTE = ';
  titulo_label := 'Digite o nome do Cliente';
end;

procedure TfrmCadClientes.rdgTipoClick(Sender: TObject);
begin
  inherited;
  if (Sender as TDBRadioGroup).ItemIndex = 1 then
    cds.FieldByName('CNPJ_CPF').EditMask := '!999\.999\.999\-99;0;_'
  else
    cds.FieldByName('CNPJ_CPF').EditMask := '!99\.999\.999\/9999\-99;0;_';
end;

initialization

RegisterClass(TfrmCadClientes);

end.
