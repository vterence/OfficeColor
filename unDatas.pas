unit unDatas;

interface                                                              

uses StdCtrls, SysUtils, Controls,maskutils,LabeledDBEdit;

{retornar anomes anterior à data informada}
function AnoMes_Anterior(data:TDateTime):integer ;

function Formata_Data_NFP(data_ini:TDateTime):string;

{ retorna o ano mes atual }
function AnoMes_Atual:integer;

{ retorna o ano mes da data passada como parametros }
function AnoMes_Data(Data:TDateTime):integer;

{ retorna o ano mes no formato MM/AAAA }
function ConverterMesAno(pAnoMes : integer) : string;

{ retorna o ultimo dia do mês }
function UltimoDiaMes(pData : TDateTime) : TDateTime;

{ retorna o primeiro dia da semana (domingo) }
function PrimeiroDiaSemana(pData : TDateTime) : TDateTime;

{ retorna o primeiro dia da semana (Sabado) }
function UltimoDiaSemana(pData : TDateTime) : TDateTime;

{ Função que Completa a Data digitada no Edit }
function FiltraData(Data: TCustomEdit): string;

{ Rotina que Coloca a Mascara da Data em classes do tipo TDBEdit, TMaskEdit e TEdit }
procedure MascaraData(Caixa: TCustomEdit; var Key: Char);

{ Função que retorna a quantidade de dias do Mes }
function DiasPorMes(Ano, Mes: Integer): Integer;

{ Função que Verifica se o ano é Bi-Sexto }
function AnoBiSexto(Ano: Integer): Boolean;

{funcao que retorna a data invertida ,para consultas sql}
function Inverte_Data(data:string):string;

{ Função que retorna o período do dia a partir do horário passado }
function Saudacao(Hora:string):string;

{ Função que retorna o dia da semana por extenso }
function Semana(dtData:TDateTime; tipo:boolean = true):string;

{ Função que retorna o mês por extenso }
Function Mes_Extenso(Mes : string) : string;

{ Retorna uma data acrescida de mais um certo número de dias }
function Datafinal(dataini: tdatetime; dias: integer): tdatetime;

{retorna a diferenca entre duas datas}
function DifDias(DataMaior:TDateTime; DataMenor:TDateTime): integer;

{compara duas datas, verificando se a primeira é maior que a segunda}
function Verifica_Periodo(data_ini,data_fim:TDateTime):boolean ;

{compara duas datas, verificando se a primeira é maior que a segunda}
Function Mes_Abreviado(Mes : string) : string;

// Obtendo uma data acrescida de xMeses
Function SomaMes (dData : TDateTime; xMeses : Integer; lCorrido : boolean) : TDateTime;

//RETORNA O CODIGO DO MES, USADA NO SICRED
function Retorma_Cod_Mes(Mes : integer):string;

Function MenorDataValida (Ano, Mes, Dia : word) : TDateTime;

{ SOMA DIAS ÚTEIS A UMA DATA, RETORNADO A DATA FINAL, TRATANDO OS FINAIS DE SE-}
{ MANA E FERIADOS CADASTRADOS NA TABELA FERIADOS.                              }
function SomaDiasUteisDB(DataInicial: TDateTime; dias_uteis: Integer): TDateTime;

{ RETORNA A QTD DE DIAS ÚTEIS ENTRE 2 DATAS, TRATANDO OS FINAIS DE SEMANAS E   }
{ FERIADOS CADASTRADOS NA TABELA FERIADOS.                                     }
function QtdDiasUteis(DataInicial, DataFinal: TDateTime): Integer;

function ValidaAno(edtAno: TCustomEdit): boolean;

function DataExtenso(Data: TDateTime): string;

function Dias_Atraso(data_inicial, data_atual: tdatetime): integer;

function RetornaAnoMes(Data: TDateTime): string;

// Formata a data para consultas no Firebird, retornando a data no formato DD.MM.AAAA
function FormataDataFirebird(Data: TDateTime): String; overload;
// Recebe a data no formato 'DD/MM/AAAA' e retorna DD.MM.AAAA
function FormataDataFirebird(Data: String): String; overload;

procedure ValidaHora(edt: TGigatronLblEdit);

implementation

uses
   DateUtils, unRegrasForm;

