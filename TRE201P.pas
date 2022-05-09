unit TRE201P;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Bde.DBTables,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TFTRE201P = class(TForm)
    DBGrid1: TDBGrid;
    EdtPesquisa: TEdit;
    BitBtn1: TBitBtn;
    QyFatorRisco: TQuery;
    DsFatorRisco: TDataSource;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure EdtPesquisaChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    procedure CarregaDadosDBgrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE201P: TFTRE201P;

implementation

{$R *.dfm}

uses TRE007C, Util;

procedure TFTRE201P.DBGrid1CellClick(Column: TColumn);
begin
   if FTRE007C.DcsTemporario.Locate('ID', DBGrid1.Fields[0].Value,[loCaseInsensitive]) then
      Application.MessageBox('Fator já selecionado', 'Atenção!', MB_OK + MB_ICONWARNING)
   else
   begin
      FTRE007C.DcsTemporario.Append;
      FTRE007C.DcsTemporario.FieldByName('ID').AsString := DBGrid1.Fields[0].Value;
      FTRE007C.DcsTemporario.FieldByName('DESCRICAO').AsString := DBGrid1.Fields[1].Value;
      FTRE007C.DcsTemporario.Post;
   end;
end;

procedure TFTRE201P.EdtPesquisaChange(Sender: TObject);
begin
   QyFatorRisco.close;
   QyFatorRisco.SQL.Clear;
   if (RBCodigo.Checked = True) then
      QyFatorRisco.SQL.Add('SELECT ID, DESCRICAO FROM TBIFP_ES_FATORDERISCO WHERE ID LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
   if (RBdescricao.Checked = True) then
      QyFatorRisco.SQL.Add('SELECT ID, DESCRICAO FROM TBIFP_ES_FATORDERISCO WHERE DESCRICAO LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
   QyFatorRisco.Open;
end;

procedure TFTRE201P.CarregaDadosDBgrid;
begin
  QyFatorRisco.Close;
  QyFatorRisco.SQL.Clear;
  QyFatorRisco.SQL.Add('SELECT ID, DESCRICAO FROM TBIFP_ES_FATORDERISCO');
  QyFatorRisco.Open;
end;

procedure TFTRE201P.FormShow(Sender: TObject);
begin
  CarregaDadosDBgrid;
end;

end.
