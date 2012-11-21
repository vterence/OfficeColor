unit unConfirmation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, unPadrao, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TfrmConfirmation = class(TForm)
    pnlBottom: TPanel;
    pnlTop: TPanel;
    imgIcon: TImage;
    shpBottom: TShape;
    pnlTitle: TPanel;
    lblCaption: TLabel;
    lblQuestion: TLabel;
    btnOK: TcxButton;
    btnCancel: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TscTypeButtons = (sctbYesNo, sctbOkCancel);

function ShowConfirmationEx(const pQuestion: String;
  const pTypeButons: TscTypeButtons = sctbOkCancel;
  const pFormTitle: String = 'Confirmação';
  const pFormWidth: Integer = 450;
  const pFormHeigth: Integer = 180): Boolean;
function ShowConfirmation(const pQuestion: String): Boolean; overload;
function ShowConfirmation(const pQuestion: String; const pTypeButtons: TscTypeButtons): Boolean; overload;

implementation

{$R *.dfm}

function ShowConfirmationEx(const pQuestion: String;
  const pTypeButons: TscTypeButtons = sctbOkCancel;
  const pFormTitle: String = 'Confirmação';
  const pFormWidth: Integer = 450;
  const pFormHeigth: Integer = 180): Boolean;
var
  frm: TfrmConfirmation;
begin
  frm := TfrmConfirmation.Create(Application);
  try
    case pTypeButons of
      sctbYesNo:
      begin
        frm.btnOk.Caption := '&Sim';
        frm.btnOk.Glyph := nil;
        frm.btnCancel.Caption := '&Não';
        frm.btnCancel.Glyph := nil;
      end;
      sctbOkCancel:
      begin
        // nao precisa alterar nenhuma configuracao pois o form fica configurado corretamente
      end;
    end;
    frm.lblQuestion.Caption := pQuestion;
    frm.lblCaption.Caption := pFormTitle;
    frm.Width := pFormWidth;
    frm.Height := pFormHeigth;
    frm.BringToFront;
    Application.ProcessMessages;
    if ( frm.ShowModal = mrOk ) then
      Result := True
    else
      Result := False;
  finally
    frm.Free;
  end;
end;

function ShowConfirmation(const pQuestion: String): Boolean;
begin
  Result := ShowConfirmationEx(pQuestion);
end;

function ShowConfirmation(const pQuestion: String; const pTypeButtons: TscTypeButtons): Boolean; overload;
begin
  Result := ShowConfirmationEx(pQuestion, pTypeButtons);
end;

// ----- Eventos e procedimentos do TfrmConfirmation ---------------------------
procedure TfrmConfirmation.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmConfirmation.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmConfirmation.FormShow(Sender: TObject);
begin
  btnOk.SetFocus;
end;

end.
