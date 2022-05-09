unit TRE600E;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Data.DB, Bde.DBTables, Vcl.ExtCtrls;

type
  TFTRE600E = class(TForm)
    EdtCodigoVenda: TEdit;
    Label1: TLabel;
    EdtCodigoCliente: TEdit;
    EdtNomeCliente: TEdit;
    EdtData: TEdit;
    ComboFormaPagamento: TComboBox;
    EdtCodigoProduto: TEdit;
    EdtProduto: TEdit;
    EdtPreco: TEdit;
    EdtQuantidade: TEdit;
    StringGridProdutos: TStringGrid;
    EdtQuantidadeItens: TEdit;
    EdtDesconto: TEdit;
    EdtValorTotal: TEdit;
    BitConfirmar: TBitBtn;
    BitCancelar: TBitBtn;
    BitFechar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BitAdicionar: TBitBtn;
    BitRemover: TBitBtn;
    QyVendas: TQuery;
    EdtCodigoEmpresa: TEdit;
    Label13: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure BitFecharClick(Sender: TObject);
    procedure BitAdicionarClick(Sender: TObject);
    procedure EdtCodigoProdutoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtCodigoClienteExit(Sender: TObject);
    procedure StringGridProdutosDblClick(Sender: TObject);
    procedure BitRemoverClick(Sender: TObject);
    procedure BitCancelarClick(Sender: TObject);
    procedure BitConfirmarClick(Sender: TObject);
    procedure ComboFormaPagamentoExit(Sender: TObject);
    procedure EdtDescontoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtCodigoVendaEnter(Sender: TObject);
    procedure EdtCodigoVendaExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    function VerificaExiteProduto(const RcbCodigo: Integer): Boolean;
    function VerificarExisteStringGrid(pCodigo: String): Integer;
    procedure LimparCamposProdutos;
    procedure GravarVenda();
    procedure LimpaCamposTodos;
    procedure GravaProduto();
    procedure VerificaCamposVazio;
    procedure CarregaItensStringGrid();
    procedure Totalizar();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE600E: TFTRE600E;
  Data: String;
const
   CntColunaUm = 0;
   CntColunaDois = 1;
   CntColunaTres = 2;
   CntColunaQuatro = 3;
   CntColunaCinco = 4;

implementation

{$R *.dfm}

uses Util, CONEXAO001, TRE200P;

procedure TFTRE600E.BitAdicionarClick(Sender: TObject);
var Total: Currency;
   Index: Integer;
begin
   if ((Trim(EdtQuantidade.Text) <> '') and (trim(EdtCodigoVenda.Text) <> '') and (trim(EdtNomeCliente.Text) <> '')) then
   begin
      Index := VerificarExisteStringGrid(EdtCodigoProduto.Text);
      if (Index = -1) then
      begin
         if (StringGridProdutos.Cells[CntColunaUm, StringGridProdutos.RowCount-1] <> '') then
            StringGridProdutos.RowCount := StringGridProdutos.RowCount + 1;
         Index := StringGridProdutos.RowCount - 1;
      end;
      StringGridProdutos.Cells[CntColunaUm,Index] := EdtCodigoProduto.Text;
      StringGridProdutos.Cells[CntColunaDois,Index] := EdtProduto.Text;
      StringGridProdutos.Cells[CntColunaTres,Index] := EdtPreco.Text;
      StringGridProdutos.Cells[CntColunaQuatro,Index] := IntToStr(StrToIntDef(StringGridProdutos.Cells[CntColunaQuatro,Index],0) + StrToInt(EdtQuantidade.Text));
      StringGridProdutos.Cells[CntColunaCinco,Index] :=  CurrToStr(StrToCurrDef(StringGridProdutos.Cells[CntColunaCinco,Index],0) + (StrToCurr(EdtQuantidade.Text) * StrToCurr(EdtPreco.Text)));
      Totalizar();
      BitConfirmar.Enabled := true;
   end
   else
      Application.MessageBox('Por Favor Preencha todos os campos','Campos vazios', MB_OK + MB_ICONWARNING);
    LimparCamposProdutos;
end;

