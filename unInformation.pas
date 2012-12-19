unit unInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  ExtCtrls, StdCtrls, unPadrao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmInformation = class(TFrmPadrao)
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

procedure ShowInformationEx(const pTitle, pText: String;
  const pFormTitle: String = 'Informação';
  const pFormWidth: Integer = 450;
  const pFormHeigth: Integer = 280);
procedure ShowInformation(const pTitle, pText: String);

implementation

{$R *.dfm}

procedure ShowInformationEx(const pTitle, pText: String;
  const pFormTitle: String = 'Informação';
  const pFormWidth: Integer = 450;
  const pFormHeigth: Integer = 280);
var
  frm: TfrmInformation;
begin
  frm := TfrmInformation.Create(Application);
  frm.lblTitle.Caption := pTitle;
  frm.mText.Lines.Text := pText;
  //frm.Caption := pFormTitle;
  frm.lblCaption.Caption := pFormTitle;
  frm.Width := pFormWidth;
  frm.Height := pFormHeigth;

  if frm.mText.Lines.Count > 8 then
    frm.mText.ScrollBars := ssVertical;
  try
    frm.BringToFront;
    Application.ProcessMessages;
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure ShowInformation(const pTitle, pText: String);
begin
  ShowInformationEx(pTitle, pText);
end;

// ----- Eventos e procedimentos do TfrmInformation ----------------------------
procedure TfrmInformation.FormShow(Sender: TObject);
begin
  if ( (mText.Lines.Count * 13) > mText.Height ) then
    mText.ScrollBars := ssVertical
  else
    mText.ScrollBars := ssNone;
  btnOk.SetFocus;
end;

procedure TfrmInformation.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
