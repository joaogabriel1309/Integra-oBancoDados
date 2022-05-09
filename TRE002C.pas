unit TRE002C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, Bde.DBTables, Vcl.Grids;

type
  TFTRE002C = class(TForm)
    BitAdicionar: TBitBtn;
    BitRemover: TBitBtn;
    BitFechar: TBitBtn;
    TabAlteracoes: TTabSheet;
    TabListar: TTabSheet;
    PagPrincipal: TPageControl;
    EdtUf: TEdit;
    Label1: TLabel;
    EdtEstado: TEdit;
    Label2: TLabel;
    EdtICMS: TEdit;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    QyEstado: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitAdicionarClick(Sender: TObject);
    procedure BitRemoverClick(Sender: TObject);
    procedure EdtUfExit(Sender: TObject);
    procedure PagPrincipalChange(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure BitFecharClick(Sender: TObject);
  private
      procedure LimpaCampos();
      procedure RemoverEstado(pUF: string);
      function ExisteEstado(const pUF: string; pCarregarDados: Boolean = False): boolean;
      procedure AdicionaEstado(pUF: string; pEstado: string; pICMS :String);
      procedure CarregaDadosDoBanco();
  public
    { Public declarations }
  end;

var
  FTRE002C: TFTRE002C;
const
   CntColunaUF = 0;
   CntColunaEstado = 1;
   CntColunaICMS = 2;

implementation

{$R *.dfm}

uses CONEXAO001, Util;

procedure TFTRE002C.RemoverEstado(pUF: string);
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      QyEstado.close;
      QyEstado.SQL.Clear;
      QyEstado.SQL.Add('DELETE FROM TBESTADO WHERE UF = :pUF');
      QyEstado.ParamByName('pUF').AsString := pUF;
      QyEstado.ExecSQL;
      QyEstado.Close;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Estado excluido com sucesso!','Dado Excluido', MB_OK + MB_ICONINFORMATION);
      LimpaCampos();
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('A exclusão do dado falhou','Falha ao excluir o dado', MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFTRE002C.AdicionaEstado(pUF: string; pEstado: string; pICMS :String);
var VerificaExite: boolean;
begin
   try
      VerificaExite := ExisteEstado(EdtUf.Text);
      if (VerificaExite) then
      begin
         if (Application.MessageBox('O Estado Inserido já existe na tabela dejesa alterar ?','Alterar dados', MB_YESNO + MB_ICONINFORMATION) = mrNo) then
            Exit;
      end;
      CONEXAO.DMConexao.StartTransaction;
      QyEstado.Close;
      QyEstado.SQL.Clear;
      if VerificaExite then
         QyEstado.SQL.Add('UPDATE TBESTADO SET ESTADO = :ESTADO, ICMS = :ICMS WHERE UF = :UF')
      else
         QyEstado.SQL.Add('INSERT INTO TBESTADO(UF,ESTADO,ICMS) VALUES(:UF,:ESTADO,:ICMS)');
      QyEstado.ParamByName('UF').AsString := pUF;
      QyEstado.ParamByName('ESTADO').AsString := pEstado;
      QyEstado.ParamByName('ICMS').AsString := pICMS;
      QyEstado.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Dados Gravados com sucessos!','Dados Garvados', MB_OK + MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao Gravados os Dados','Dados Garvados', MB_OK + MB_ICONERROR);
      end;
      LimpaCampos();
   end;
end;

procedure TFTRE002C.CarregaDadosDoBanco();
begin
   QyEstado.Close;
   QyEstado.SQL.Clear;
   QyEstado.SQL.Add('SELECT UF,ESTADO,ICMS FROM TBESTADO ORDER BY UF');
   QyEstado.Open;
   LimpaStringGrid(StringGrid1);
   while not (QyEstado.Eof) do
   begin
      if (StringGrid1.Cells[CntColunaUF, StringGrid1.RowCount -1] <> '') then
         StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Cells[CntColunaUF, StringGrid1.RowCount - 1]:= QyEstado.FieldByName('UF').AsString;
      StringGrid1.Cells[CntColunaEstado, StringGrid1.RowCount - 1]:= QyEstado.FieldByName('ESTADO').AsString;
      StringGrid1.Cells[CntColunaICMS, StringGrid1.RowCount - 1]:= QyEstado.FieldByName('ICMS').AsString;
      QyEstado.Next;
   end;
   QyEstado.Close;
end;

procedure TFTRE002C.LimpaCampos();
begin
   EdtUf.Clear;
   EdtEstado.Clear;
   EdtICMS.Clear;
   EdtUf.SetFocus;
   BitAdicionar.Enabled := false;
   BitRemover.Enabled := false;
end;

procedure TFTRE002C.PagPrincipalChange(Sender: TObject);
begin
   if (PagPrincipal.ActivePage = TabListar) then
   begin
      CarregaDadosDoBanco();
   end;
end;

procedure TFTRE002C.BitAdicionarClick(Sender: TObject);
begin
   if (trim(EdtUf.Text) = '') or (trim(EdtEstado.Text) = '') or (trim(EdtICMS.Text) = '') then
   begin
      Application.MessageBox('Campos Obrigatorios','Campo Vazio', MB_OK + MB_ICONERROR);
      exit;
   end;
   AdicionaEstado(EdtUf.Text, EdtEstado.Text, EdtICMS.Text);
end;

procedure TFTRE002C.BitFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFTRE002C.BitRemoverClick(Sender: TObject);
begin
   if (ExisteEstado(EdtUf.Text)) then
   begin
      if (Application.MessageBox(PWidechar('Tem certeza que dejesa excluir este estado? '#13''+EdtEstado.Text),'Excluir Estado', MB_YESNO + MB_ICONQUESTION)) = mrYes then
         RemoverEstado(EdtUf.Text);
   end;
end;

procedure TFTRE002C.EdtUfExit(Sender: TObject);
const
   CNTCarregarDados = True;
begin
   if ExisteEstado(EdtUf.Text, CNTCarregarDados) then
      BitRemover.Enabled := true;
   BitAdicionar.Enabled := true;
   BitAdicionar.SetFocus;
end;

function TFTRE002C.ExisteEstado(const pUF: String; pCarregarDados: Boolean): boolean;
const
   pCarregaDados = true;
begin
   QyEstado.Close;
   QyEstado.SQL.Clear;
   QyEstado.SQL.Add('SELECT ESTADO,ICMS FROM TBESTADO WHERE UF = :UF');
   QyEstado.ParamByName('UF').AsString := pUF;
   QyEstado.Open;
   if (not QyEstado.IsEmpty) and (pCarregarDados) then
   begin
      EdtEstado.Text:= QyEstado.FieldByName('ESTADO').AsString;
      EdtICMS.Text:=QyEstado.FieldByName('ICMS').AsString;
      BitAdicionar.Enabled := True;
      BitRemover.Enabled := true;
   end;
   Result := not QyEstado.IsEmpty;
   QyEstado.Close;
end;

procedure TFTRE002C.FormCreate(Sender: TObject);
begin
   BitAdicionar.Enabled := false;
   BitRemover.Enabled := false;
   StringGrid1.Cells[CntColunaUF,CntColunaUF] := 'UF';
   StringGrid1.Cells[CntColunaEstado,CntColunaUF] := 'ESTADO';
   StringGrid1.Cells[CntColunaICMS,CntColunaUF] := 'ICMS';
end;

procedure TFTRE002C.StringGrid1DblClick(Sender: TObject);
begin
   EdtUf.Text := StringGrid1.Cells[CntColunaUF,StringGrid1.Row];
   EdtEstado.Text := StringGrid1.Cells[CntColunaEstado,StringGrid1.Row];
   EdtICMS.Text := StringGrid1.Cells[CntColunaICMS,StringGrid1.Row];
   PagPrincipal.TabIndex := 0;
   BitAdicionar.Enabled := true;
   BitRemover.Enabled := true;
end;

end.
