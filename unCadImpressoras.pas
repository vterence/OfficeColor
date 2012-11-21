unit unCadImpressoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons, ExtCtrls,
  Mask, DBCtrls, Buttons, AdvSmoothButton, XPMan;

type
  TfrmCadImpressoras = class(TfrmPadraoCadastro)
    EdtNome: TDBEdit;
    Label1: TLabel;
    edtMarca: TDBEdit;
    Label2: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atribuir_Busca      ; override;
  end;

var
  frmCadImpressoras: TfrmCadImpressoras;

implementation

{$R *.dfm}
uses unPrincipal, unDM, unPadraoPesquisas;

procedure TfrmCadImpressoras.Atribuir_Busca;
begin
  inherited;
  sql_busca :=  'SELECT * FROM IMPRESSORAS WHERE ID = '+ QuotedStr(edtCodigo.Text);
end;

procedure TfrmCadImpressoras.btnNovoClick(Sender: TObject);
begin
  inherited;
  if edtCodigo.Text = '' then
  begin
    edtCodigo.Text := IntToStr(DM.IncCodigo('IMPRESSORAS', 'ID'));
    cds.Append;
    cds.FieldByName('ID').AsString := edtCodigo.Text;
    EdtNome.SetFocus;
    PainelDados.Enabled  := True;
    PainelBotoes.Enabled := True;
  end;
end;

procedure TfrmCadImpressoras.FormShow(Sender: TObject);
begin
  inherited;
  sql_insercao := 'SELECT * FROM IMPRESSORAS WHERE ID IS NULL';
  sql_pesquisa :=
  ' SELECT                                        '+
  ' ID    "ID",                                   '+
  ' NOME  "Impressora" ,                          '+
  ' MARCA "Marca"                                 '+
  ' FROM IMPRESSORAS                              '+
  ' WHERE NOME LIKE :TEXTO                        ';
  titulo_pesquisa := 'Pesquisa de IMPRESSORAS';
  sql_busca := 'SELECT * FROM IMPRESSORAS WHERE ID = ';
  titulo_label := 'Digite a Descrição da Impressora';
end;

initialization

RegisterClass(TfrmCadImpressoras);

end.
