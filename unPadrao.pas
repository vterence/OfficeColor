unit unPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, cxDB, cxDBLookupComboBox, LabeledDBEdit, ExtCtrls,
  StdCtrls;

type
  TFrmPadrao = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    DBEdit_Ant   : TDBEdit;
    Edit_Ant     : TEdit;
    Combo_Ant    : TComboBox;
    dbMemo_Ant   : TDBMemo;
    Memo_Ant     : TMemo;
    lDBEdit_Ant  : TLabeledDBEdit;
    Gigatron_ant : TGigatronLblEdit;

    Aux: TFont;
  public
    { Public declarations }
    Nome_Menu: String;
    procedure ControleFoco(Sender: TObject); virtual;
  end;

var
  FrmPadrao: TFrmPadrao;

implementation

{$R *.dfm}
Uses unRegrasForm, unDM, unPadraoCadastro;

procedure TFrmPadrao.ControleFoco(Sender : TObject);
var
  fonte: TFont;
begin
  fonte := TFont.Create;
  fonte.Color := clBlack;
  fonte.Name := 'Courier New';
  fonte.Style := [];
//  fonte.Size := Aux.Size;

   //----- TLabeledDBEdit ---------------------------------------------------------------------------
  if ( Assigned(lDBEdit_Ant) ) then
  begin
    lDBEdit_Ant.Color := clWhite;
    lDBEdit_Ant.Font := fonte;
  end;
  if ( self.ActiveControl is TLabeledDBEdit ) then
  begin
    if ( not TLabeledDBEdit(ActiveControl).ReadOnly ) then
      lDBEdit_Ant := TLabeledDBEdit(ActiveControl);
  end
  else
    lDBEdit_Ant := nil;

  //----- TGigatronLblEdit -------------------------------------------------------------------------
  if ( Assigned(Gigatron_ant) ) then
  begin
    Gigatron_ant.color := clWhite;
    Gigatron_ant.Font := fonte;
  end;
  if ( ActiveControl is TGigatronLblEdit ) then
  begin
    if ( not TGigatronLblEdit(ActiveControl).ReadOnly ) then
      Gigatron_ant := TGigatronLblEdit(ActiveControl);
  end
  else
    Gigatron_ant := nil;

  //----- dbedit ---------------------------------------------------------------------------
  if ( Assigned(DBEdit_Ant) ) then
  begin
    DBEdit_Ant.Color := clWhite;
    DBEdit_Ant.Font := fonte;
  end;
  if ( ActiveControl is TDBEdit ) then
  begin
    if ( not TDBEdit(ActiveControl).ReadOnly ) then
      DBEdit_Ant := TDBEdit(ActiveControl);
  end
  else
    DBEdit_Ant := nil;

  fonte.free;
end;

procedure TFrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TFORM(Sender).Release;
  Sender := nil;
end;

procedure TFrmPadrao.FormCreate(Sender: TObject);
begin
//  aux := TFont.create;
end;

procedure TFrmPadrao.FormDestroy(Sender: TObject);
begin
//  if ( Aux <> nil ) then
//    Aux.Free;
end;

procedure TFrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
var teste: string;
begin
  if not Assigned(ActiveControl) then
    Exit;

  teste := (ActiveControl as TComponent).Name;

  teste := (ActiveControl as TComponent).ClassName;

  if  (UpperCase(teste) <> UpperCase('TDBEdit')) then
  begin
    {if (ActiveControl is TCustomEdit) and (UpperCase(copy(TCustomEdit(ActiveControl).Name, 1, 8)) = 'DEDTDATA') then
      MascaraData(TCustomEdit(FindComponent(TCustomEdit(ActiveControl).Name)), Key);  }
    if (ActiveControl is TDBEdit) and (TDBEdit(ActiveControl).Field.ClassType = TFMTBCDField) then
      if key = '.' then key := ',';
//    if (ActiveControl is TCustomEdit) and (UpperCase(copy(TCustomEdit(ActiveControl).Name,1,4)) = 'NEDT') then
//       AceitaSomenteNumeros(Key);
  end;

  //daqui para baixo tratamento do plin

  case Key of
  //qdo pressiona espaço para marcar/desmarcar o checkbox executa o plin
    #32:
    begin
      if  (UpperCase(teste) = UpperCase('TcxDBCheckBox')) or
          (UpperCase(teste) = UpperCase('TcxCheckBox'  )) then
     Key:= #0;
    end;

    // selecionando o proximo controle
    #13:
    begin
      if  ((UpperCase(teste) = UpperCase('TLabeledDBEdit')) or (UpperCase(teste) = UpperCase('TGigatronLblEdit'))) then
      begin
        if (UpperCase(teste) = UpperCase('TLabeledDBEdit')) then
          if  (ActiveControl as TLabeledDBEdit).IsForeignKey then
            Key:= #0;

        if (UpperCase(teste) = UpperCase('TGigatronLblEdit')) then
          if  (ActiveControl as TGigatronLblEdit).IsForeignKey then
            Key:= #0;
      end;

      if  (UpperCase(teste) = UpperCase('TDBEdit') ) then
      begin
          Key:= #0;
      end;

      if (UpperCase(teste) = UpperCase('Tcxgridsite')) or (UpperCase(teste) = UpperCase('TcxCustomInnerTextEdit'))then
        (ActiveControl as TComponent).Tag := 200;

      if ( Copy(IntToStr((ActiveControl as TComponent).Tag), 1, 1) = '2' ) then
        Exit;      Key:= #0;

      Perform(CM_DIALOGKEY, VK_TAB, 0);
    end;

    // selecionando o controle anterior
    #27:
    begin
      Key:= #0;

      if (UpperCase(teste) = UpperCase('Tcxgridsite')) or (UpperCase(teste) = UpperCase('TcxCustomInnerTextEdit'))then
        (ActiveControl as TComponent).Tag := 200;

      if ( Copy(IntToStr((ActiveControl as TComponent).Tag), 1, 1) = '2' ) then
        Exit;

      Perform(CM_DIALOGKEY, VK_UP, 0);
    end;
  end;
end;

procedure TFrmPadrao.FormShow(Sender: TObject);
begin
  Screen.OnActiveControlChange := ControleFoco;
end;

end.
