unit TRE005L;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids;

type
  TFTRE005L = class(TForm)
    StringGriListaProduto: TStringGrid;
    BitBtn1: TBitBtn;
    EdtProcurar: TEdit;
    BitProcurar: TBitBtn;
    EdtCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitAtualizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitProcurarClick(Sender: TObject);
    procedure StringGriListaProdutoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitAtualizarClick(Sender: TObject);
  private
    procedure ListarDados();
    procedure ProcurarIntemNome(RcbPalavra: String;RcbCodigo: String);
    //procedure ProcurarIntemCodigo(RcbCodigo: String);
    procedure LimpaCampos();
    procedure CarregaDadosStringgrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE005L: TFTRE005L;

const
  CntLinhaUm = 0;
  CntCodigo = 0;
  CntDescricao = 1;
  CntStatus = 2;
  CntMedida = 3;
  CntMarca = 4;
  CntPrecoCusto = 5;
  CntPrecoVenda = 6;

implementation

{$R *.dfm}

uses TRE005C, Util;

procedure TFTRE005L.BitAtualizarClick(Sender: TObject);
begin
   ListarDados();
end;

procedure TFTRE005L.BitProcurarClick(Sender: TObject);
begin
   if (trim(EdtProcurar.Text)<> '') or (trim(EdtCodigo.Text) <> '') then
      ProcurarIntemNome(EdtProcurar.Text, EdtCodigo.Text)
   else
      Application.MessageBox('Por Favor, Insira um dado no campo', 'Dado Invalido', MB_OK + MB_ICONWARNING);
   if StringGriListaProduto.Cells[CntCodigo,StringGriListaProduto.RowCount -1] = '' then
   begin
      Application.MessageBox('Não foi encontrada informações', 'Informação vazia', MB_OK + MB_ICONASTERISK);
      ListarDados();
   end;
   LimpaCampos();
end;

procedure TFTRE005L.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FTRE005C.BitListar.Enabled := true;
   FTRE005C.BitListar.Color := clPurple;
end;

procedure TFTRE005L.FormCreate(Sender: TObject);
begin
   StringGriListaProduto.Cells[CntCodigo,CntLinhaUm]:= 'código';
   StringGriListaProduto.Cells[CntDescricao,CntLinhaUm]:= 'Produto';
   StringGriListaProduto.Cells[CntStatus,CntLinhaUm]:= 'Status';
   StringGriListaProduto.Cells[CntMedida,CntLinhaUm]:= 'Medida';
   StringGriListaProduto.Cells[CntMarca,CntLinhaUm]:= 'Marca';
   StringGriListaProduto.Cells[CntPrecoCusto,CntLinhaUm]:= 'Preço de Custo';
   StringGriListaProduto.Cells[CntPrecoVenda,CntLinhaUm]:= 'Preço Venda';
   ListarDados();
end;

procedure TFTRE005L.ListarDados();
var
  I: Integer;
begin
   FTRE005C.QyProduto.Close;
   FTRE005C.QyProduto.SQL.Clear;
   FTRE005C.QyProduto.SQL.Add('SELECT TBPRODUTOJ.CODIGO, TBPRODUTOJ.DESCRICAO, TBPRODUTOJ.STATUS, TBMEDIDAJ.DESCRICAO AS MEDIDA, TBMARCAJ.DESCRICAO AS MARCA, TBPRODUTOJ.PRECO_CUSTO, TBPRODUTOJ.PRECO_VENDA');
   FTRE005C.QyProduto.SQL.Add('FROM TBPRODUTOJ');
   FTRE005C.QyProduto.SQL.Add('LEFT JOIN TBMEDIDAJ ON');
   FTRE005C.QyProduto.SQL.Add('(TBMEDIDAJ.CODIGO = TBPRODUTOJ.MEDIDA)');
   FTRE005C.QyProduto.SQL.Add('LEFT JOIN TBMARCAJ ON');
   FTRE005C.QyProduto.SQL.Add('(TBMARCAJ.CODIGO = TBPRODUTOJ.MARCA)');
   FTRE005C.QyProduto.Open;
   LimpaStringGrid(StringGriListaProduto);
   CarregaDadosStringgrid;
end;

