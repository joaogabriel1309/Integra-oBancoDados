unit TRE004C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Bde.DBTables, Vcl.Grids;

type
  TFTRE004C = class(TForm)
    Adicionar: TBitBtn;
    Excluir: TBitBtn;
    Sair: TBitBtn;
    TPagPrincipal: TPageControl;
    PagCadastro: TTabSheet;
    PagListar: TTabSheet;
    EdtCodigo: TEdit;
    EdtBairro: TEdit;
    EdtRegiao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    QyBairro: TQuery;
    procedure AdicionarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure EdtCodigoClick(Sender: TObject);
    procedure TPagPrincipalChange(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
  private
   procedure AdicionarDados(const pCodigo: Integer; pBairro :string; pRegiao:string);
   procedure ExcluirDados(const pCodigo: Integer);
   function ExisteBarrio(const pCodigo: Integer):Boolean;
   function CodigoMax(): Integer;
   procedure LimpaCampos();
   procedure CarregaBanco();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE004C: TFTRE004C;

  const
   CntLinhaum = 0;
   CntLinhadois = 1;
   CntLinhatres = 2;
implementation

{$R *.dfm}

uses CONEXAO001, Util;

procedure TFTRE004C.AdicionarDados(const pCodigo: Integer; pBairro :string; pRegiao:string);
var VerificaExiste: Boolean;
begin
   try
      VerificaExiste := ExisteBarrio(StrToInt(EdtCodigo.Text));
      if (VerificaExiste) then
      begin
         if (Application.MessageBox('O Bairro Insrido já existe na tabela dejesa alterá-lo ?','Alteração de dados', MB_YESNO+MB_ICONQUESTION) = mrNo) then
            exit;
      end;
      CONEXAO.DMConexao.StartTransaction;
      QyBairro.Close;
      QyBairro.SQL.Clear;
      if (VerificaExiste) then
         QyBairro.SQL.Add('UPDATE TBBAIRRO SET NOME_BAIRRO = :BAIRRO, REGIAO_BAIRRO = :REGIAO WHERE NUM_BAIRRO = :CODIGO')
      else
         QyBairro.SQL.Add('INSERT INTO TBBAIRRO(NUM_BAIRRO,NOME_BAIRRO,REGIAO_BAIRRO) VALUES (:CODIGO,:BAIRRO,:REGIAO)');
      QyBairro.ParamByName('CODIGO').AsInteger := pCodigo;
      QyBairro.ParamByName('BAIRRO').AsString := pBairro;
      QyBairro.ParamByName('REGIAO').AsString := pRegiao;
      QyBairro.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Dados Gravados com Sucesso!','Dados Gravados', MB_OK+MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao Gravar os dados','Dados Gravados', MB_OK+MB_ICONERROR);
      end;
      QyBairro.Close;
      LimpaCampos();
   end;
end;

procedure TFTRE004C.ExcluirDados(const pCodigo: Integer);
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      QyBairro.Close;
      QyBairro.SQL.Clear;
      QyBairro.SQL.Add('DELETE TBBAIRRO WHERE NUM_BAIRRO = :CODIGO');
      QyBairro.ParamByName('CODIGO').AsInteger := pCodigo;
      QyBairro.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Os Dados foram excluido com sucesso!', 'Dados Excluido', MB_OK + MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao excluir os dados', 'Dados Excluido', MB_OK + MB_ICONERROR);
      end;
      QyBairro.Close;
      LimpaCampos();
   end;
end;

procedure TFTRE004C.AdicionarClick(Sender: TObject);
begin
   if ((StrToIntDef(EdtCodigo.Text,0) > 0) and (trim(EdtBairro.Text) <> '') and (trim(EdtRegiao.Text) <> '')) then
      AdicionarDados(StrToInt(EdtCodigo.Text), EdtBairro.Text, EdtRegiao.Text)
   else
      Application.MessageBox('Por Favor, Insira todos os dados','Campos Obrigatorios', MB_OK + MB_ICONWARNING);
end;

procedure TFTRE004C.EdtCodigoClick(Sender: TObject);
begin
   EdtCodigo.Text:= IntToStr(codigoMax());
   Adicionar.Enabled:= false;
   Excluir.Enabled:=false;
end;

procedure TFTRE004C.EdtCodigoExit(Sender: TObject);
begin
   if (EdtCodigo.Text <> '') then
   begin
      if (ExisteBarrio(StrToInt(EdtCodigo.Text))) then
         Excluir.Enabled := true;
      Adicionar.Enabled := true
   end;
end;

