unit unRegrasForm;

interface

Uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
   dbctrls, ExtCtrls, Grids, DBGrids, Menus, DBclient, DB, ComCtrls, Buttons, SqlExpr, Mask, WinSock;

Type
  TChars = set of Char;

  TCores = record
    menu      : Integer;
    cor_ribbon: integer;
    posicao_fav:integer;
    // bordas
    edit_borda: Integer;
    // cores
    edit_desab_cor   : TColor;
    edit_focado_cor  : TColor;
    grade_titulo_cor : TColor;
    grade_celula_cor : TColor;
    grade_celula_cor2: TColor;
    grade_selecao_cor: TColor;
    btn_corbaixo     : TColor;
    btn_corcima      : TColor;
    form_cor         : TColor;
    // fontes
    edit_desab_fonte   : TColor;
    edit_focado_fonte  : TColor;
    grade_titulo_fonte : TColor;
    grade_celula_fonte : TColor;
    grade_celula_fonte2: TColor;
    grade_selecao_fonte: TColor;
  end;

function Confirma(const pTexto: String): Boolean; overload;
// usado para exibir uma mensagem de confirmacao ao usuario com posicao da tela
function Confirma(const pTexto: String; const pFormWidth, pFormHeigth: Integer): Boolean; overload;
// usado para exibir uma mensagem ao usuario
procedure Informa(const pTexto: String);
// usado para exibir uma mensagem de aviso ao usuario
procedure Aviso(const pTexto: String); overload;
// usado para exibir uma mensagem de aviso ao usuario na posicao da tela indicada
procedure Aviso(const pTexto: String; const pFormWidth, pFormHeigth: Integer); overload;
// usado para exibir uma mensagem de erro ao usuario
procedure Erro(const pTexto: String); overload;
procedure Erro(const pTexto: String; pTitle: String); overload;

function InitCap(s: String): String;

function Criptografa(Action, Src: String; contra_chave : String = ''): String;

procedure LimpaEdits(Objeto: TObject);

function RetiraCaracterNaoNumero(StringTexto: String): String;

function StrZeros(Text: String; nqtde: Integer): string;

function Repl(Caractere: String; nCaracteres: Integer): String;
// tira todos os espacos em branco da string
function AllTrim(InString: String): String;
// alinha a esquerda
function LTrim(Text: String): String;
// tira os espacos a direita de uma string
function Rtrim(Text: String): String;

function FilterChars(const S: string; const ValidChars: TChars): string;

procedure Marca_Desmarca(cds: TObject; campo:string; CampoSelecao: String = 'SELECAO');

procedure AtualizaCores;

var
  Cores: TCores;

implementation

uses unConfirmation, unInformation, unWarning, unError, unPrincipal;

function Confirma(const pTexto: String): Boolean;
begin
  Result := ShowConfirmation(pTexto);
end;

function Confirma(const pTexto: String; const pFormWidth, pFormHeigth: Integer): Boolean;
begin
  Result := ShowConfirmationEx(pTexto, sctbOkCancel, 'Confirmação', pFormWidth, pFormHeigth);
end;

procedure Informa(const pTexto: String);
begin
  ShowInformation('', pTexto);
end;

procedure Aviso(const pTexto: String); overload;
begin
  ShowWarning('', pTexto);
end;

procedure Aviso(const pTexto: String; const pFormWidth, pFormHeigth: Integer); overload;
begin
  ShowWarningEx('', pTexto, 'Aviso', pFormWidth, pFormHeigth);
end;

procedure Erro(const pTexto: String); overload;
begin
  ShowError('', pTexto);
end;

procedure Erro(const pTexto: String; pTitle: String); overload;
begin
  ShowError(pTitle, pTexto);
end;

function InitCap(s: String): String;
begin
  Result := '';
  if ( s <> '' ) then
    Result := UpperCase(Copy(s, 1, 1)) + LowerCase(Copy(s, 2, Length(s)));
end;

function Criptografa(Action, Src: String; contra_chave : String = ''): String;
label Fim;
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if ( Src = '' ) Then
  begin
    Result:= '';
    goto Fim;
  end;
  key:= contra_chave + '%G1&g@$Tr#0n%*MM4A4VZYW9KHJUI2347EJHJKDF3425SKL';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  //SrcPos := 0;
  //SrcAsc := 0;
  Range := 1;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if ( KeyPos < KeyLen ) then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  else
    if ( Action = UpperCase('D') ) then
    begin
      OffSet := StrToInt('$'+ Copy(Src,1,2));
      SrcPos := 3;
      repeat
        SrcAsc := StrToInt('$'+ Copy(Src, SrcPos,2));
        if ( KeyPos < KeyLen ) then
          KeyPos := KeyPos + 1
        else
          KeyPos := 1;
        TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        if ( TmpSrcAsc <= OffSet ) then
          TmpSrcAsc := (255 + TmpSrcAsc - OffSet)
        else
          TmpSrcAsc := (TmpSrcAsc - OffSet);
        Dest := Dest + Chr(TmpSrcAsc);
        OffSet := SrcAsc;
        SrcPos := SrcPos + 2;
      until (SrcPos >= Length(Src));
    end;
  Result:= Dest;
  Fim:
