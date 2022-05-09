unit TREUtil;

interface

uses
   Vcl.Grids,System.SysUtils;

procedure LimpaStringGrid(StringGrid: TstringGrid);
function SoNumero(RcbValor: string): Integer;
function SoPonto(RcbString: string): String;

implementation

procedure LimpaStringGrid(StringGrid: TstringGrid);
var
  I: Integer;
begin
   for I := 1 to StringGrid.RowCount - 1 do
      StringGrid.Rows[I].Clear;
   StringGrid.RowCount := 2;
end;

function SoNumero(RcbValor: string): Integer;
var I :Integer;
   Resultado: String;
begin
   for I := 1 to Length(RcbValor) do
   begin
      if ((RcbValor[i] in ['0'..'9','.',','])) then
         Resultado := Resultado + RcbValor[i];
   end;
   Result:= StrToInt(Resultado);
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

end.
