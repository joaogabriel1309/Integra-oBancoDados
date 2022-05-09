unit TRE001C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Bde.DBTables, Vcl.ComCtrls, Vcl.Grids;

type
  TFTRE001C = class(TForm)
    BitBtnFECHAR: TBitBtn;
    BitBtnOK: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheetConsulta: TTabSheet;
    EDT_CODIGO: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EDT_DESCRICAO: TEdit;
    QyAtividade: TQuery;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
   // procedure EDT_CODIGOEnter(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EDT_CODIGOExit(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure EDT_CODIGOClick(Sender: TObject);
  private
    { Private declarations }
    function ProximoId:string;
    function ExiteAtividade(const pCodigo: Integer): Boolean;
    procedure LimpaCampos;
    function Deletar(const pCodigo: Integer): Boolean;
    function Gravar: Boolean;
    function GetdescricaoAtividade(const pCodigo: Integer): string;
    procedure CarregaTodosRegistros;
  public
    { Public declarations }
  end;

var
  FTRE001C: TFTRE001C;

implementation

{$R *.dfm}

uses CONEXAO001;

procedure TFTRE001C.CarregaTodosRegistros;
var I: Integer;
const
   cntCodigo = 0;
   cntDescricao = 1;
   cntLinhaTitulo = 0;
begin
   StringGrid1.Cells[cntCodigo, cntLinhaTitulo]:= 'Código';
   StringGrid1.Cells[cntDescricao, cntLinhaTitulo]:= 'Descrição';
   QyAtividade.Close;
   QyAtividade.SQL.Clear;
   QyAtividade.SQL.Add('SELECT * FROM TBATIVIDADE');
   QyAtividade.Open;
   with StringGrid1 do
   begin
    for I := 1 to RowCount -1 do
      Rows[I].Clear;
   end;
   StringGrid1.RowCount := 2;
   while not(QyAtividade.Eof) do
   begin
      if (StringGrid1.Cells[cntCodigo, StringGrid1.RowCount - 1] <> '') then
         StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[cntCodigo, StringGrid1.RowCount -1] := QyAtividade.FieldByName('CODIGO').AsString;
      StringGrid1.Cells[cntDescricao, StringGrid1.RowCount -1] := QyAtividade.FieldByName('DESCRICAO').AsString;
      QyAtividade.Next;
   end;
   QyAtividade.Close;
end;

function TFTRE001C.GetDescricaoAtividade(const pCodigo: Integer) :string;
begin
   QyAtividade.Close;
   QyAtividade.SQL.Clear;
   QyAtividade.SQL.Add('SELECT DESCRICAO FROM TBATIVIDADE WHERE CODIGO = :CODIGO');
   QyAtividade.ParamByName('CODIGO').AsInteger := pCodigo;
   QyAtividade.open;
   Result:= QyAtividade.FieldByName('DESCRICAO').AsString;//pega o resultado do SQL
   QyAtividade.close;
end;

function TFTRE001C.Gravar: Boolean;
var ExisteAtividade1 : boolean;
begin
   try
      ExisteAtividade1 :=  ExiteAtividade(StrToIntDef(EDT_CODIGO.Text, 0));
      QyAtividade.Close;
      QyAtividade.SQL.Clear;
      if ExisteAtividade1 then
      begin
         QyAtividade.SQL.Add('UPDATE TBATIVIDADE SET DESCRICAO = :CODIGO WHERE CODIGO = :CODIGO');
         QyAtividade.ParamByName('CODIGO').AsInteger:= StrToIntDef(EDT_CODIGO.Text, 0);
      end
      else
         QyAtividade.SQL.Add('INSERT INTO TBATIVIDADE (DESCRICAO) VALUES (:DESCRICAO)');
      QyAtividade.ParamByName('DESCRICAO').AsString:= TRIM(EDT_DESCRICAO.Text);
      QyAtividade.ExecSQL;
      Result:= true;
      LimpaCampos();
   except
      Result := False;
   end;
end;

procedure TFTRE001C.BitBtn1Click(Sender: TObject);
begin
   if (Application.MessageBox(PWidechar('Deseja Apagar o registro? '+EDT_DESCRICAO.Text),'Responda', MB_YESNO + MB_ICONQUESTION)) = mrYes then
   begin
      CONEXAO.DMConexao.StartTransaction;
     try
        if Deletar(StrToIntDef(EDT_CODIGO.Text,0)) then
        begin
           Application.MessageBox('Registro Apagado com sucessos','Informação',MB_ICONQUESTION);
           CONEXAO.DMConexao.Commit;
        end
        else
           Application.MessageBox('Falha ao apagar o itens', 'Informação', MB_OK+MB_ICONERROR);
     finally
        if (CONEXAO.DMConexao.InTransaction) then
            CONEXAO.DMConexao.Rollback;
     end;
   end;