procedure ValidaHora(edt: TGigatronLblEdit);
var text: String;
begin
  if (edt.Text <> '  :  :  ') and (edt.Text <> '') then
  begin
    try
    StrToDateTime(datetostr(date)+' '+ edt.Text);
    except
      aviso('Hora Inválida!');
      edt.SetFocus;
      edt.Clear;
    end;
  end;
end;


function Formata_Data_NFP(data_ini:TDateTime):string;
var ano,mes,dia : word;
begin
  DecodeDate(data_ini,ano,mes,dia);
  Formata_Data_NFP := strzeros(inttostr(ano),4)+strzeros(inttostr(mes),2)+strzeros(inttostr(dia),2);
end;   

function Dias_Atraso(data_inicial, data_atual: tdatetime): integer;
var dias: extended;
begin
  dias := (data_atual - data_inicial);
  Dias_Atraso := round(dias);
end;

function DataExtenso(Data: TDateTime): string;
var NoDia: Integer;
  Dia, Mes, Ano: Word;
  //Now           : TdateTime;
  DiaDaSemana: array[1..7] of string;
  Meses: array[1..12] of string;
begin
  { Dias da Semana }
  DiaDasemana[1] := 'DOMINGO';
  DiaDasemana[2] := 'SEGUNDA-FEIRA';
  DiaDasemana[3] := 'TERCA-FEIRA';
  DiaDasemana[4] := 'QUARTA-FEIRA';
  DiaDasemana[5] := 'QUINTA-FEIRA';
  DiaDasemana[6] := 'SEXTA-FEIRA';
  DiaDasemana[7] := 'SABADO';
  { Meses do ano }
  Meses[1] := 'Janeiro';
  Meses[2] := 'Fevereiro';
  Meses[3] := 'Marco';
  Meses[4] := 'Abril';
  Meses[5] := 'Maio';
  Meses[6] := 'Junho';
  Meses[7] := 'Julho';
  Meses[8] := 'Agosto';
  Meses[9] := 'Setembro';
  Meses[10] := 'Outubro';
  Meses[11] := 'Novembro';
  Meses[12] := 'Dezembro';
  DecodeDate(Data, Ano, Mes, Dia);
  NoDia := DayOfWeek(Data);
  Result := DiaDaSemana[NoDia] + ', ' + inttostr(Dia) + ' de ' + Meses[Mes] + ' de ' + inttostr(Ano);
end;
   



function Retorma_Cod_Mes(Mes : integer):string;
begin
  case Mes of
    1  : Retorma_Cod_Mes := '1';
    2  : Retorma_Cod_Mes := '2';
    3  : Retorma_Cod_Mes := '3';
    4  : Retorma_Cod_Mes := '4';
    5  : Retorma_Cod_Mes := '5';
    6  : Retorma_Cod_Mes := '6';
    7  : Retorma_Cod_Mes := '7';
    8  : Retorma_Cod_Mes := '8';
    9  : Retorma_Cod_Mes := '9';
    10 : Retorma_Cod_Mes := 'O';
    11 : Retorma_Cod_Mes := 'N';
    12 : Retorma_Cod_Mes := 'D';
  end;
end;

// Obtendo a maior data anterior a uma data inválida
Function MenorDataValida (Ano, Mes, Dia : word) : TDateTime;
Var 
Continua : Boolean; 
DataAux : TDateTime;
begin
  Continua := True;
  DataAux := date;
  while Continua do
  Try
    DataAux := EncodeDate ( Ano, Mes, Dia);
    Continua := False;
  Except
    Dec (Dia);
  End;
  MenorDataValida := DataAux;
end;


// Obtendo uma data acrescida de xMeses
Function SomaMes (dData : TDateTime; xMeses : Integer; lCorrido : boolean) : TDateTime;
var
Ano, Mes, Dia : word;
DataAux : TDateTime;
begin
  DecodeDate(dData, Ano, Mes, Dia);
  Mes     := Mes + xMeses                   ;
  Ano     := Ano + (Mes DIV 12)             ;
  Mes     := Mes mod 12                     ;
  DataAux := MenorDataValida (Ano, Mes, Dia);
  if not lCorrido Then
    DataAux := DataAux - 1;
  SomaMes := DataAux;
end;


