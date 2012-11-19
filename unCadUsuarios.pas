unit unCadUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, XPMan, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons,
  ExtCtrls, Mask, DBCtrls, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmCadUsuarios = class(TfrmPadraoCadastro)
    label1: TLabel;
    edtSenha: TDBEdit;
    Label2: TLabel;
    cmbGrupo: TcxDBLookupComboBox;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cdsAfterOpen(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atribuir_Busca      ; override;
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}
uses unRegrasForm, unDM;

{ TfrmCadUsuarios }

procedure TfrmCadUsuarios.Atribuir_Busca;
begin
  inherited;
  sql_busca :=  'SELECT * FROM USUARIOS WHERE LOGIN = '+ QuotedStr(edtCodigo.Text);
end;

procedure TfrmCadUsuarios.btnConfirmarClick(Sender: TObject);
begin
  edtSenha.Text := Criptografa('C', edtSenha.Text);
  inherited;
end;

procedure TfrmCadUsuarios.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadUsuarios.cdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  cdsDet.Open;
end;

procedure TfrmCadUsuarios.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
  if key = #13 then
  begin
    if ( Trim(edtCodigo.Text) = '' ) or ( Trim(edtCodigo.Text) = '0' ) then
      edtCodigo.Text := DM.Pesquisa(Sql_Pesquisa, Titulo_Pesquisa, Titulo_Label, 0);
    if ( edtCodigo.Text <> '' ) and ( Trim(edtCodigo.Text) <> '0' ) then
    begin
      Atribuir_Busca;
      if ( DM.BuscaCDS(cds, Sql_Busca) ) then
      begin
        Conf_Tela(ctEdit);
        cds.Edit;
        edtSenha.Text := Criptografa('D', edtSenha.Text);
      end
      else
      begin
        cds.Append;
        cds.FieldByName('LOGIN').AsString := edtCodigo.Text;
        Conf_Tela(ctNew);
      end;
    end;
  end;
end;

procedure TfrmCadUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  frmCadUsuarios := nil
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  sql_insercao := 'SELECT * FROM USUARIOS WHERE LOGIN IS NULL';
  sql_pesquisa :=
  ' SELECT                                        '+
  ' LOGIN "Login"                                 '+
  ' FROM USUARIOS                                 '+
  ' WHERE LOGIN LIKE :TEXTO                       ';
  titulo_pesquisa := 'Pesquisa de USUÁRIOS';
  sql_busca := 'SELECT * FROM USUARIOS WHERE LOGIN = ';
  titulo_label := 'Digite a Descrição do Usuário';
end;

initialization

RegisterClass(TfrmCadUsuarios);

end.
