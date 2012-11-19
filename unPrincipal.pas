unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls,cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinsdxBarPainter, dxBar, dxRibbon,
  cxClasses, ImgList, RibbonLunaStyleActnCtrls, ActnList, ActnMan,
  PlatformDefaultStyleActnCtrls, dxStatusBar, dxRibbonStatusBar, ToolWin, Menus, dxRibbonForm,
  unPadrao, ExtCtrls;

type
  TfrmPrincipal = class(TdxRibbonForm)
    ImageList32x32: TImageList;
    dxBarManager1: TdxBarManager;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    ImageList16x16: TImageList;
    dxRibbon1: TdxRibbon;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    confirmou_login: boolean;
    procedure AbrirMenu;
    procedure MenuClick(Sender: TObject);
    procedure Abrir_Formulario(pForm, pCodMenu, pParamTag: String);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}
uses unCadImpressoras, unMenu, unDM;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  if confirmou_login then
    AbrirMenu;
end;

procedure TfrmPrincipal.AbrirMenu;
begin
  frmMenu := TfrmMenu.Create(nil);
  try
    frmMenu.CarregarMenuPrincipal(frmMenu.MainMenuPadrao, dxRibbon1, dxBarManager1);
  finally
    frmMenu.Free;
  end;
end;

procedure TfrmPrincipal.MenuClick(Sender: TObject);
begin
  if TMenuItem(Sender).Count <= 0 then
    Abrir_Formulario('', TMenuItem(Sender).Name, '');
end;

procedure TfrmPrincipal.Abrir_Formulario(pForm, pCodMenu, pParamTag: String);
var
  lClassPersistente: TPersistentClass;
  lFormulario: TfrmPadrao;
  lNomeFormulario: String;
  i, lFormIndex,lFormNormalIndex: Integer;
begin
  DM.BuscaQry(DM.QR_Busca,
  ' SELECT                                          '+
  ' MENUS.FORMULARIO,                               '+
  ' MENUS.DESC_MENU                                 '+
  ' FROM MENUS                                      '+
  ' WHERE MENUS.NOME_MENU = ' + QuotedStr(pcodMenu)  );
  pForm := DM.QR_Busca.fieldbyname('FORMULARIO').AsString;
  DM.QR_Busca.Close;

  if ( pForm <> '' ) then
  begin
    lNomeFormulario := pForm;
    // verificando se o form ja esta aberto
    lFormIndex       := -1;
    lFormNormalIndex := -1;

    for i := 0 to (TfrmPrincipal(Application.MainForm).MDIChildCount - 1) do
    begin
      if ( AnsiLowerCase(lNomeFormulario) = AnsiLowerCase(TfrmPrincipal(Application.MainForm).MDIChildren[i].ClassName) ) then
        lFormIndex := i;
    end;

    for i := 0 to Application.ComponentCount - 1 do
    begin
      if ( AnsiLowerCase(lNomeFormulario) = AnsiLowerCase(Application.Components[i].ClassName) ) then
        lFormNormalIndex := i;
    end;

    // o form  MDIChildren  esta aberto, mostre-o
    if ( lFormIndex > -1 ) then
    begin
      TfrmPrincipal(Application.MainForm).MDIChildren[lFormIndex].Show;
      Exit;
    end;

    // o form  fsnormal  esta aberto, mostre-o
    if ( lFormNormalIndex > -1 ) then
    begin
      TfrmPrincipal(Application.Components[lFormNormalIndex]).BringToFront;
      Exit;
    end;

    // o form nao esta aberto, abrindo-o
    if ( lNomeFormulario <> '' ) then
    begin
      lClassPersistente := GetClass(lNomeFormulario);
      if ( lClassPersistente <> nil ) then
      begin
        lFormulario := (TComponentClass(lClassPersistente).Create(Application) as TfrmPadrao);
        lFormulario.Nome_Menu := pCodMenu;
        lFormulario.Show;
      end

    end;
  end;
end;

end.