end;

procedure TFTRE001C.BitBtnOKClick(Sender: TObject);
begin
   if (StrToIntDef(EDT_CODIGO.Text,0)) =0 then
   begin
      Application.MessageBox('Necessario conter codigo da atividade','Informção', mb_ok+ MB_ICONEXCLAMATION);
      exit;
   end;
   if (trim(EDT_DESCRICAO.Text) = '') then
   begin
      Application.MessageBox('Necessario conter codigo da atividade','Informção', mb_ok+ MB_ICONEXCLAMATION);
      exit;
   end;
   CONEXAO.DMConexao.StartTransaction;
   try
      if (Gravar()) then
      begin
         Application.MessageBox('Registro gravado com sucesso','Informção', mb_ok+ MB_ICONINFORMATION);
         CONEXAO.DMConexao.Commit
      end
      else
        Application.MessageBox('Falha na gravação do registro','Informção', mb_ok+ MB_ICONERROR);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
         CONEXAO.DMConexao.Rollback;
   end;
end;
//main menu vendedor
//quando clicar
//adicionar main menu tbestado
//desabilitar o botao excluir e se exitir informações

function TFTRE001C.Deletar(const pCodigo: Integer): Boolean;
begin
   try
      QyAtividade.Close;
      QyAtividade.SQL.Clear;
      QyAtividade.SQL.Add('DELETE FROM TBATIVIDADE WHERE CODIGO = :CODIGO');
      QyAtividade.ParamByName('CODIGO').AsInteger := pCodigo;
      QyAtividade.ExecSQL;
      QyAtividade.close;
      Result:= true
   except
      Result:= false;
   end;
end;

procedure TFTRE001C.EDT_CODIGOClick(Sender: TObject);
begin
   LimpaCampos();
   EDT_CODIGO.Text := ProximoId();
end;

//procedure TFTRE001C.EDT_CODIGOEnter(Sender: TObject);
//begin
//      LimpaCampos();
//      EDT_CODIGO.Text := ProximoId();
//end;

procedure TFTRE001C.EDT_CODIGOExit(Sender: TObject);
begin
   if (StrToIntDef(EDT_CODIGO.Text,0) > 0) then
   begin
      EDT_DESCRICAO.Text := GetdescricaoAtividade(StrToIntDef(EDT_CODIGO.Text,0));
      BitBtn1.Enabled:= (trim(EDT_DESCRICAO.Text) <> '')
   end;
end;

function TFTRE001C.ExiteAtividade(const pCodigo: Integer): Boolean;
begin
   QyAtividade.Close;
   QyAtividade.SQL.Clear;
   QyAtividade.SQL.Add('SELECT CODIGO FROM TBATIVIDADE WHERE CODIGO = :CODIGO');
   QyAtividade.ParamByName('CODIGO').AsInteger:= pCodigo;
   QyAtividade.Open;
   Result := not QyAtividade.IsEmpty;
   QyAtividade.Close;
end;

procedure TFTRE001C.LimpaCampos;
begin
   EDT_CODIGO.Clear;
   EDT_DESCRICAO.Clear;
   BitBtn1.Enabled:= false;
   EDT_CODIGO.SetFocus;
   EDT_CODIGO.SelectAll;
end;

procedure TFTRE001C.PageControl1Change(Sender: TObject);
var
  I: Integer;
begin
   if (PageControl1.ActivePage = TabSheetConsulta) then
   begin
      CarregaTodosRegistros();
   end;
end;

function TFTRE001C.ProximoId: string;
begin
   QyAtividade.Close;
   QyAtividade.SQL.Clear;
   QyAtividade.SQL.Add('SELECT ISNULL(MAX(CODIGO),0)+1 AS PROXIMO FROM TBATIVIDADE');
   QyAtividade.Open;
   Result:= QyAtividade.FieldByName('PROXIMO').AsString;
   QyAtividade.Close;
end;

procedure TFTRE001C.StringGrid1DblClick(Sender: TObject);
const
   cntCodigo = 0;
   cntDescricao = 1;
begin
   EDT_CODIGO.Text:= StringGrid1.Cells[cntCodigo,StringGrid1.Row];
   EDT_DESCRICAO.Text:= StringGrid1.Cells[cntDescricao,StringGrid1.Row];
   PageControl1.TabIndex := 0;
end;

end.