{retornar anomes anterior à data informada}
function AnoMes_Anterior(data:TDateTime):integer ;
var ano,mes:integer;  ano_mes:string;
begin
  ano := YearOf (data);
  mes := MonthOf(data);
  if Length(inttostr(ano)) = 2 then
    ano := strtoint('20'+inttostr(ano));

  if mes = 1 then
     AnoMes_Anterior := strtoint(inttostr((ano - 1)) + '12')
  else
    AnoMes_Anterior := strtoint( inttostr(ano)+ strzeros(inttostr(mes - 1),2));
end;

function AnoMes_Atual:integer;
var ano,mes:integer;  ano_mes:string;
begin
  ano :=YearOf(date);
  mes := MonthOf(date);
  if Length(inttostr(ano)) = 2 then
    ano_mes := '20';

  if Length(inttostr(mes)) = 1 then
    ano_mes := ano_mes + inttostr(ano) + '0'+ inttostr(mes)
  else
    ano_mes := ano_mes + inttostr(ano) + inttostr(mes);

  AnoMes_Atual := strtoint(ano_mes);
end;

function AnoMes_Data(Data:TDateTime):integer;
var ano,mes:integer;  ano_mes:string; data_str:string;
begin
  ShortDateFormat     := 'dd/mm/yyyy' ;
  data_str    := datetostr(Data);
  AnoMes_Data := strtoint(copy(data_str,7,4)+copy(data_str,4,2));


  {ano :=YearOf(Data);
  mes := MonthOf(Data);
  if Length(inttostr(ano)) = 2 then
    ano_mes := '20';
  if Length(inttostr(mes)) = 1 then
    mes := strtoint('0'+inttostr(mes));

  ano_mes := ano_mes + inttostr(ano) + inttostr(mes);
  AnoMes_Data := strtoint(ano_mes);   }
end;

function ConverterMesAno(pAnoMes : integer) : string;
begin
  Result := copy(intToStr(pAnoMes),5,2)+'/'+copy(intToStr(pAnoMes),1,4);
end;

function Verifica_Periodo(data_ini,data_fim:TDateTime):boolean ;
begin
  if data_ini > data_fim then
    Result := false
  else
    Result := true;
end;

function DifDias(DataMaior:TDateTime; DataMenor:TDateTime): integer;
Var  dias:extended;
begin
  if DataMaior < DataMenor then
    begin
      Result := -1;
    end
  else
    begin
      dias := DataMaior - DataMenor;
      Result := round(dias);
    end;
end;

{ Retorna uma data acresçida de mais um certo número de dias }
function Datafinal(dataini: tdatetime; dias: integer): tdatetime;
begin
   result := dataini+dias;
end;

{ Função que retorna o mês por extenso }
Function Mes_Extenso(Mes : string) : string;
var
   mes_int:integer;
begin
   mes_int:=strtoint(Mes);
   case mes_int of
      01: Result := 'Janeiro';
      02: Result := 'Fevereiro';
      03: Result := 'Março';
      04: Result := 'Abril';
      05: Result := 'Maio';
      06: Result := 'Junho';
      07: Result := 'Julho';
      08: Result := 'Agosto';
      09: Result := 'Setembro';
      10: Result := 'Outubro';
      11: Result := 'Novembro';
      12: Result := 'Dezembro';
   else
      Result := '';
   end;
end;

{ Função que retorna o mês por extenso }
Function Mes_Abreviado(Mes : string) : string;
var
   mes_int:integer;
begin
   mes_int:=strtoint(Mes);
   case mes_int of
      01: Result := 'Jan';
      02: Result := 'Fev';
      03: Result := 'Mar';
      04: Result := 'Abr';
      05: Result := 'Mai';
      06: Result := 'Jun';
      07: Result := 'Jul';
      08: Result := 'Ago';
      09: Result := 'Set';
      10: Result := 'Out';
      11: Result := 'Nov';
      12: Result := 'Dez';
   else
      Result := '';
   end;
end;

{ Função que retorna o dia da semana por extenso }
function Semana(dtData:TDateTime; tipo:boolean = true):string;
var
   intDiaSemana: integer;
   strDiaSemana: string;
