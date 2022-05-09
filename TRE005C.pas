unit TRE005C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Bde.DBTables;

type
  TFTRE005C = class(TForm)
    EdtCodigo: TEdit;
    MemoDescricao: TMemo;
    RGStatus: TRadioGroup;
    ComboMedida: TComboBox;
    ComboMarca: TComboBox;
    EdtPrecoCusto: TEdit;
    EdtPrecoVenda: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    QyProduto: TQuery;
    BitOK: TEdit;
    BitExcluir: TEdit;
    BitListar: TEdit;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure BitOKMouseLeave(Sender: TObject);
    procedure BitOKClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BitOKExit(Sender: TObject);
    procedure BitOKMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure BitExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure BitExcluirMouseLeave(Sender: TObject);
    procedure BitExcluirClick(Sender: TObject);
   // procedure EdtPrecoVendaExit(Sender: TObject);
    procedure BitListarMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure BitListarMouseLeave(Sender: TObject);
    procedure BitListarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure MemoDescricaoEnter(Sender: TObject);
    procedure BitOKEnter(Sender: TObject);
    procedure BitOKKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitExcluirEnter(Sender: TObject);
    procedure BitExcluirExit(Sender: TObject);
    procedure BitExcluirKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure BitListarExit(Sender: TObject);
//    procedure BitOKChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtSairClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);

  private
    function RetornaNumeroMaior(): Integer;
    //procedure LimpaCamposSemCodigo();
    procedure LimpaCampos();
    procedure GravarProduto(pCodigo: Integer; pDescricao: String; pStatus: Integer; pMedida: Integer; pMarca: Integer; pPrecoCusto: String; pPrecoVenda: String);
    //procedure AlterarProduto(pCodigo: Integer; pDescricao: String; pStatus: Integer; pMedida: Integer; pMarca: Integer; pPrecoCusto: String; pPrecoVenda: String);
    procedure RemoverProduto(pCodigo: Integer);
    procedure EnabledBotaoListar(Realizar : Boolean);

  public
    function VerificaCodigo(const pCODIGO: Integer): Boolean;
    procedure EnabledBotaoOk(Realizar : Boolean);
    procedure EnabledBotaoExcluir(Realizar : Boolean);

  end;

var
  FTRE005C: TFTRE005C;

const
   TamanhoPadraoBotao = 12;
   TamanhoBotaoGrande = 13;

implementation

{$R *.dfm}

uses CONEXAO001, TRE005L, Util;

procedure TFTRE005C.FormCreate(Sender: TObject);
begin
   EnabledBotaoOk(false);
   EnabledBotaoExcluir(false);
end;

procedure TFTRE005C.FormShow(Sender: TObject);
begin
   QyProduto.Close;
   QyProduto.SQL.Clear;
   QyProduto.SQL.Add('SELECT CODIGO,DESCRICAO FROM TBMEDIDAJ');
   QyProduto.Open;
   while not (QyProduto.Eof) do
   begin
      ComboMedida.Items.Add((QyProduto.FieldByName('CODIGO').AsString)+' - '+(QyProduto.FieldByName('DESCRICAO').AsString));
      QyProduto.Next;
   end;
   QyProduto.SQL.Clear;
   QyProduto.SQL.Add('SELECT CODIGO,DESCRICAO FROM TBMARCAJ');
   QyProduto.Open;
   while not (QyProduto.Eof) do
   begin
      ComboMarca.Items.Add((QyProduto.FieldByName('CODIGO').AsString)+' - '+(QyProduto.FieldByName('DESCRICAO').AsString));
      QyProduto.Next;
   end;
end;