procedure TFTRE600E.BitCancelarClick(Sender: TObject);
begin
  LimpaCamposTodos;
  EdtCodigoCliente.SetFocus;
end;

procedure TFTRE600E.BitConfirmarClick(Sender: TObject);
begin
   if (Application.MessageBox('Tem Certeza que deseja salva essas informações?','Salvar', MB_YESNO+MB_ICONINFORMATION) = mrYes) then
   begin
      GravarVenda();
      LimpaCamposTodos();
      EdtCodigoVenda.Clear;
      EdtCodigoVenda.SetFocus;
   end;
end;

procedure TFTRE600E.BitFecharClick(Sender: TObject);
begin
   close;
end;

procedure TFTRE600E.BitRemoverClick(Sender: TObject);
var
  I: Integer;
begin
   EdtValorTotal.Text := CurrToStr(StrToCurr(EdtValorTotal.Text) - StrToCurr(StringGridProdutos.Cells[CntColunaCinco,StringGridProdutos.Row]));
   EdtQuantidadeItens.Text := IntToStr(StrToInt(EdtQuantidadeItens.Text) - StrToInt(StringGridProdutos.Cells[CntColunaQuatro,StringGridProdutos.Row]));
   StringGridProdutos.Cells[CntColunaUm,StringGridProdutos.Row] := '';
   StringGridProdutos.Cells[CntColunaDois,StringGridProdutos.Row] := '';
   StringGridProdutos.Cells[CntColunaTres,StringGridProdutos.Row] := '';
   StringGridProdutos.Cells[CntColunaQuatro,StringGridProdutos.Row] := '';
   StringGridProdutos.Cells[CntColunaCinco,StringGridProdutos.Row] := '';
   for I := StringGridProdutos.Row + 1 to StringGridProdutos.RowCount do
   begin
      StringGridProdutos.cells[CntColunaUm,(I-1)] := StringGridProdutos.Cells[CntColunaUm, I];
      StringGridProdutos.cells[CntColunaDois,(I-1)] := StringGridProdutos.Cells[CntColunaDois, I];
      StringGridProdutos.cells[CntColunaTres,(I-1)] := StringGridProdutos.Cells[CntColunaTres, I];
      StringGridProdutos.cells[CntColunaQuatro,(I-1)] := StringGridProdutos.Cells[CntColunaQuatro, I];
      StringGridProdutos.cells[CntColunaCinco,(I-1)] := StringGridProdutos.Cells[CntColunaCinco, I];
   end;
   StringGridProdutos.RowCount := StringGridProdutos.RowCount -1;
   Totalizar();
   LimparCamposProdutos;
   BitRemover.Enabled := false;
end;

procedure TFTRE600E.CarregaItensStringGrid;
var Quantidade: Integer;
begin
   QyVendas.Close;
   QyVendas.SQL.Clear;
   QyVendas.SQL.Add('SELECT TBPRODUTOJ.DESCRICAO AS DPRODUTO,TBPRODUTOJ.CODIGO AS CPRODUTO,TBITENSPEDIDOJ.QUANTIDADE AS QUANTIDADE,TBPRODUTOJ.PRECO_VENDA AS VPRODUTO, TBITENSPEDIDOJ.VALOR_UNITARIO AS TOTAL');
   QyVendas.SQL.Add('FROM TBITENSPEDIDOJ');
   QyVendas.SQL.Add('LEFT JOIN TBPRODUTOJ ON');
   QyVendas.SQL.Add('(TBPRODUTOJ.CODIGO = TBITENSPEDIDOJ.PRODUTO)');
   QyVendas.SQL.Add('WHERE PEDIDO = :CODIGO');
   QyVendas.ParamByName('CODIGO').AsInteger := StrToInt(EdtCodigoVenda.Text);
   QyVendas.Open;
   LimpaStringGrid(StringGridProdutos);
   while not(QyVendas.Eof) do
   begin
      if (StringGridProdutos.Cells[CntColunaUm, StringGridProdutos.RowCount -1] <> '') then
         StringGridProdutos.RowCount := StringGridProdutos.RowCount + 1;
      StringGridProdutos.Cells[CntColunaUm, StringGridProdutos.RowCount -1] := QyVendas.FieldByName('CPRODUTO').AsString;
      StringGridProdutos.Cells[CntColunaDois, StringGridProdutos.RowCount -1] := QyVendas.FieldByName('DPRODUTO').AsString;
      StringGridProdutos.Cells[CntColunaTres, StringGridProdutos.RowCount -1] := QyVendas.FieldByName('VPRODUTO').AsString;
      StringGridProdutos.Cells[CntColunaQuatro, StringGridProdutos.RowCount -1] := QyVendas.FieldByName('QUANTIDADE').AsString;
      StringGridProdutos.Cells[CntColunaCinco, StringGridProdutos.RowCount -1] := QyVendas.FieldByName('TOTAL').AsString;
      EdtQuantidadeItens.Text := IntToStr(StrToIntDef(EdtQuantidadeItens.Text,0) + StrToIntDef(StringGridProdutos.Cells[CntColunaQuatro, StringGridProdutos.RowCount -1],0));
      QyVendas.Next;
   end;
