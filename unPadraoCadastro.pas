unit unPadraoCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, Provider, DBClient, ExtCtrls, StdCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxButtons, XPMan,
  unPadrao;

type
  TfrmPadraoCadastro = class(TFrmPadrao)
    ds: TDataSource;
    cds: TClientDataSet;
    dsp: TDataSetProvider;
    sds: TSQLDataSet;
    dsDet: TDataSource;
    cdsDet: TClientDataSet;
    dspDet: TDataSetProvider;
    sdsDet: TSQLDataSet;
    PainelCodigo: TPanel;
    edtCodigo: TEdit;
    Código: TLabel;
    PainelDados: TPanel;
    PainelBotoes: TPanel;
    btnSair: TcxButton;
    XPManifest1: TXPManifest;
    btnNovo: TcxButton;
    btnBusca: TcxButton;
    btnConfirmar: TcxButton;
    btnRetornar: TcxButton;
    btnExcluir: TcxButton;
    procedure btnNovoClick(Sender: TObject);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ultimo_registro,ultimo_filho : string;
    Sql_Insercao: String;     // usada para setar o client ao cadastrar os dados
    Sql_Pesquisa: String;     // usada ao chamar a tela de pesquisa
    Sql_Busca: String;        // usada ao buscar um registro
    Titulo_Pesquisa: String;  // usada para setar o titulo da pesquisa no form de pesq
    Titulo_Label: String;     // usada para setar a legenda do label na tela de pesq
    Novo_Registro: Boolean;
    HasItem: Boolean; // indica se o cadastro e master/detail
    LimparCampos : Boolean; // indica se o conf_tela deve limpar os edits. Por padrão é SIM.
    // usado para atribuir ao cds a busca de um registro especifico, qdo o usuario clica na busca
    procedure Atribuir_Busca; virtual;
    // usado para configuracao de tela
    procedure Conf_Tela(Etapa: Smallint); virtual;
    // no botao confirmar, apos salvar os dados as vezes e necessarios salvar registros filhos
    procedure Salvar_Outros; virtual;
    // usado para validar os campos obrigatorios antes de gravar o registro
    function  ValidarDados: Boolean; virtual;

    // configura o registro como chaves estrangeiras e tratamento de dados ao selecionar o registro
    procedure Conf_Registro; virtual;


    published
      procedure RetornoFormAsString(pValsRetorno: TStrings);
  end;

const
  // constantes para o procedimento Conf_Tela
  ctSearch = 0;
  ctNew = 1;
  ctEdit = 2;
  ctSearchItem = 3;
  ctNewItem = 4;
  ctEditItem = 5;

var
  frmPadraoCadastro: TfrmPadraoCadastro;

implementation

{$R *.dfm}
uses unRegrasForm, unDM;

procedure TfrmPadraoCadastro.Atribuir_Busca;
begin
  Sql_Busca := Sql_Busca + edtCodigo.Text;
end;

procedure TfrmPadraoCadastro.btnBuscaClick(Sender: TObject);
begin
  inherited;
  if ( Trim(edtCodigo.Text) = '' ) or ( Trim(edtCodigo.Text) = '0' ) then
    edtCodigo.Text := DM.Pesquisa(Sql_Pesquisa, Titulo_Pesquisa, Titulo_Label, 0);
  if ( edtCodigo.Text <> '' ) and ( Trim(edtCodigo.Text) <> '0' ) then
  begin
    Atribuir_Busca;
    if ( DM.BuscaCDS(cds, Sql_Busca) ) then
    begin
      Conf_Registro;
      Conf_Tela(ctEdit);
      cds.Edit;
    end
    else
    begin
      Aviso('Registro Não Encontrado!');
      edtCodigo.Text := '';
      edtCodigo.SetFocus;
      Conf_Tela(ctSearch);
    end;
  end;
end;

procedure TfrmPadraoCadastro.btnConfirmarClick(Sender: TObject);
var codigo:string;
begin
  inherited;
  if ( ValidarDados ) then
  begin
    if cds.State in [dsEdit, dsInsert] then
      DM.Salvar(cds);
    codigo := edtCodigo.Text;
    Conf_Tela(ctSearch);
    Ultimo_Registro := codigo;
  end;
end;

procedure TfrmPadraoCadastro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if ( Confirma('Deseja Excluir Este Registro?') ) then
  begin
    if ( not DM.Excluir(cds) ) then
      aviso('Este Registro Não Pode Ser Excluído. Existem Vínculos com Outros Registros!');
    Conf_Tela(ctSearch);
  end;
end;

procedure TfrmPadraoCadastro.btnNovoClick(Sender: TObject);
begin
  Conf_Tela(ctNew);
  btnExcluir.Enabled := False;
  if ( cds.State <> dsEdit ) then
  begin
    cds.Open;
    cds.Append;
  end;
  Novo_Registro := True;
  PainelDados.SetFocus;
end;

procedure TfrmPadraoCadastro.btnRetornarClick(Sender: TObject);
begin
  inherited;
  Conf_Tela(ctSearch);
end;

procedure TfrmPadraoCadastro.btnSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPadraoCadastro.Conf_Registro;
begin
//
end;

procedure TfrmPadraoCadastro.Conf_Tela(Etapa: smallint);
begin
  PainelDados.Enabled   := False;
  PainelBotoes.Enabled  := False;

  BtnConfirmar.Enabled := False;
  BtnRetornar.Enabled  := False;
  BtnExcluir.Enabled   := False;
  case Etapa of
    ctSearch:
    begin
      Ultimo_Registro := '';
      cds.Close;
      cds.CommandText      := Sql_Insercao;
      PainelBotoes.Enabled := True;
      PainelCodigo.Enabled := True;
      BtnBusca.Enabled     := True;
      BtnNovo.Enabled      := True;
      Novo_Registro        := False;
      edtCodigo.Text       := '';
//      if LimparCampos then
//      LimpaEdits(frmPadraoCadastro);
      try
        if ( edtCodigo.Visible ) then
          edtCodigo.SetFocus;
      except
      end ;
    end;
    ctNew, ctEdit:
    begin
      PainelDados.Enabled  := True;
      PainelBotoes.Enabled := True;
      PainelCodigo.Enabled := False;
      BtnConfirmar.Enabled := True;
      BtnRetornar.Enabled  := True;
      BtnExcluir.Enabled   := True;
      PainelDados.SetFocus;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
    ctSearchItem, ctNewItem, ctEditItem:
    begin
      Ultimo_Filho := '';
      if ( not HasItem ) then
        Conf_Tela(ctSearch);
    end;
  end;
end;

procedure TfrmPadraoCadastro.edtCodigoEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := False;
end;

procedure TfrmPadraoCadastro.edtCodigoExit(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TfrmPadraoCadastro.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ( Key = vk_F2 ) then
  begin
    TCustomEdit(Sender).Clear;
    btnNovo.Click
  end;
end;

procedure TfrmPadraoCadastro.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( Key = #13 ) then
  begin
    Key:= #0;
    BtnBusca.Click;
  end;
end;

procedure TfrmPadraoCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//
end;

procedure TfrmPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  LimparCampos := true;
  Conf_Tela(ctSearch);
end;

procedure TfrmPadraoCadastro.RetornoFormAsString(pValsRetorno: TStrings);
begin

end;

procedure TfrmPadraoCadastro.Salvar_Outros;
begin
//
end;

function TfrmPadraoCadastro.ValidarDados: Boolean;
begin
  Result := True;
end;

end.