begin
   intDiaSemana :=DayOfWeek(dtData);
   if tipo then
     begin
       case intDiaSemana of
          1: strDiaSemana := 'Domingo, '       ;
          2: strDiaSemana := 'Segunda-feira,  ';
          3: strDiaSemana := 'Terça-feira, '   ;
          4: strDiaSemana := 'Quarta-feira, '  ;
          5: strDiaSemana := 'Quinta-feira, '  ;
          6: strDiaSemana := 'Sexta-feira,  '  ;
          7: strDiaSemana := 'Sábado, '        ;
       end;
     end
   else
     begin
       case intDiaSemana of
          1: strDiaSemana := 'DOM' ;
          2: strDiaSemana := 'SEG' ;
          3: strDiaSemana := 'TER' ;
          4: strDiaSemana := 'QUA' ;
          5: strDiaSemana := 'QUI' ;
          6: strDiaSemana := 'SEX' ;
          7: strDiaSemana := 'SAB' ;
       end;
     end;
   Result := strDiaSemana;
end;


{ Função que retorna o período do dia a partir do horário passado }
function Saudacao(Hora:string):string;
begin
   if (Hora > '00:00:00') and (Hora < '12:00:00') then
      Result:='Bom Dia'
   else if (Hora > '12:00:00') and (Hora < '18:00:00') then
      Result:='Boa Tarde'
   else
      Result:='Boa Noite';
end;


{funcao que retorna a data invertida ,para consultas sql}
function Inverte_Data(data:string):string;
begin
  Inverte_Data:=copy(data,4,2)+'/'+copy(data,1,2)+'/'+copy(data,7,4);
end;

function ValidaAno(edtAno: TCustomEdit): boolean;
var Dia, Mes, Ano: word;
  sAno: string;
begin
  sAno := '';
  DecodeDate(now, Ano, Mes, Dia);
  if (length(edtAno.Text) = 4) then
    sAno := edtAno.Text
  else if (length(edtAno.Text) = 10) then
    sAno := copy(edtAno.Text, 7, 4);

  if (length(sAno) = 4) then
  begin
    result := true;
    if ((Ano + 2) < strtoint(sAno)) or ((Ano - 2) > strtoint(sAno)) then
      Aviso('O Ano Informado Está Com Dois Anos de Diferença do Ano atual!');
  end
  else
  begin
    result := false;
    Informa('Ano Não Informado ou Inválido!');
    edtAno.SetFocus;
  end;
end;


{ Função que Completa a Data digitada no Edit }
function FiltraData(Data: TCustomEdit): string;
var wDia, wMes, wAno: Word;
    sDia, sMes, sAno: string;
    edtAno: TEdit;
begin

   DecodeDate(Date, wAno, wMes, wDia); // Data atual
   sDia := FilterChars(trim(copy(Data.Text,1,2)),['0'..'9']);
   sMes := FilterChars(trim(copy(Data.Text,4,2)),['0'..'9']);
   sAno := FilterChars(trim(copy(Data.Text,7,4)),['0'..'9']);

   edtAno := TEdit.Create(nil);
   edtAno.Text := sAno;

   if (sAno = '') then
      sAno := inttostr(wAno)
   else if (Length(sAno) = 4) then
      ValidaAno(edtAno)
   else if (Length(sAno) <> 4) then
   begin
      if (Length(sAno) <= 2) then
      begin
         if strtoint(sAno) <= 20 then
            sAno := inttostr(2000+strtoint(sAno))
         else
            sAno := inttostr(1900+strtoint(sAno));
      end
      else sAno := inttostr(wAno);
   end;

   edtAno.Free;
   
   if (sMes = '') or (strtoint(sMes) = 0) or (strtoint(sMes) > 12) then
      sMes := strzeros(inttostr(wMes),2)
   else if strtoint(sMes) <> 0 then
      sMes := strzeros(sMes,2);
   if (sDia = '') or (strtoint(sDia) = 0) then
      sDia := strzeros(inttostr(wDia),2)
   else if (strtoint(sDia) > DiasPorMes(strtoint(sAno),strtoint(sMes))) then
      sDia := inttostr(DiasPorMes(strtoint(sAno),strtoint(sMes)))
   else if strtoint(sDia) <> 0 then
      sDia := strzeros(sDia,2);
   Data.Text := sDia+'/'+sMes+'/'+sAno;
   Result    := sMes+'/'+sDia+'/'+sAno;