end;

procedure TFTRE600E.ComboFormaPagamentoExit(Sender: TObject);
begin
   if ((ComboFormaPagamento.ItemIndex = 0) or (ComboFormaPagamento.ItemIndex = 5)) then
      EdtDesconto.Text := '5'
   else
      EdtDesconto.Text := '0';
end;

procedure TFTRE600E.EdtCodigoClienteExit(Sender: TObject);
begin
   if trim(EdtCodigoCliente.Text) <> '' then
   begin
      QyVendas.Close;
      QyVendas.SQL.Clear;
      QyVendas.SQL.Add('SELECT CODIGO,NOME FROM TBCLIENTE WHERE CODIGO = :CODIGO AND EMPRESA = :EMPRESA');
      QyVendas.ParamByName('EMPRESA').AsInteger := StrToInt(EdtCodigoEmpresa.Text);
      QyVendas.ParamByName('CODIGO').AsInteger := StrToInt(EdtCodigoCliente.Text);
      QyVendas.Open;
      if (not QyVendas.IsEmpty) then
      begin
         EdtNomeCliente.Text := QyVendas.FieldByName('NOME').AsString;
         VerificaCamposVazio;
         BitCancelar.Enabled := true;
      end
      else
      begin
         Application.MessageBox('Cliente não Cadastrado', 'Cliente', MB_OK + MB_ICONWARNING);
         LimpaCamposTodos();
         EdtCodigoCliente.SetFocus;
      end;
   end;
end;

procedure TFTRE600E.EdtCodigoProdutoExit(Sender: TObject);
begin
   if trim(EdtCodigoProduto.Text) <>'' then
      BitAdicionar.Enabled := VerificaExiteProduto(StrToIntDef(EdtCodigoProduto.Text,0));
end;

procedure TFTRE600E.EdtCodigoVendaEnter(Sender: TObject);
begin
   LimpaCamposTodos();
   QyVendas.Close;
   QyVendas.SQL.Clear;
   QyVendas.SQL.Add('SELECT ISNULL(MAX(PEDIDO),0)+1 AS PROXIMO FROM TBPEDIDO');
   QyVendas.Open;
   if (EdtCodigoVenda.Text = '') then
   begin
      if not(QyVendas.IsEmpty) then
      begin
         EdtCodigoVenda.Text := QyVendas.FieldByName('PROXIMO').AsString;
      end;
   end;
end;

