unit unError;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  StdCtrls, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  ComCtrls, Jpeg, Buttons, ImgList, DB, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons;

type
  TEmailAcount = record
    Name: String;
    Address: String; // reply
    AddressSend: String;
    AddressCopy: String;
    AddressHiddenCopy: String;
    SmtpHost: String;
    SmtpPort: Integer;
    SmtpUser: String;
    SmtpPassword: String;
  end;
  TVersionInfoEx = record
    CompanyName: String;
    FileDescription: String;
    FileVersion: String;
    InternalName: String;
    LegalCopyright: String;
    LegalTradeMarks: String;
    OriginalFileName: String;
    ProductName: String;
    ProductVersion: String;
    Comments: String;
    MajorVersion: Integer;
    MinorVersion: Integer;
    Release: Integer;
    Build: Integer;
  end;
  TfrmError = class(TForm)
    pnlBottom: TPanel;
    pnlTop: TPanel;
    imgIcon: TImage;
    pnlTitle: TPanel;
    pnlClient: TPanel;
    lblCaption: TLabel;
    lblTitle: TLabel;
    mText: TMemo;
    shpTop: TShape;
    Shape1: TShape;
    imgChecado: TImage;
    lblDetalhes: TLabel;
    mDet: TMemo;
    Shape2: TShape;
    btnOK: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure lblDetalhesClick(Sender: TObject);
  private
    { Private declarations }
    Email: TEmailAcount;
    ErrorDate: TDateTime;
    HasPrintScreen: Boolean;
    jpgScreen: TJPEGImage;
    procedure PrintScreen;
  public
    { Public declarations }
  end;

function GetTempDir: String;
function GetVersionInfoEx(const pExeFileName: TFileName): TVersionInfoEx;
procedure ShowErrorEx(const pTitle, pText: String;
  const pException: Exception;
  pEmail: TEmailAcount;
  const pPrintScreen: Boolean = False;
  const pShowSend: Boolean = True;
  const pFormTitle: String = 'Erro';
  const pFormWidth: Integer = 520;
  const pFormHeigth: Integer = 235);
procedure ShowError(const pTitle, pText: String); overload;
procedure ShowError(const pTitle, pText: String; pException: Exception); overload;
procedure ShowError(const pTitle, pText: String; pException: Exception; pEmail: TEmailAcount); overload;

implementation


{$R *.dfm}

//----- funcoes uteis ------------------------------------------------------------------------------
// retorna o diretorio temp do usuario
function GetTempDir: String;
var
  Buffer: Array[0..256] of Char;
begin
  GetTempPath(256, Buffer);
  Result := StrPas(Buffer);
end;

{ ----- Original example by Delphi 7 Help -----
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion',
    'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName',
    'ProductVersion', 'Comments');
var
  S: string;
  n, Len, i: DWORD;
  Buf: PChar;
  Value: PChar;
begin
  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  if n > 0 then
  begin

    Buf := AllocMem(n);
    Memo1.Lines.Add('VersionInfoSize = ' + IntToStr(n));
    GetFileVersionInfo(PChar(S), 0, n, Buf);
    for i := 1 to InfoNum do
      if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[i]), Pointer(Value), Len) then
        Memo1.Lines.Add(InfoStr[i] + ' = ' + Value);
    FreeMem(Buf, n);
  end
  else
    Memo1.Lines.Add('No version information found');
end;
}

function GetVersionInfoEx(const pExeFileName: TFileName): TVersionInfoEx;
const
  InfoStr: array[1..10] of string = ('CompanyName', 'FileDescription', 'FileVersion',
    'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName',
    'ProductVersion', 'Comments');
var
  n, Len: DWORD;
  Buf: PChar;
  Value: PChar;
  a: Integer;
  s, lVersion: string;