end;



{ Rotina que Coloca a Mascara da Data em classes do tipo TDBEdit, TMaskEdit e TEdit }
procedure MascaraData(Caixa: TCustomEdit; var Key: Char);
var conteudo, posicao, mascara: string;
    i, contem: integer;
begin
   { verifica se o Edit já contém data completa }
   contem := 0;
   for i := 1 to length(Caixa.Text) do
   if Caixa.Text[i] in ['0'..'9'] then
      inc(contem);

   if contem < 8 then
   begin
      mascara := '__/__/____';
      { verifica se o Edit está vazio e coloca a máscara padrão }
      if key = #0 then
      begin
         if Caixa.Text = ''
         then Caixa.Text := mascara
         else exit;
      end
      else if key in ['0'..'9'] then
      begin
         for i := 1 to length(Caixa.Text) do
         if Caixa.Text[i] in ['0'..'9'] then
         begin
            conteudo := conteudo+Caixa.Text[i];
            if (length(conteudo) = 2) then       // dia
               conteudo := conteudo+'/'
            else if (length(conteudo) = 5) then  // mês
               conteudo := copy(conteudo,1,2)+'/'+copy(conteudo,4,2)+'/';
         end;
         conteudo := conteudo+key;
         if (length(conteudo) = 2) then          // dia
            conteudo := conteudo+'/'
         else if (length(conteudo) = 5) then     // mês
            conteudo := copy(conteudo,1,2)+'/'+copy(conteudo,4,2)+'/';
      end
      else if key = '/' then
      begin
         for i := 1 to length(Caixa.Text) do
         if Caixa.Text[i] in ['0'..'9'] then
            conteudo := conteudo+Caixa.Text[i];
         if (length(conteudo) <= 2) then         // dia
            conteudo := strzeros(conteudo,2)+'/'
         else if (length(conteudo) <= 5) then    // mês
            conteudo := copy(conteudo,1,2)+'/'+strzeros(copy(conteudo,3,2),2)+'/';
      end;
      posicao := conteudo;
      conteudo := conteudo+copy(mascara,length(conteudo)+1,11-length(conteudo));;
      Caixa.Text := conteudo;
      { posiciona o cursor }
      Caixa.SelStart := length(posicao);
      key := #0;
   end;
end;

{ Função que retorna a quantidade de dias do Mes }
function DiasPorMes(Ano, Mes: Integer): Integer;
const DiasNoMes: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
   Result := DiasNoMes[Mes];
   if (Mes = 2) and AnoBiSexto(Ano) then
      Inc(Result);
end;

{ Função que Verifica se o ano é Bi-Sexto }
function AnoBiSexto(Ano: Integer): Boolean;
begin
   Result := (Ano mod 4 = 0) and ((Ano mod 100 <> 0) or (Ano mod 400 = 0));
end;

{==============================================================================}
{ SOMA DIAS ÚTEIS A UMA DATA, RETORNADO A DATA FINAL, TRATANDO OS FINAIS DE SE-}
{ MANA E FERIADOS CADASTRADOS NA TABELA FERIADOS.                              }
{==============================================================================}
function SomaDiasUteisDB(DataInicial: TDateTime; dias_uteis: Integer): TDateTime;
  function BuscaFeriado(data: TDate): Boolean;
  begin
      { Result:= PesquisaDescricao(DM.sd_pesquisas.SQLConnection, 'feriados',
         'tipo_data = 0 and data = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', data)),
         'descricao') <> 'Registro não encontrado!';     }
  end;//fim do function

  function BuscaDiaExtra(data: TDate): Boolean;
  begin
     {  Result:= PesquisaDescricao(DM.sd_pesquisas.SQLConnection, 'feriados',
         'tipo_data = 1 and data = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', data)),
         'descricao') <> 'Registro não encontrado!';     }
  end;//fim do function
var
   i, feriados_uteis, dias_extras: Integer;
   inicial, final, AuxData: TDate;
   dataOK: Boolean;