procedure TFTRE600E.EdtCodigoVendaExit(Sender: TObject);
begin
   if (EdtCodigoVenda.Text <> '') then
   begin
      QyVendas.Close;
      QyVendas.SQL.Clear;
      QyVendas.SQL.Add('SELECT TBPEDIDO.EMPRESA, TBPEDIDO.PEDIDO, TBCLIENTE.CODIGO AS CLIENTE, TBCLIENTE.NOME AS NOMECLIENTE, TBPEDIDO.DATA_VENDA AS DATA, TBPEDIDO.VALOR_PEDIDO AS TOTALPEDIDO,');
      QyVendas.SQL.Add('TBFORMAPAGAMENTO.CODIGO AS FORMACODIGO,TBFORMAPAGAMENTO.DESCRICAO AS FORMAPAGAMENTO, TBPEDIDO.DESCONTO AS DESCONTO,TBITENSPEDIDOJ.QUANTIDADE AS QUANTIDADE, TBPRODUTOJ.CODIGO AS CPRODUTO,TBPRODUTOJ.DESCRICAO AS DPRODUTO,TBPRODUTOJ.PRECO_VENDA AS VPRODUTO');
      QyVendas.SQL.Add('FROM TBPEDIDO');
      QyVendas.SQL.Add('LEFT JOIN TBCLIENTE ON');
      QyVendas.SQL.Add('(TBCLIENTE.CODIGO = TBPEDIDO.CLIENTE)');
      QyVendas.SQL.Add('LEFT JOIN TBFORMAPAGAMENTO ON');
      QyVendas.SQL.Add('(TBFORMAPAGAMENTO.CODIGO = TBPEDIDO.FORMA_PAGAMENTO)');
      QyVendas.SQL.Add('LEFT JOIN TBITENSPEDIDOJ ON');
      QyVendas.SQL.Add('(TBITENSPEDIDOJ.PEDIDO =  TBPEDIDO.EMPRESA)');
      QyVendas.SQL.Add('LEFT JOIN TBPRODUTOJ ON');
      QyVendas.SQL.Add('(TBPRODUTOJ.CODIGO = TBITENSPEDIDOJ.PRODUTO)');
      QyVendas.SQL.Add('WHERE TBPEDIDO.PEDIDO = :CODIGO AND TBPEDIDO.EMPRESA = :EMPRESA');
      QyVendas.ParamByName('EMPRESA').AsInteger := StrToInt(EdtCodigoEmpresa.Text);
      QyVendas.ParamByName('CODIGO').AsInteger := StrToInt(EdtCodigoVenda.Text);
      QyVendas.Open;
      LimpaCamposTodos();
      if (not QyVendas.IsEmpty) then
      begin
         EdtCodigoCliente.Text := QyVendas.FieldByName('CLIENTE').AsString;
         EdtNomeCliente.Text := QyVendas.FieldByName('NOMECLIENTE').AsString;
         EdtData.Text := QyVendas.FieldByName('DATA').AsString;
         ComboFormaPagamento.ItemIndex := ComboFormaPagamento.Items.IndexOf(QyVendas.FieldByName('FORMACODIGO').AsString+' - '+QyVendas.FieldByName('FORMAPAGAMENTO').AsString);
         EdtValorTotal.Text := QyVendas.FieldByName('TOTALPEDIDO').AsString;
         EdtDesconto.Text := QyVendas.FieldByName('DESCONTO').AsString;
         CarregaItensStringGrid();
         BitCancelar.Enabled := true;
      end;
   QyVendas.Close;
   end
   else
      //implementar
end;

procedure TFTRE600E.EdtDescontoExit(Sender: TObject);
var RcbValor:String;
   I: Integer;
begin
   RcbValor := EdtDesconto.Text;
   for I := 1 to Length(RcbValor) do
   begin
      if ((RcbValor[i] in ['A'..'Z','a'..'z'])) then
      begin
         Application.MessageBox('Por Favor Insira apenas números no desconto','Converção Falhou',MB_OK + MB_ICONERROR);
         EdtDesconto.Text := '0';
         Exit;
      end;
   end;
   if (StrToIntDef(RcbValor,0) > 100) or (StrToIntDef(RcbValor,0) < 0) then
      Application.MessageBox('Por Favor Insira um valor maior que 0 e menor que 100', 'Erro', MB_OK + MB_ICONWARNING);
   Totalizar();
end;