procedure TFTRE005C.GravarProduto(pCodigo: Integer; pDescricao: String; pStatus: Integer; pMedida: Integer; pMarca: Integer; pPrecoCusto: String; pPrecoVenda: String);
var VerificarCodigo: Boolean;
begin
   try
      VerificarCodigo := VerificaCodigo(StrToInt(EdtCodigo.Text));
      if (VerificarCodigo) then
         if (Application.MessageBox('Já Existe um produto cadastrado com esse codigo, dejesa altera-lo?','Alterar Produto', MB_YESNO + MB_ICONINFORMATION) = mrNo) then
            Exit;
      CONEXAO.DMConexao.StartTransaction;
      QyProduto.Close;
      QyProduto.SQL.Clear;
      if (VerificarCodigo) then
         QyProduto.SQL.Add('UPDATE TBPRODUTOJ SET DESCRICAO = :DESCRICAO, STATUS = :STATUS, MEDIDA = :MEDIDA, MARCA = :MARCA, PRECO_CUSTO = :PRECO_CUSTO, PRECO_VENDA = :PRECO_VENDA WHERE CODIGO = :CODIGO')
      else
         QyProduto.SQL.Add('INSERT INTO TBPRODUTOJ(CODIGO,DESCRICAO,STATUS,MEDIDA,MARCA,PRECO_CUSTO,PRECO_VENDA) VALUES (:CODIGO, :DESCRICAO, :STATUS, :MEDIDA, :MARCA, :PRECO_CUSTO, :PRECO_VENDA)');
      QyProduto.ParamByName('CODIGO').AsInteger := pCodigo;
      QyProduto.ParamByName('DESCRICAO').AsString := pDescricao;
      QyProduto.ParamByName('STATUS').AsInteger := pStatus;
      QyProduto.ParamByName('MEDIDA').AsInteger := pMedida;
      QyProduto.ParamByName('MARCA').AsInteger := pMarca;
      QyProduto.ParamByName('PRECO_CUSTO').AsString := SoPonto(pPrecoCusto);
      QyProduto.ParamByName('PRECO_VENDA').AsString := SoPonto(pPrecoVenda);
      QyProduto.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Dados Gravados com Sucesso','Gravar dados',MB_OK+MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao Gravar os dados','Gravar dados', MB_OK+MB_ICONERROR);
      end;
      QyProduto.Close;
      LimpaCampos();
   end;
end;

procedure TFTRE005C.RemoverProduto(pCodigo: Integer);
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      QyProduto.Close;
      QyProduto.SQL.Clear;
      QyProduto.SQL.Add('DELETE TBPRODUTOJ WHERE CODIGO = :CODIGO');
      QyProduto.ParamByName('CODIGO').AsInteger := pCodigo;
      QyProduto.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Dados excluido com Sucesso','Gravar dados',MB_OK+MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao excluir os dados','Gravar dados', MB_OK+MB_ICONERROR);
      end;
      QyProduto.Close;
      LimpaCampos();
   end;
end;

procedure TFTRE005C.BitOKClick(Sender: TObject);
begin
   if ((trim(EdtCodigo.Text) <> '') and (trim(MemoDescricao.Text) <> '') and (ComboMedida.text <> '') and (ComboMarca.text <> '') and (trim(EdtPrecoCusto.Text) <> '') and (trim(EdtPrecoVenda.Text) <> '')) then
      GravarProduto(StrToInt(EdtCodigo.Text),MemoDescricao.Text, RGStatus.ItemIndex, StrToInt(SoNumero(ComboMedida.Text)),StrToInt(SoNumero(ComboMarca.Text)), EdtPrecoCusto.Text , EdtPrecoVenda.Text)
   else
      Application.MessageBox('Por Favor, Insira todas as informações','Campo vazio', MB_OK + MB_ICONWARNING);
end;

procedure TFTRE005C.BitExcluirClick(Sender: TObject);
begin
   if (trim(EdtCodigo.Text) <> '') then
   begin
      if (Application.MessageBox('Tem certeza que deseja remover este produto? ','Remover Produto', MB_YESNO + MB_ICONWARNING) = mrYes) then
         RemoverProduto(StrToInt(EdtCodigo.Text));
   end
   else
      Application.MessageBox('Por Favor, Insira todas as informações','Campo vazio', MB_OK + MB_ICONWARNING);
