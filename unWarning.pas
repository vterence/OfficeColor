unit unWarning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unPadrao, ExtCtrls, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmWarning = class(TFrmPadrao)
    pnlFundo01: TPanel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    imgIcon: TImage;
    shpTop: TShape;
    shpBottom: TShape;
    pnlTitle: TPanel;
    lblCaption: TLabel;
    lblTitle: TLabel;
    pnlClient: TPanel;
    mText: TMemo;
    btnOK: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowWarningEx(const pTitle, pText: String;
  const pFormTitle: String = 'Aviso';
  const pFormWidth: Integer = 450;
  const pFormHeigth: Integer = 250);
procedure ShowWarning(const pTitle, pText: String);

implementation

{$R *.dfm}

procedure ShowWarningEx(const pTitle, pText: String;
  const pFormTitle: String = 'Aviso';
  const pFormWidth: Integer = 450;
  const pFormHeigth: Integer = 250);
var
  frm: TfrmWarning;
begin
  frm := TfrmWarning.Create(Application);
  frm.lblTitle.Caption := pTitle;
  frm.mText.Lines.Text := pText;
  //frm.Caption := pFormTitle;
  frm.lblCaption.Caption := pFormTitle;
  frm.Width := pFormWidth;
  frm.Height := pFormHeigth;
  try
    frm.BringToFront;
    Application.ProcessMessages;
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure ShowWarning(const pTitle, pText: String);
begin
  ShowWarningEx(pTitle, pText);
end;

// ----- Eventos e procedimentos do TfrmWarning --------------------------------
procedure TfrmWarning.FormShow(Sender: TObject);
begin
  if ( (mText.Lines.Count * 13) > mText.Height ) then
   Height := Height + 50;
  mText.ScrollBars := ssNone;
  btnOk.SetFocus;
end;

procedure TfrmWarning.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

initialization

RegisterClass(TfrmWarning);


end.