procedure TFTRE600E.FormShow(Sender: TObject);
begin
   StringGridProdutos.Cells[CntColunaUm,CntColunaUm]:= 'Código';
   StringGridProdutos.Cells[CntColunadois,CntColunaUm]:= 'Produto';
   StringGridProdutos.Cells[CntColunatres,CntColunaUm]:= 'Preço';
   StringGridProdutos.Cells[CntColunaquatro,CntColunaUm]:= 'Quantidade';
   StringGridProdutos.Cells[CntColunacinco,CntColunaUm]:= 'Total';
   QyVendas.Close;
   QyVendas.SQL.Clear;
   QyVendas.SQL.Add('SELECT CODIGO,DESCRICAO FROM TBFORMAPAGAMENTO');
   QyVendas.Open;
   while not(QyVendas.Eof) do
   begin
      ComboFormaPagamento.Items.Add(QyVendas.FieldByName('CODIGO').AsString +' - '+ QyVendas.FieldByName('DESCRICAO').AsString);
      QyVendas.Next;
   end;
end;

procedure TFTRE600E.GravaProduto;
var I: Integer;
begin
   QyVendas.Close;
   QyVendas.SQL.Clear;
   QyVendas.SQL.Add('INSERT INTO TBITENSPEDIDOJ(EMPRESA, PEDIDO, PRODUTO, QUANTIDADE, VALOR_UNITARIO) VALUES (:IEMPRESA,:IPEDIDO,:PRODUTO,:QUANTIDADE,:VALOR_UNITARIO)');
   for I := 1 to StringGridProdutos.RowCount -1 do
   begin
      QyVendas.ParamByName('IEMPRESA').AsInteger := StrToInt(EdtCodigoEmpresa.Text);
      QyVendas.ParamByName('IPEDIDO').AsInteger := StrToInt(EdtCodigoVenda.Text);
      QyVendas.ParamByName('PRODUTO').AsInteger := StrToInt(StringGridProdutos.Cells[CntColunaUm,I]);
      QyVendas.ParamByName('QUANTIDADE').AsInteger := StrToInt(StringGridProdutos.Cells[CntColunaQuatro,I]);
      QyVendas.ParamByName('VALOR_UNITARIO').AsCurrency := StrToCurr(StringGridProdutos.Cells[CntColunaTres,I]);
      QyVendas.ExecSQL;
   end;
   QyVendas.Close;
end;

procedure TFTRE600E.VerificaCamposVazio;
begin
  if (EdtQuantidadeItens.Text = '') then
     EdtQuantidadeItens.Text := '0';
  if (EdtValorTotal.Text = '') then
     EdtValorTotal.Text := '0';
  if (EdtDesconto.Text = '') then
     EdtDesconto.Text := '0';
end;

procedure TFTRE600E.GravarVenda;
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      QyVendas.Close;
      QyVendas.SQL.Clear;
      QyVendas.SQL.Add('INSERT INTO TBPEDIDO(EMPRESA,PEDIDO,CLIENTE,DATA_VENDA,VALOR_PEDIDO,FORMA_PAGAMENTO,DESCONTO) VALUES (:EMPRESA,:PEDIDO,:CLIENTE,:DATA_VENDA,:VALOR_PEDIDO,:FORMA_PAGAMENTO,:DESCONTO)');
      QyVendas.ParamByName('EMPRESA').AsInteger := StrToInt(EdtCodigoEmpresa.Text);
      QyVendas.ParamByName('PEDIDO').AsInteger := StrToInt(EdtCodigoVenda.Text);
      QyVendas.ParamByName('CLIENTE').AsInteger := StrToInt(EdtCodigoCliente.Text);
      QyVendas.ParamByName('DATA_VENDA').AsDateTime := now;
      QyVendas.ParamByName('VALOR_PEDIDO').AsCurrency := StrToCurr(EdtValorTotal.Text);
      QyVendas.ParamByName('FORMA_PAGAMENTO').AsInteger := StrToInt(SoNumero(ComboFormaPagamento.Text));//(ComboFormaPagamento.ItemIndex+1);
      QyVendas.ParamByName('DESCONTO').AsCurrency := StrToCurr(EdtDesconto.Text);
      QyVendas.ExecSQL;
      QyVendas.Close;
      GravaProduto();
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Dados Gravados com sucesso!','Dados Gravados', MB_OK + MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha em salvar os dados', 'Conexão Falhou', MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFTRE600E.LimpaCamposTodos;
begin
   EdtCodigoCliente.Clear;
   EdtNomeCliente.Clear;
   EdtData.Clear;
   EdtCodigoProduto.Clear;
   EdtQuantidadeItens.Clear;
   EdtDesconto.Clear;
   EdtValorTotal.Clear;
   ComboFormaPagamento.ItemIndex := -1;
   LimpaStringGrid(StringGridProdutos);
   EdtCodigoProduto.Clear;
   EdtProduto.Clear;
   EdtPreco.Clear;
   EdtQuantidade.Clear;
   BitCancelar.Enabled := false;
   BitConfirmar.Enabled := false;
   //EdtCodigoVenda.SetFocus;
