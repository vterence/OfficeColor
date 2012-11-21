unit unParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadraoCadastro, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, FMTBcd, XPMan, DB, SqlExpr, Provider, DBClient, StdCtrls, cxButtons,
  ExtCtrls, Mask, DBCtrls, LabeledDBEdit;

type
  TfrmParametros = class(TfrmPadraoCadastro)
    edtCaminhoRelOS: TLabeledDBEdit;
    edtCaminhoRelOSResumido: TLabeledDBEdit;
    FileOpenDialog1: TFileOpenDialog;
    edtCaminhoRelOsErro: TLabeledDBEdit;
    edtCaminhoRelContador: TLabeledDBEdit;
    edtCaminhoRelConsumiveis: TLabeledDBEdit;
    procedure btnSairClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtCaminhoRelOSSubButtonPesquisaClick(Sender: TObject);
    procedure edtCaminhoRelOSResumidoSubButtonPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCaminhoRelOsErroSubButtonPesquisaClick(Sender: TObject);
    procedure LabeledDBEdit1SubButtonPesquisaClick(Sender: TObject);
    procedure edtCaminhoRelConsumiveisSubButtonPesquisaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParametros: TfrmParametros;

implementation

{$R *.dfm}
uses unDM, unRegrasForm;

procedure TfrmParametros.btnConfirmarClick(Sender: TObject);
begin
  if cds.State in [dsEdit] then
    DM.Salvar(cds);
  DM.AtualizaParametros;
  Close;
end;

procedure TfrmParametros.btnSairClick(Sender: TObject);
begin
  if cds.State in [dsEdit] then
    cds.Cancel;
  DM.AtualizaParametros;
  inherited;
end;

procedure TfrmParametros.edtCaminhoRelConsumiveisSubButtonPesquisaClick(
  Sender: TObject);
begin
  inherited;
  if FileOpenDialog1.Execute then
    edtCaminhoRelConsumiveis.Text := FileOpenDialog1.FileName;
  FileOpenDialog1.FileName := '';
end;

procedure TfrmParametros.edtCaminhoRelOsErroSubButtonPesquisaClick(
  Sender: TObject);
begin
  inherited;
  if FileOpenDialog1.Execute then
    edtCaminhoRelOSErro.Text := FileOpenDialog1.FileName;
  FileOpenDialog1.FileName := '';
end;

procedure TfrmParametros.edtCaminhoRelOSResumidoSubButtonPesquisaClick(
  Sender: TObject);
begin
  inherited;
  if FileOpenDialog1.Execute then
    edtCaminhoRelOSResumido.Text := FileOpenDialog1.FileName;
  FileOpenDialog1.FileName := '';
end;

procedure TfrmParametros.edtCaminhoRelOSSubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  if FileOpenDialog1.Execute then
    edtCaminhoRelOS.Text := FileOpenDialog1.FileName;
  FileOpenDialog1.FileName := '';
end;

procedure TfrmParametros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if cds.State in [dsEdit] then
    DM.Salvar(cds);
  cds.Close;
end;

procedure TfrmParametros.FormShow(Sender: TObject);
begin
  cds.Open;
  cds.Edit;
end;

procedure TfrmParametros.LabeledDBEdit1SubButtonPesquisaClick(Sender: TObject);
begin
  inherited;
  if FileOpenDialog1.Execute then
    edtCaminhoRelContador.Text := FileOpenDialog1.FileName;
  FileOpenDialog1.FileName := '';
end;

initialization

RegisterClass(TfrmParametros);

end.


