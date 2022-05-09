unit Conexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Bde.DBTables;

type
  TDataModuleConexao = class(TDataModule)
    Database1: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleConexao: TDataModuleConexao;

implementation

{$R *.dfm}


end.