end;

procedure TFTRE600E.SpeedButton1Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqCliente;
   EdtCodigoCliente.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtCodigoCliente.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

procedure TFTRE600E.SpeedButton2Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqProduto;
   EdtCodigoProduto.SetFocus;
   if (FTRE200P.ShowModal = mrOk) then
   begin
      EdtCodigoProduto.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

procedure TFTRE600E.StringGridProdutosDblClick(Sender: TObject);
begin
   if (VerificaExiteProduto(StrToInt(StringGridProdutos.Cells[CntColunaUm,StringGridProdutos.Row]))) then
   begin
      EdtCodigoProduto.Text := StringGridProdutos.Cells[CntColunaUm,StringGridProdutos.Row];
      EdtQuantidade.Text := StringGridProdutos.Cells[CntColunaQuatro,StringGridProdutos.Row];
      BitRemover.Enabled := true;
   end;
end;

procedure TFTRE600E.Totalizar;
var I,P,UnidadeItens: Integer;
   QuantidadeTotal,QuantidadeDesconto: Currency;
begin
   QuantidadeTotal := 0;
   UnidadeItens := 0;
   for I := 1 to StringGridProdutos.RowCount -1 do
   begin
      UnidadeItens := UnidadeItens + StrToIntDef(StringGridProdutos.Cells[CntColunaQuatro,I],0);
      QuantidadeTotal := (QuantidadeTotal + StrToCurrDef(StringGridProdutos.Cells[CntColunaCinco,I],0));
   end;
   EdtQuantidadeItens.Text := IntToStr(UnidadeItens);
   QuantidadeDesconto :=  QuantidadeTotal * (StrToCurr(EdtDesconto.Text) / 100);
   EdtValorTotal.Text := CurrToStr(QuantidadeTotal - QuantidadeDesconto);
end;

function TFTRE600E.VerificaExiteProduto(const RcbCodigo: Integer): Boolean;
begin
   QyVendas.Close;
   QyVendas.SQL.Clear;
   QyVendas.SQL.Add('SELECT CODIGO,DESCRICAO,PRECO_VENDA FROM TBPRODUTOJ WHERE CODIGO = :CODIGO');
   QyVendas.ParamByName('CODIGO').AsInteger := RcbCodigo;
   QyVendas.Open;
   if (not QyVendas.IsEmpty) then
   begin
      EdtProduto.Text := QyVendas.FieldByName('DESCRICAO').AsString;
      EdtPreco.Text := QyVendas.FieldByName('PRECO_VENDA').AsString;
   end
   else
   begin
      Application.MessageBox('O Código inserido não tem um produto cadastro', 'Produto', MB_OK+MB_ICONWARNING);
      EdtCodigoProduto.Clear;
      EdtCodigoProduto.SetFocus;
   end;
   Result := (not QyVendas.IsEmpty);
   QyVendas.Close;
end;

function TFTRE600E.VerificarExisteStringGrid(pCodigo: String): Integer;
var I: Integer;
begin
   Result := -1;
   for I := 1 to StringGridProdutos.RowCount do
   begin
      if (StringGridProdutos.Cells[CntColunaUm,I] = pCodigo) then
      begin
         Result := I;
         exit;
      end;
   end;
end;

procedure TFTRE600E.LimparCamposProdutos;
begin
  EdtCodigoProduto.Clear;
  EdtProduto.Clear;
  EdtPreco.Clear;
  EdtQuantidade.Clear;
  EdtCodigoProduto.SetFocus;
end;

end.