end;

function TFTRE005C.RetornaNumeroMaior: Integer;
begin
   QyProduto.Close;
   QyProduto.SQL.Clear;
   QyProduto.SQL.Add('SELECT ISNULL(MAX(CODIGO),0)+1 AS MAXIMO FROM TBPRODUTOJ');
   QyProduto.Open;
   Result:= QyProduto.FieldByName('MAXIMO').AsInteger;
   QyProduto.Close;
   LimpaCampos();
end;

procedure TFTRE005C.EdtCodigoExit(Sender: TObject);
begin
   if (trim(EdtCodigo.Text) = '') then
      EdtCodigo.Text := IntToStr(RetornaNumeroMaior)
   else
   if (VerificaCodigo(StrToInt(EdtCodigo.Text)))then
      EnabledBotaoExcluir(true);
   EnabledBotaoOk(true)
end;

procedure TFTRE005C.EdtSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFTRE005C.LimpaCampos();
begin
   EdtCodigo.Clear;
   EdtPrecoCusto.Clear;
   MemoDescricao.Clear;
   EdtPrecoVenda.Clear;
   RGStatus.ItemIndex := 0;
   ComboMedida.Text := '';
   ComboMarca.Text := '';
   EnabledBotaoOk(false);
   EnabledBotaoExcluir(false);
   EdtCodigo.SetFocus;
end;

procedure TFTRE005C.Panel1Click(Sender: TObject);
begin
   Close;
end;

function TFTRE005C.VerificaCodigo(const pCODIGO: Integer): Boolean;
begin
   QyProduto.Close;
   QyProduto.SQL.Clear;
   QyProduto.SQL.Add('SELECT TBPRODUTOJ.CODIGO,TBPRODUTOJ.DESCRICAO AS DESCRICAO,TBPRODUTOJ.STATUS AS STATUS,TBPRODUTOJ.PRECO_CUSTO AS PRECO_CUSTO,TBPRODUTOJ.PRECO_VENDA AS PRECO_VENDA,');
   QyProduto.SQL.Add('TBMEDIDAJ.CODIGO AS MEDIDACODIGO, TBMEDIDAJ.DESCRICAO AS MEDIDADESCRICAO, TBMARCAJ.CODIGO AS MARCACODIGO, TBMARCAJ.DESCRICAO AS MARCADESCRICAO FROM TBPRODUTOJ');
   QyProduto.SQL.Add('LEFT JOIN TBMEDIDAJ ON(TBMEDIDAJ.CODIGO = TBPRODUTOJ.MEDIDA)');
   QyProduto.SQL.Add('LEFT JOIN TBMARCAJ ON(TBMARCAJ.CODIGO = TBPRODUTOJ.MARCA)');
   QyProduto.SQL.Add('WHERE TBPRODUTOJ.CODIGO = :CODIGO');
   QyProduto.ParamByName('CODIGO').AsInteger := pCODIGO;
   QyProduto.Open;
   if (not(QyProduto.IsEmpty)) then
   begin
      MemoDescricao.Text := (QyProduto.FieldByName('DESCRICAO').AsString);
      RGStatus.ItemIndex := QyProduto.FieldByName('STATUS').AsInteger;
      ComboMedida.Text := QyProduto.FieldByName('MEDIDACODIGO').AsString +' - '+ QyProduto.FieldByName('MEDIDADESCRICAO').AsString;
      ComboMarca.Text := QyProduto.FieldByName('MARCACODIGO').AsString +' - '+ QyProduto.FieldByName('MARCADESCRICAO').AsString;
      EdtPrecoCusto.Text := QyProduto.FieldByName('PRECO_CUSTO').AsString;
      EdtPrecoVenda.Text := QyProduto.FieldByName('PRECO_VENDA').AsString;
   end;
   Result := not (QyProduto.IsEmpty);
   QyProduto.Close;
