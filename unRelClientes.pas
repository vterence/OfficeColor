unit unRelClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, RpBase, RpSystem, RpCon, RpConDS, RpDefine, RpRave, FMTBcd,
  DB, DBClient, Provider, SqlExpr, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, cxButtons, RpRenderHTML, RpRender,
  RpRenderPDF;

type
  TfrmRelClientes = class(TFrmPadrao)
    RvProject1: TRvProject;
    RvDs: TRvDataSetConnection;
    RvSystem: TRvSystem;
    sds: TSQLDataSet;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    ds: TDataSource;
    btnImprimir: TcxButton;
    btnSair: TcxButton;
    RvRenderPDF1: TRvRenderPDF;
    RvRenderHTML1: TRvRenderHTML;
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelClientes: TfrmRelClientes;

implementation

{$R *.dfm}

procedure TfrmRelClientes.btnImprimirClick(Sender: TObject);
begin
  inherited;
  RvProject1.Execute;
end;

procedure TfrmRelClientes.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmRelClientes := nil;
end;

initialization

RegisterClass(TfrmRelClientes);

end.