procedure TFTRE005L.ProcurarIntemNome(RcbPalavra: String; RcbCodigo: String);
var P: Integer;
begin
   FTRE005C.QyProduto.Close;
   FTRE005C.QyProduto.SQL.Clear;
   FTRE005C.QyProduto.SQL.add('SELECT TBPRODUTOJ.CODIGO, TBPRODUTOJ.DESCRICAO, TBPRODUTOJ.STATUS, TBMEDIDAJ.DESCRICAO AS MEDIDA, TBMARCAJ.DESCRICAO AS MARCA, TBPRODUTOJ.PRECO_CUSTO, TBPRODUTOJ.PRECO_VENDA');
   FTRE005C.QyProduto.SQL.add('FROM TBPRODUTOJ');
   FTRE005C.QyProduto.SQL.add('LEFT JOIN TBMEDIDAJ ON');
   FTRE005C.QyProduto.SQL.add('(TBMEDIDAJ.CODIGO = TBPRODUTOJ.MEDIDA)');
   FTRE005C.QyProduto.SQL.add('LEFT JOIN TBMARCAJ ON');
   FTRE005C.QyProduto.SQL.add('(TBMARCAJ.CODIGO = TBPRODUTOJ.MARCA)');
   if (EdtCodigo.Text <> '') then
   begin
      FTRE005C.QyProduto.SQL.add('WHERE TBPRODUTOJ.CODIGO LIKE :ITEM');
      FTRE005C.QyProduto.ParamByName('ITEM').AsString:= trim(RcbCodigo) + '%';
   end
   else
   begin
      FTRE005C.QyProduto.SQL.add('WHERE TBPRODUTOJ.DESCRICAO LIKE :ITEM');
      FTRE005C.QyProduto.ParamByName('ITEM').AsString:= trim(RcbPalavra) + '%';
   end;
   FTRE005C.QyProduto.open;
   LimpaStringGrid(StringGriListaProduto);
   CarregaDadosStringgrid;
end;

procedure TFTRE005L.StringGriListaProdutoDblClick(Sender: TObject);
begin
   if (FTRE005C.VerificaCodigo(StrToInt(StringGriListaProduto.Cells[CntCodigo, StringGriListaProduto.Row]))) then
   begin
      FTRE005C.EdtCodigo.Text := StringGriListaProduto.Cells[CntCodigo, StringGriListaProduto.Row];
      FTRE005C.EnabledBotaoOk(true);
      FTRE005C.EnabledBotaoExcluir(true);
      FTRE005C.Show;
   end;
end;

procedure TFTRE005L.LimpaCampos();
begin
   EdtProcurar.Clear;
   EdtCodigo.Clear;
   EdtCodigo.SetFocus;
end;

procedure TFTRE005L.CarregaDadosStringgrid;
begin
  while not (FTRE005C.QyProduto.Eof) do
  begin
    if (StringGriListaProduto.Cells[CntCodigo, StringGriListaProduto.RowCount - 1] <> '') then
      StringGriListaProduto.RowCount := StringGriListaProduto.RowCount + 1;
    StringGriListaProduto.Cells[CntCodigo, StringGriListaProduto.RowCount - 1] := FTRE005C.QyProduto.FieldByName('CODIGO').AsString;
    StringGriListaProduto.Cells[CntDescricao, StringGriListaProduto.RowCount - 1] := FTRE005C.QyProduto.FieldByName('DESCRICAO').AsString;
    StringGriListaProduto.Cells[CntStatus, StringGriListaProduto.RowCount - 1] := FTRE005C.QyProduto.FieldByName('STATUS').AsString;
    StringGriListaProduto.Cells[CntMedida, StringGriListaProduto.RowCount - 1] := FTRE005C.QyProduto.FieldByName('MEDIDA').AsString;
    StringGriListaProduto.Cells[CntMarca, StringGriListaProduto.RowCount - 1] := FTRE005C.QyProduto.FieldByName('MARCA').AsString;
    StringGriListaProduto.Cells[CntPrecoCusto, StringGriListaProduto.RowCount - 1] := FTRE005C.QyProduto.FieldByName('PRECO_CUSTO').AsString;
    StringGriListaProduto.Cells[CntPrecoVenda, StringGriListaProduto.RowCount - 1] := FTRE005C.QyProduto.FieldByName('PRECO_VENDA').AsString;
    FTRE005C.QyProduto.Next;
  end;
end;

end.
