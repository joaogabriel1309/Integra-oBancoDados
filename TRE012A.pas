unit TRE012A;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TFTRE012A = class(TForm)
    Calendario: TMonthCalendar;
    procedure CalendarioDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    var Retorno: String;
    { Public declarations }
  end;

var
  FTRE012A: TFTRE012A;

implementation

{$R *.dfm}

uses TRE0011A, Util;

procedure TFTRE012A.CalendarioDblClick(Sender: TObject);
begin
   FTRE011A.EdtData.Text := DateToStr(Calendario.Date);
   close;
end;

end.