begin
  Result.CompanyName      := '';
  Result.FileDescription  := '';
  Result.FileVersion      := '';
  Result.InternalName     := '';
  Result.LegalCopyright   := '';
  Result.LegalTradeMarks  := '';
  Result.OriginalFileName := '';
  Result.ProductName      := '';
  Result.ProductVersion   := '';
  Result.Comments         := '';
  Result.MajorVersion     := 0;
  Result.MinorVersion     := 0;
  Result.Release          := 0;
  Result.Build            := 0;
  n := GetFileVersionInfoSize(PChar(pExeFileName), n);
  if ( n > 0 ) then
  begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(pExeFileName), 0, n, Buf);
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\CompanyName'), Pointer(Value), Len) ) then
      Result.CompanyName := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\FileDescription'), Pointer(Value), Len) ) then
      Result.FileDescription := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\FileVersion'), Pointer(Value), Len) ) then
      Result.FileVersion := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\InternalName'), Pointer(Value), Len) ) then
      Result.InternalName := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\LegalCopyright'), Pointer(Value), Len) ) then
      Result.LegalCopyright := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\LegalTradeMarks'), Pointer(Value), Len) ) then
      Result.LegalTradeMarks := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\OriginalFileName'), Pointer(Value), Len) ) then
      Result.OriginalFileName := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\ProductName'), Pointer(Value), Len) ) then
      Result.ProductName := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\ProductVersion'), Pointer(Value), Len) ) then
      Result.ProductVersion := Value;
    if ( VerQueryValue(Buf, PChar('StringFileInfo\041604E4\Comments'), Pointer(Value), Len) ) then
      Result.Comments := Value;
    FreeMem(Buf, n);
  end
  else
    Result.Comments := 'No found version information.';
  if ( Result.FileVersion <> '' ) then
  begin
    lVersion := Result.FileVersion;
    // MajorVersion
    a := Pos('.', lVersion);
    s := Copy(lVersion, 1, (a - 1));
    Result.MajorVersion := StrToIntDef(s, 0);
    lVersion := Copy(lVersion, (a + 1), (Length(lVersion) - a + 1));
    // MinorVersion
    a := Pos('.', lVersion);
    s := Copy(lVersion, 1, (a - 1));
    Result.MinorVersion := StrToIntDef(s, 0);
    lVersion := Copy(lVersion, (a + 1), (Length(lVersion) - a + 1));
    // Release
    a := Pos('.', lVersion);
    s := Copy(lVersion, 1, (a - 1));
    Result.Release := StrToIntDef(s, 0);
    lVersion := Copy(lVersion, (a + 1), (Length(lVersion) - a + 1));
    // Build
    Result.Build := StrToIntDef(lVersion, 0);
  end;
end;

//----- implementacao das chamadas para o ShowForm -------------------------------------------------
procedure ShowErrorEx(const pTitle, pText: String;
  const pException: Exception;
  pEmail: TEmailAcount;
  const pPrintScreen: Boolean = False;
  const pShowSend: Boolean = True;
  const pFormTitle: String = 'Erro';
  const pFormWidth: Integer = 520;
  const pFormHeigth: Integer = 235);
var
  frm: TfrmError;
  vErro : string;
