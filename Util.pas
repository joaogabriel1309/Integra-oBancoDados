unit Util;

interface

uses
   System.SysUtils,Vcl.Grids,Winapi.Windows,System.Variants,System.Classes,
  Vcl.Controls,Vcl.Dialogs,Vcl.StdCtrls,Bde.DBTables,System.Math;

procedure LimpaStringGrid(StringGrid: TstringGrid);
function SoNumero(RcbValor: string): String;
function SoPonto(RcbString: string): String;
function SoLetras(RcbString: String): String;
function ColocaMaskCPF(RcbString: String): String;
function VerificarCPF(pCPF: String): Boolean;
function VerificaarCNPJ(pCNPJ: String): Boolean;

implementation

procedure LimpaStringGrid(StringGrid: TstringGrid);
var
  I: Integer;
begin
   for I := 1 to StringGrid.RowCount - 1 do
      StringGrid.Rows[I].Clear;
   StringGrid.RowCount := 2;
end;

function SoNumero(RcbValor: string): String;
var I :Integer;
   Resultado: String;
begin
   for I := 1 to Length(RcbValor) do
   begin
      if ((RcbValor[i] in ['0'..'9'])) then
         Resultado := Resultado + RcbValor[i];
   end;
   Result:= Resultado;
end;

function SoPonto(RcbString: string): String;
var I: Integer;
   Resultado: string;
begin
   for I := 1 to Length(RcbString) do
   begin
      if (RcbString[i] = ',') then
         Resultado := Resultado + '.'
      else
         Resultado := Resultado + RcbString[i];
   end;
   Result := Resultado;
end;

function ColocaMaskCPF(RcbString: String): String;
var I :Integer;
   Resultado: String;
begin
//    for I := 1 to Length(RcbString) do
//    begin
//       if (i = 4)or(i = 8) then
//         Resultado := Resultado + '.'
//       else
//       if (i = 10) then
//         Resultado := Resultado + '-'
//       else
//    Resultado := Resultado + RcbString[i];
//    end;
end;

function SoLetras(RcbString: String): String;//recebendo em uppercase
var Resultado: String;
   StringComAcento: String;
  I: Integer;
begin
   for I := 1 to Length(RcbString) do
   begin
      if (RcbString[i] in ['A'..'Z',' '] ) then
         Resultado := Resultado + RcbString[i]
      else
      if (RcbString[i] in ['é','è','ê']) then
         Resultado := Resultado + 'E'
      else
      if (RcbString[i] in ['á','à','ã','â']) then
         Resultado := Resultado +  'A'
      else
      if (RcbString[i] in ['í','ì','î']) then
         Resultado := Resultado + 'I'
      else
      if (RcbString[i] in ['ó','ò','ô','õ']) then
         Resultado := Resultado + 'O'
      else
      if (RcbString[i] in ['ú','ù']) then
         Resultado := Resultado + 'U'
      else
      if (RcbString[i] in ['ç']) then
         Resultado := Resultado +  'C'
      else
      if (RcbString[i] in ['É','È','Ê']) then
         Resultado := Resultado + 'E'
      else
      if (RcbString[i] in ['Á','À','Ã','Â']) then
         Resultado := Resultado +  'A'
      else
      if (RcbString[i] in ['Í','Ì','Î']) then
         Resultado := Resultado + 'I'
      else
      if (RcbString[i] in ['Ó','Ò','Õ','Ô']) then
         Resultado := Resultado + 'O'
      else
      if (RcbString[i] in ['Ú','Ù']) then
         Resultado := Resultado + 'U'
      else
      if (RcbString[i] in ['Ç']) then
         Resultado := Resultado +  'C'
   end;
   Result := Resultado;
end;

function VerificarCPF(pCPF: String): Boolean;
var
  v: array [0 .. 1] of Word;
  cpf: array [0 .. 10] of Byte;
  I: Byte;
begin
  Result := False;
  if Length(pCPF) <> 11 then
  begin
    Exit;
  end;
  if pCPF = StringOfChar('0', 11) then
    Exit;
  if pCPF = StringOfChar('1', 11) then
    Exit;
  if pCPF = StringOfChar('2', 11) then
    Exit;
  if pCPF = StringOfChar('3', 11) then
    Exit;
  if pCPF = StringOfChar('4', 11) then
    Exit;
  if pCPF = StringOfChar('5', 11) then
    Exit;
  if pCPF = StringOfChar('6', 11) then
    Exit;
  if pCPF = StringOfChar('7', 11) then
    Exit;
  if pCPF = StringOfChar('8', 11) then
    Exit;
  if pCPF = StringOfChar('9', 11) then
    Exit;
  try
    for I := 1 to 11 do
      cpf[I - 1] := StrToInt(pCPF[I]);
    v[0] := 10 * cpf[0] + 9 * cpf[1] + 8 * cpf[2];
    v[0] := v[0] + 7 * cpf[3] + 6 * cpf[4] + 5 * cpf[5];
    v[0] := v[0] + 4 * cpf[6] + 3 * cpf[7] + 2 * cpf[8];
    v[0] := 11 - v[0] mod 11;
    v[0] := IfThen(v[0] >= 10, 0, v[0]);
    v[1] := 11 * cpf[0] + 10 * cpf[1] + 9 * cpf[2];
    v[1] := v[1] + 8 * cpf[3] + 7 * cpf[4] + 6 * cpf[5];
    v[1] := v[1] + 5 * cpf[6] + 4 * cpf[7] + 3 * cpf[8];
    v[1] := v[1] + 2 * v[0];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);
    Result := ((v[0] = cpf[9]) and (v[1] = cpf[10]));
  except
    on E: Exception do
      Result := False;
  end;
end;

function VerificaarCNPJ(pCNPJ: String): Boolean;
var dig13, dig14: string;
   sm, i, r, peso: integer;
begin
  if ((pCNPJ = '00000000000000') or
      (pCNPJ = '11111111111111') or
      (pCNPJ = '22222222222222') or
      (pCNPJ = '33333333333333') or
      (pCNPJ = '44444444444444') or
      (pCNPJ = '55555555555555') or
      (pCNPJ = '66666666666666') or
      (pCNPJ = '77777777777777') or
      (pCNPJ = '88888888888888') or
      (pCNPJ = '99999999999999') or
      (length(pCNPJ) <> 14))then
  begin
     VerificaarCNPJ := false;
     exit;
  end;
  try
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
       sm := sm + (StrToInt(pCNPJ[i]) * peso);
       peso := peso + 1;
       if (peso = 10)then
          peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
       dig13 := '0'
    else
       str((11-r):1, dig13);
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
       sm := sm + (StrToInt(pCNPJ[i]) * peso);
       peso := peso + 1;
       if (peso = 10) then
          peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1)) then
       dig14 := '0'
    else
       str((11-r):1, dig14);
    if ((dig13 = pCNPJ[13]) and (dig14 = pCNPJ[14])) then
       VerificaarCNPJ := true
    else
       VerificaarCNPJ := false;
  except
    VerificaarCNPJ := false
  end;
end;

end.