procedure TFTRE004C.ExcluirClick(Sender: TObject);
begin
   if (StrToIntDef(EdtCodigo.Text,0) > 0) then
   begin
      if (ExisteBarrio(StrToInt(EdtCodigo.Text))) then
      begin
         if (Application.MessageBox('Tem certeza que dejesa excluir essa bairro ?', 'Excluir Bairro', MB_YESNO + MB_ICONQUESTION) = mrYes) then
            ExcluirDados(StrToInt(EdtCodigo.Text))
      end
      else
         Application.MessageBox('Codigo Inserido não encontrado nos registros', 'Codigo não encontrado', MB_OK+ MB_ICONERROR);
   end;
end;

function TFTRE004C.CodigoMax(): Integer;
begin
   QyBairro.Close;
   QyBairro.SQL.Clear;
   QyBairro.SQL.Add('SELECT ISNULL (MAX(NUM_BAIRRO),0)+1 AS MAXIMO FROM TBBAIRRO');
   QyBairro.Open;
   Result := QyBairro.FieldByName('MAXIMO').AsInteger;
   QyBairro.Close;
end;

function TFTRE004C.ExisteBarrio(const pCodigo: Integer):boolean;
begin
   QyBairro.Close;
   QyBairro.SQL.Clear;
   QyBairro.SQL.Add('SELECT NOME_BAIRRO,NUM_BAIRRO,REGIAO_BAIRRO FROM TBBAIRRO WHERE NUM_BAIRRO = :CODIGO');
   QyBairro.ParamByName('CODIGO').AsInteger := pCodigo;
   QyBairro.Open;
   if (not(QyBairro.IsEmpty)) then
   begin
      EdtBairro.Text:= QyBairro.FieldByName('NOME_BAIRRO').AsString;
      EdtRegiao.Text:= QyBairro.FieldByName('REGIAO_BAIRRO').AsString;
      Adicionar.Enabled:=true;
      Excluir.Enabled:=true;
   end;
   Result:= not(QyBairro.IsEmpty);
   QyBairro.Close;
end;

procedure TFTRE004C.FormCreate(Sender: TObject);
begin
   Adicionar.Enabled := false;
   Excluir.Enabled := false;
   StringGrid1.Cells[CntLinhaum,CntLinhaum]:= 'Codigo';
   StringGrid1.Cells[CntLinhadois,CntLinhaum]:= 'Bairro';
   StringGrid1.Cells[CntLinhatres,CntLinhaum]:= 'Região';
end;

procedure TFTRE004C.CarregaBanco();
var
  I: Integer;
begin
   QyBairro.Close;
   QyBairro.SQL.Clear;
   QyBairro.SQL.Add('SELECT NUM_BAIRRO, NOME_BAIRRO, REGIAO_BAIRRO FROM TBBAIRRO');
   QyBairro.Open;
   LimpaStringGrid(StringGrid1);
   while not (QyBairro.Eof) do
   begin
      if (StringGrid1.Cells[CntLinhaum,StringGrid1.RowCount -1] <> '') then
         StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[CntLinhaum,StringGrid1.RowCount - 1]:= QyBairro.FieldByName('NUM_BAIRRO').AsString;
      StringGrid1.Cells[CntLinhadois,StringGrid1.RowCount -1]:= QyBairro.FieldByName('NOME_BAIRRO').AsString;
      StringGrid1.Cells[CntLinhatres,StringGrid1.RowCount -1]:= QyBairro.FieldByName('REGIAO_BAIRRO').AsString;
      QyBairro.Next;
   end;
end;

procedure TFTRE004C.LimpaCampos();
begin
   EdtCodigo.Clear;
   EdtBairro.Clear;
   EdtRegiao.Clear;
   EdtCodigo.SetFocus;
   Adicionar.Enabled:= false;
   Excluir.Enabled:= false;
end;

procedure TFTRE004C.StringGrid1DblClick(Sender: TObject);
begin
   EdtCodigo.Text := StringGrid1.Cells[CntLinhaum, StringGrid1.Row];
   EdtBairro.Text := StringGrid1.Cells[CntLinhadois, StringGrid1.Row];
   EdtRegiao.Text := StringGrid1.Cells[CntLinhatres, StringGrid1.Row];
   TPagPrincipal.TabIndex := 0;
   Adicionar.Enabled := true;
   Excluir.Enabled := true;
end;

procedure TFTRE004C.TPagPrincipalChange(Sender: TObject);
begin
   if TPagPrincipal.ActivePage = PagListar then
      Adicionar.Enabled := False;
      Excluir.Enabled := False;
      CarregaBanco();
end;

end.