begin
  if ( Application <> nil ) then
    frm := TfrmError.Create(Application)
  else
    frm := TfrmError.Create(nil);

  if ( pException <> nil ) then
    vErro := StringReplace(pException.Message, #10, #13#10, [rfReplaceAll])
  else
    vErro := pText;

  frm.mText.Lines.Clear;  
  if (pos('<*[',vErro) > 0) then // Se for uma mensagem tratada
  begin
    while (pos('<*[',vErro) > 0) do
    begin
      frm.mText.Lines.add(copy(vErro,pos('<*[',vErro)+3,(pos(']*>',vErro)-(pos('<*[',vErro)+3))));
      vErro := copy(vErro, pos(']*>',vErro)+3, length(vErro) - (pos(']*>',vErro)+3));
    end;
  end
  else if (pos('violation of PRIMARY',vErro) > 0) then // Se for uma violação da chave primária
    frm.mText.Lines.Text := 'Código Duplicado. O Código Informado Já Foi Utilizado Anteriormente!'
  else if (pos('violation of FOREIGN KEY',vErro) > 0) then // Se for uma violação de chave estrangeira
    frm.mText.Lines.Text := 'Algum Registro Dependente Não Foi Encontrado!'
  else // Se for um erro não mapeado
    frm.mText.Lines.Text := vErro;

  // Configura o Scroll caso a mensagem tenha mais que 4 linhas.  
  if (frm.mText.Lines.Count > 4) then
    frm.mText.ScrollBars := ssVertical
  else
    frm.mText.ScrollBars := ssNone; 

  // Preenche os detalhes.  
  frm.mDet.Lines.Clear;
  if ( pException <> nil ) then
  begin
    frm.mDet.Lines.Append('Segue abaixo o erro retornado:');
    frm.mDet.Lines.Append('');
    frm.mDet.Lines.Append('');
    frm.mDet.Lines.Append(StringReplace(pException.Message, #10, #13#10, [rfReplaceAll]));
    frm.mDet.Lines.Append('');
    frm.mDet.Lines.Append('(Exception type: ' + pException.ClassName + ')');
  end
  else
    frm.mDet.Lines.Text := pText;
    
  frm.lblCaption.Caption := 'Atenção!';
  frm.lblTitle.Caption   := pTitle;
  frm.Width              := pFormWidth;
  frm.Height             := pFormHeigth;
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure ShowError(const pTitle, pText: String);
var
  lEmail: TEmailAcount;
begin
  lEmail.Name := '';
  lEmail.Address := '';
  lEmail.AddressSend := '';
  lEmail.AddressCopy := '';
  lEmail.AddressHiddenCopy := '';
  lEmail.SmtpHost := '';
  lEmail.SmtpPort := 25;
  lEmail.SmtpUser := '';
  lEmail.SmtpPassword := '';
  ShowErrorEx(pTitle, pText, nil, lEmail);
end;

procedure ShowError(const pTitle, pText: String; pException: Exception); overload;
var
  lEmail: TEmailAcount;
begin
  lEmail.Name := '';
  lEmail.Address := '';
  lEmail.AddressSend := '';
  lEmail.AddressCopy := '';
  lEmail.AddressHiddenCopy := '';
  lEmail.SmtpHost := '';
  lEmail.SmtpPort := 25;
  lEmail.SmtpUser := '';
  lEmail.SmtpPassword := '';
  ShowErrorEx(pTitle, pText, pException, lEmail);
end;

procedure ShowError(const pTitle, pText: String; pException: Exception; pEmail: TEmailAcount); overload;
begin
  ShowErrorEx(pTitle, pText, pException, pEmail);
end;

//----- eventos e procedimentos do TfrmError -------------------------------------------------------
procedure TfrmError.PrintScreen;
var
  lDC: HDC;
  lBitmap: TBitmap;
begin
  // executando o printscreen
  lDC := GetDC(GetDesktopWindow);
  lBitmap := TBitmap.Create;
  try
    lBitmap.Width:= GetDeviceCaps(lDC, HorzRes);
    lBitmap.Height:= GetDeviceCaps(lDC, VertRes);
    BitBlt(lBitmap.Canvas.Handle, 0, 0, lBitmap.Width, lBitmap.Height, lDC, 0, 0, SRCCOPY);
    // convertendo para jpeg
    jpgScreen.Assign(lBitmap);
  finally
    ReleaseDC(GetDesktopWindow, lDC);
    lBitmap.Free;
  end;
end;

procedure TfrmError.FormCreate(Sender: TObject);
begin
  //inherited;
  ErrorDate := Now;
  HasPrintScreen := False;
  jpgScreen := TJPEGImage.Create;
end;

procedure TfrmError.FormActivate(Sender: TObject);
begin
  //inherited;
  //
end;

procedure TfrmError.FormShow(Sender: TObject);
begin
  //inherited;
  if ( (mText.Lines.Count * 13) > mText.Height ) then
    mText.ScrollBars := ssVertical
  else
    mText.ScrollBars := ssNone;
  Btnok.SetFocus;
end;

procedure TfrmError.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited;
  jpgScreen.Free;
end;

procedure TfrmError.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  //
end;

procedure TfrmError.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmError.lblDetalhesClick(Sender: TObject);
const aHeight : array[0..1] of integer = (235,400);
begin
  mDet.Visible := not(mDet.Visible);

  Height := aHeight[ord(mDet.Visible)];

  imgChecado.Picture.Graphic.SetSize(12,12);
  imgChecado.Repaint;
end;

end.
