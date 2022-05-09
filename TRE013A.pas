unit TRE013A;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Bde.DBTables;

type
  TFTRE013A = class(TForm)
    StringGridCalendario: TStringGrid;
    QyCalendario: TQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE013A: TFTRE013A;

  const
    CntColunaUm = 0;
    CntLinhaUm = 0;
    CntLinhaDois = 1;
    CntLinhaTres = 2;
    CntLinhaQuatro = 3;
    CntLinhaCinco = 4;
    CntLinhaSeis = 5;
    CntLinhaSete = 6;
    CntLinhaOito = 7;
implementation

{$R *.dfm}

uses Util;

procedure TFTRE013A.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   LimpaStringGrid(StringGridCalendario);
end;

procedure TFTRE013A.FormShow(Sender: TObject);
var FDataAgendamento: string;
begin
   StringGridCalendario.Cells[CntLinhaUm, CntColunaUm] := 'Status';
   StringGridCalendario.Cells[CntLinhaDois, CntColunaUm] := 'Data';
   StringGridCalendario.Cells[CntLinhaTres, CntColunaUm] := 'Nome';
   StringGridCalendario.Cells[CntLinhaQuatro, CntColunaUm] := 'Tipo';
   StringGridCalendario.Cells[CntLinhaCinco, CntColunaUm] := 'Inicio';
   StringGridCalendario.Cells[CntLinhaSeis, CntColunaUm] := 'Final';
   StringGridCalendario.Cells[CntLinhaSete, CntColunaUm] := 'Valor';
   StringGridCalendario.Cells[CntLinhaOito, CntColunaUm] := 'Observação';
   StringGridCalendario.ColWidths[0] := 100;
   StringGridCalendario.ColWidths[1] := 120;
   StringGridCalendario.ColWidths[2] := 250;
   StringGridCalendario.ColWidths[3] := 250;
   StringGridCalendario.ColWidths[4] := 100;
   StringGridCalendario.ColWidths[5] := 100;
   StringGridCalendario.ColWidths[6] := 100;
   StringGridCalendario.ColWidths[7] := 300;
   QyCalendario.Close;
   QyCalendario.SQL.Clear;
   QyCalendario.SQL.Add('SELECT TBAGENDAMENTOS.STATUS AS STATUS,TBAGENDAMENTOS.DATA_AGENDAMENTO AS DATA, TBCLIENTE.NOME AS NOME, TBAGENDAMENTOS.TIPO_AGENDAMENTO AS TIPO, TBAGENDAMENTOS.HORARIO_INICIO AS INICIO, TBAGENDAMENTOS.HORARIO_FINAL AS FINAL,');
   QyCalendario.SQL.Add('TBAGENDAMENTOS.VALOR AS VALOR, TBAGENDAMENTOS.OBSERVACAO AS OBSERVACAO');
   QyCalendario.SQL.Add('FROM TBCLIENTE');
   QyCalendario.SQL.Add('JOIN TBAGENDAMENTOS ON');
   QyCalendario.SQL.Add('(TBAGENDAMENTOS.CLIENTE = TBCLIENTE.CODIGO)');
   QyCalendario.SQL.Add('WHERE TBAGENDAMENTOS.DATA_AGENDAMENTO BETWEEN (''2022-04-01'') AND (''2022-04-30'')');
   QyCalendario.SQL.Add('ORDER BY TBAGENDAMENTOS.DATA_AGENDAMENTO DESC');
   QyCalendario.Open;
   while not(QyCalendario.Eof) do
   begin
      if (StringGridCalendario.Cells[CntLinhaUm, StringGridCalendario.RowCount - 1] <> '') then
         StringGridCalendario.RowCount := StringGridCalendario.RowCount + 1;
      FDataAgendamento := QyCalendario.FieldByName('DATA').AsString;
      if (FDataAgendamento >= DateToStr(now)) then
      begin
         StringGridCalendario.Cells[CntLinhaUm,StringGridCalendario.RowCount-1] := 'Aberto';
         StringGridCalendario.Canvas.Brush.Color := clGreen;
      end
      else
      begin
         StringGridCalendario.Cells[CntLinhaUm,StringGridCalendario.RowCount-1] := 'Fechado';
         StringGridCalendario.Canvas.Brush.Color := clRed;
      end;
      StringGridCalendario.Cells[CntLinhaDois, StringGridCalendario.RowCount-1]   := QyCalendario.FieldByName('DATA').AsString;
      StringGridCalendario.Cells[CntLinhaTres, StringGridCalendario.RowCount-1]   := QyCalendario.FieldByName('NOME').AsString;
      StringGridCalendario.Cells[CntLinhaQuatro, StringGridCalendario.RowCount-1] := QyCalendario.FieldByName('TIPO').AsString;
      StringGridCalendario.Cells[CntLinhaCinco, StringGridCalendario.RowCount-1]  := QyCalendario.FieldByName('INICIO').AsString;
      StringGridCalendario.Cells[CntLinhaSeis, StringGridCalendario.RowCount-1]   := QyCalendario.FieldByName('FINAL').AsString;
      StringGridCalendario.Cells[CntLinhaSete, StringGridCalendario.RowCount-1]   := QyCalendario.FieldByName('VALOR').AsString;
      StringGridCalendario.Cells[CntLinhaOito, StringGridCalendario.RowCount-1]   := QyCalendario.FieldByName('OBSERVACAO').AsString;
      QyCalendario.Next;
   end;
end;

end.