end;

procedure TFTRE005C.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(FTRE005L) then
      FreeAndNil(FTRE005L);
   FreeAndNil(FTRE005C);
end;

procedure TFTRE005C.BitListarClick(Sender: TObject);
begin
   if not(Assigned(FTRE005L)) then
      FTRE005L := TFTRE005L.Create(Self);
   EnabledBotaoListar(False);
   FTRE005L.Show;
end;

procedure TFTRE005C.BitOKEnter(Sender: TObject);
begin
   BitOK.Color := $0040C691;
   BitOK.Font.Size := TamanhoBotaoGrande;
end;

procedure TFTRE005C.BitOKExit(Sender: TObject);
begin
   EnabledBotaoOk(true);
end;

procedure TFTRE005C.BitOKKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (IntToStr(key) = '13') then
      BitOKClick(FTRE005C.BitOK);
end;

procedure TFTRE005C.BitOKMouseLeave(Sender: TObject);
begin
   if (BitOK.Enabled <> true) then
      EnabledBotaoOk(true);
end;

procedure TFTRE005C.BitOKMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
   if (BitOK.Enabled <> true) then
   begin
      BitOK.Color := $0040C691;
      BitOK.Font.Size := TamanhoBotaoGrande;
   end;
end;

procedure TFTRE005C.BitExcluirMouseLeave(Sender: TObject);
begin
   EnabledBotaoExcluir(true);
end;

procedure TFTRE005C.BitExcluirMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
   BitExcluir.Color := $00311BEC;
   BitExcluir.Font.Size := TamanhoBotaoGrande;
end;

procedure TFTRE005C.BitListarExit(Sender: TObject);
begin
   BitListar.Enabled := false;
   BitListar.Color := clSilver;
end;

procedure TFTRE005C.BitExcluirEnter(Sender: TObject);
begin
   BitExcluir.Color := $00311BEC;
   BitExcluir.Font.Size := TamanhoBotaoGrande;
end;

procedure TFTRE005C.BitExcluirExit(Sender: TObject);
begin
   EnabledBotaoExcluir(true);
end;

procedure TFTRE005C.BitExcluirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (IntToStr(key) = '13') then
      BitExcluirClick(BitExcluir);
end;

procedure TFTRE005C.BitListarMouseLeave(Sender: TObject);
begin
   if (bitListar.Enabled <> false) then
      EnabledBotaoListar(true);
end;

procedure TFTRE005C.BitListarMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   BitListar.Color := $008D3180;
   BitListar.Font.Size := TamanhoBotaoGrande;
end;

procedure TFTRE005C.EnabledBotaoExcluir(Realizar : Boolean);
begin
   if Realizar = true then
   begin
      BitExcluir.Enabled := true;
      BitExcluir.Color := clMaroon;
      BitExcluir.Font.Size := TamanhoPadraoBotao;
   end
   else
   begin
      BitExcluir.Enabled := False;
      BitExcluir.Color := clSilver;
      BitExcluir.Font.Size := TamanhoPadraoBotao;
   end;
end;

procedure TFTRE005C.EnabledBotaoListar(Realizar: Boolean);
begin
   if (Realizar = true) then
   begin
      BitListar.Enabled := True;
      BitListar.Color := clPurple;
      BitListar.Font.Size := TamanhoPadraoBotao;
   end
   else
   begin
      BitListar.Enabled := False;
      BitListar.Color := clSilver;
      BitListar.Font.Size := TamanhoPadraoBotao;
   end;
end;

procedure TFTRE005C.EnabledBotaoOk(Realizar : Boolean);
begin
   if (Realizar = True) then
   begin
      BitOK.Enabled := true;
      BitOK.Color := clGreen;
      BitOK.Font.Size := TamanhoPadraoBotao;
   end
   else
   begin
      BitOK.Enabled := False;
      BitOK.Color := clSilver;
      BitOK.Font.Size := TamanhoPadraoBotao;
   end;
end;

end.