begin
     inicial:= DataInicial;

     dataOK:= False;
     // deixa a data inicial já num dia útil
     while not dataOK do
     begin
          { se for extra }
          if BuscaDiaExtra(inicial) then
            dataOK:= True
          { senão, se for feriado }
          else if BuscaFeriado(inicial) then
            inicial:= IncDay(inicial, 1)
          { senão, se for sábado }
          else if DayOfWeek(inicial) = 7 then
            inicial:= IncDay(inicial, 1)
          { senão, se for domingo }
          else if DayOfWeek(inicial) = 1 then
            inicial:= IncDay(inicial, 1)
          { senão, é um dia útil }
          else
            dataOK:= True;
     end;//fim do while

     { faz data final + dias_uteis, tratando os finais de semana }
     dataOK:= False;
     final:= DataInicial;
     for i:= 1 to dias_uteis - 1 do
     begin
          final:= IncDay(final, 1);

          dataOK:= False;
          while not dataOK do
          begin
               { se for extra }
               if BuscaDiaExtra(final) then
                 dataOK:= True
               { senão, se for feriado }
               else if BuscaFeriado(final) then
                 final:= IncDay(final, 1)
               { senão, se for sábado }
               else if DayOfWeek(final) = 7 then
                 final:= IncDay(final, 1)
               { senão, se for domingo }
               else if DayOfWeek(final) = 1 then
                 final:= IncDay(final, 1)
               { senão, é um dia útil }
               else
                 dataOK:= True;
          end;//fim do while
     end;

     result := final;
end;

{==============================================================================}
{ RETORNA A QTD DE DIAS ÚTEIS ENTRE 2 DATAS, TRATANDO OS FINAIS DE SEMANAS E   }
{ FERIADOS CADASTRADOS NA TABELA FERIADOS.                                     }
{==============================================================================}
function QtdDiasUteis(DataInicial, DataFinal: TDateTime): Integer;
  function BuscaFeriado(data: TDate): Boolean;
  begin
    {   Result:= PesquisaDescricao(DM.sd_pesquisas.SQLConnection, 'feriados',
         'tipo_data = 0 and data = ' + QuotedStr(FormatDateTime('DD.MM.YYYY', data)),
         'descricao') <> 'Registro não encontrado!';   }
  end;//fim do function
var
   i, qtd_dias, AuxInt: Integer;
begin
     qtd_dias:= DifDias(DataFinal, DataInicial);

     if qtd_dias > 0 then
     begin
          AuxInt:= qtd_dias;
          for i:= 0 to AuxInt do
          begin
               { se encontrar um feriado, desconta nos dias úteis }
               if BuscaFeriado(DataInicial + i) then
                 Dec(qtd_dias)
               { senão, se for sábado }
               else if DayOfWeek(DataInicial + i) = 7 then
                 Dec(qtd_dias)
               { senão, se for domingo }
               else if DayOfWeek(DataInicial + i) = 1 then
                 Dec(qtd_dias);

               if qtd_dias = 0 then
                 Break;
          end;//fim do for
     end;//fim do if

     result := qtd_dias;
end;

function UltimoDiaMes(pData : TDateTime) : TDateTime;
begin
  result := EncodeDate(YearOf(pData), MonthOf(pData), MonthDays[IsLeapYear(YearOf(pData)), MonthOf(pData)]);
end;

function PrimeiroDiaSemana(pData : TDateTime) : TDateTime;
var dia : integer;
begin
  dia := DayOfWeek(pData)-1;
  Result := pData - dia;
end;

function UltimoDiaSemana(pData : TDateTime) : TDateTime;
var dia : integer;
begin
  dia := 7 - DayOfWeek(pData);
  Result := pData + dia;
end;

function RetornaAnoMes(data:TDateTime):string;
var ano,mes:word; sano,smes:string;
begin
  ano := YearOf (data);
  mes := MonthOf(data);

  smes := strzeros(inttostr(mes),2);
  sano := inttostr(ano);
  if length(sano) = 2 then
    sano := '20'+sano;
  RetornaAnoMes := sano + smes;
end;

function FormataDataFirebird(data:TDateTime):String;
begin
  FormataDataFirebird := FormatDateTime('dd.mm.yyyy',data);
end;

function FormataDataFirebird(data:String):String;
begin
  FormataDataFirebird := StringReplace(data,'/', '.',  [rfReplaceAll, rfIgnoreCase]);
end;

end.