end;

procedure LimpaEdits(Objeto: TObject);
var
  i: Integer;
begin
  for i := 0 to ((Objeto as TForm).ComponentCount - 1) do
  begin
    if (((Objeto as TForm).Components[i].ClassName = 'TDBEdit')) then
      ((Objeto as TForm).Components[i] as TDBEdit).Clear
    else if (((Objeto as TForm).Components[i].ClassName = 'TEdit')) then
      ((Objeto as TForm).Components[i] as TEdit).Clear;
  end;
end;

function RetiraCaracterNaoNumero(StringTexto: String): String;
var
  i, tamanho: Integer;
  AuxStr: String;
begin
  AuxStr:= '';
  tamanho:= length(StringTexto);
  for i:= 1 to tamanho do
    if ( StringTexto[i] in ['0'..'9'] ) then
      AuxStr:= AuxStr + StringTexto[i];
  Result:= AuxStr;
end;

function StrZeros(Text: String; nqtde: Integer):string;
begin
  StrZeros := Repl('0', nQtde - Length(Text)) + alltrim(Text);
end;

function Repl(Caractere: String; nCaracteres: Integer): String;
var
  n: Integer;
  CadeiaCar: String;
begin
  CadeiaCar := '';
  for n := 1 to nCaracteres do
    CadeiaCar := CadeiaCar + Caractere;
  Result := CadeiaCar;
end;

function AllTrim(InString: String): String;
begin
  AllTrim := LTrim(RTrim(InString));
end;

function LTrim(Text: String): String;
var
  n: integer;
begin
  for n := 1 to Length(Text) do
  begin
    if ( Copy(Text, n, 1) <> ' ' ) then
      Break;
    Delete(Text, n, 1);
  end;
  Result := Text;
end;

function RTrim(Text: String): String;
var
  n: Integer;
begin
  for n := Length(Text) downto 1 do
  begin
    if ( Copy(Text,n,1) <> ' ' ) then
      Break;
    Delete(Text,n,1);
  end;
  Result := Text;
end;

function FilterChars(const S: string; const ValidChars: TChars): string;
var I: integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] in ValidChars then
      Result := Result + S[I];
end;

procedure Marca_Desmarca(cds: TObject; campo:string; CampoSelecao: String = 'SELECAO');
begin
  if ( cds.ClassType = TClientDataSet ) then
  begin
    if ( TClientDataSet(cds).Active ) then
    begin
      if TClientDataSet(cds).IsEmpty then
        exit;

      if ( uppercase(campo) = CampoSelecao ) then
      begin
        TClientDataSet(cds).Edit;
        if ( (TClientDataSet(cds).FieldByName(CampoSelecao).AsString = '0') ) then
          TClientDataSet(cds).FieldByName(CampoSelecao).AsString := '1'
        else if ( (TClientDataSet(cds).FieldByName(CampoSelecao).AsString = '1') ) then
          TClientDataSet(cds).FieldByName(CampoSelecao).AsString := '0';
       TClientDataSet(cds).Post;
      end;
    end;
  end;
end;

procedure AtualizaCores;
begin
  Cores.edit_desab_cor      := StringToColor('$00FFC6C6');
  Cores.edit_desab_fonte    := StringToColor('$00A45200');
  Cores.edit_focado_cor     := StringToColor('$00A4FFFF');
  Cores.edit_focado_fonte   := StringToColor('$00713800');
  Cores.grade_titulo_cor    := StringToColor('$00FFC6C6');
  Cores.grade_titulo_fonte  := StringToColor('$00A45200');
  Cores.grade_selecao_cor   := StringToColor('$00CC9797');
  Cores.grade_selecao_fonte := StringToColor('clwhite'  );
  Cores.grade_celula_cor    := StringToColor('$00E4E4E4');
  Cores.grade_celula_fonte  := StringToColor('$00A45200');
  Cores.grade_celula_cor2   := StringToColor('$00CCFFFF');
  Cores.grade_celula_fonte2 := StringToColor('$00A45200');
  Cores.form_cor            := StringToColor('$00FFD9D9');
  Cores.btn_corcima         := StringToColor('$00FFEAEA');
  Cores.btn_corbaixo        := StringToColor('$00FFAEAE');
  Cores.menu                := 0;
  Cores.edit_borda          := 0;
  Cores.cor_ribbon          := 2;
  Cores.posicao_fav         := 0;
end;
end.
