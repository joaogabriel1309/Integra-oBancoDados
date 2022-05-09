unit CONEXAO001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Bde.DBTables;

type
  TCONEXAO = class(TForm)
    DMConexao: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CONEXAO: TCONEXAO;

implementation

{$R *.dfm}


end.
