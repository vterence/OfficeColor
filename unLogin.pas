unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, ExtCtrls,
  dxGDIPlusClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, unPadrao,
  cxButtons;

type
  TFrmLogin = class(TFrmPadrao)
    pnlFundo01: TPanel;
    imgIcon: TImage;
    lblCaption: TLabel;
    shpTop: TShape;
    lblDate: TLabel;
    pnlBotoes: TPanel;
    shpBottom: TShape;
    cdsUsuarios: TClientDataSet;
    dspUsuarios: TDataSetProvider;
    sdsUsuarios: TSQLDataSet;
    sdsAcessos: TSQLDataSet;
    dspAcessos: TDataSetProvider;
    cdsAcessos: TClientDataSet;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function EntrarSistema : boolean;  virtual;
    function ValidaUsuario : boolean;  virtual;
    function LogarUsuario  : boolean;  virtual;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses unRegrasForm, unDM, unPrincipal;

procedure TFrmLogin.btnCancelClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmLogin.btnOKClick(Sender: TObject);
begin
  EntrarSistema;
end;

procedure TFrmLogin.edtUsuarioExit(Sender: TObject);
begin
  if edtUsuario.Text <> '' then
  begin
    if ( not DM.BuscaCDS(cdsUsuarios,'SELECT * FROM USUARIOS WHERE LOGIN = ' +
      QuotedStr(edtUsuario.Text)) ) then
    begin
      Aviso('Usuario nao encontrado!!!');
      edtUsuario.SetFocus;
    end;
  end;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  lblDate.Caption := InitCap(FormatDateTime('dddd", "dd" de "mmmm" de "yyyy"."', Now));
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var teste: string;
begin
  dm.dadosusu.Login := '';
  dm.dadosusu.Grupo := '';
end;

function TfrmLogin.LogarUsuario: boolean;
begin
  result := false;

  DM.DadosUsu.Login               := cdsUsuarios.FieldByName('LOGIN').AsString;
  DM.DadosUsu.Grupo               := cdsUsuarios.FieldByName('COD_GRUPO').AsString;
  DM.DadosUsu.Senha               := Trim(edtSenha.Text);

  frmPrincipal.confirmou_login := true;

  Result := true;

end;

function TfrmLogin.ValidaUsuario: boolean;
var nome: String; p:integer;
begin
  result := false;

  DM.BuscaCDS(cdsAcessos, 'SELECT * FROM PARAMETROS');
  if date > StrToDate(Criptografa('D', cdsAcessos.FieldByName('HASH_DATA').AsString)) then
  begin
    Aviso('Sua chave foi expirada! Por favor entre em contato com o suporte para regularizar!!!');
    Application.Terminate;
  end;
  cdsAcessos.Close;
{
  DM.BuscaCDS(cdsAcessos, 'SELECT * FROM PARAMETROS');
  cdsAcessos.Edit;
  cdsAcessos.FieldByName('HASH_DATA').AsString := Criptografa('C', '30/11/2012');
  DM.Salvar(cdsAcessos);
}
  if ( not DM.BuscaCDS(cdsUsuarios,
    ' SELECT                                                '+
    ' USUARIOS.*                                            '+
    ' FROM USUARIOS                                         '+
    ' WHERE USUARIOS.LOGIN = '+QuotedStr(edtUsuario.Text)) ) then
  begin
    Aviso('Usuário Não Cadastrado!');
    edtUsuario.SetFocus;
    Exit;
  end;

  if ( Trim(edtSenha.Text) <> Criptografa('D', cdsUsuarios.fieldbyname('SENHA').AsString) ) then
  begin
    Aviso('A Senha Digitada é Inválida. Verifique!');
    edtSenha.SetFocus;
    Exit;
  end;

  result := true;
end;

function TfrmLogin.EntrarSistema: boolean;
begin
  Result := false;

  if not ValidaUsuario then
    exit;

  if LogarUsuario then
  begin
    result := true;
    close;
  end;
end;

end.
