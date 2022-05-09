unit TRE003C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Data.DB, Bde.DBTables, Vcl.Grids;

type
  TFTRE003C = class(TForm)
    TPabPrincipal: TPageControl;
    TabAlteracoes: TTabSheet;
    TabListar: TTabSheet;
    BitAdicionar: TBitBtn;
    BitExcluir: TBitBtn;
    BitFechar: TBitBtn;
    EdtCodigo: TEdit;
    EdtCidade: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QyCidade: TQuery;
    CombEstados: TComboBox;
    StringGridCidades: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure AdicionarCidade(const pCodigo :String; pCidade :string; pUF :string);
    procedure RemoverCidade(const pCodigo :String);
    function ExisteCidade(const pCodigo :String): boolean;
    function CodigoAltoIncremento(): Integer;
    procedure BitAdicionarClick(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BitExcluirClick(Sender: TObject);
    procedure LimpaCampos();
    procedure StringGridCidadesDblClick(Sender: TObject);
    procedure CarregaBanco();
    procedure TPabPrincipalChange(Sender: TObject);
    procedure EdtCodigoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE003C: TFTRE003C;
const
   CntLinhaum = 0;
   CntLinhaDois = 1;
   CntLinhatres = 2;

implementation

{$R *.dfm}

uses CONEXAO001, Util;

procedure TFTRE003C.AdicionarCidade(const pCodigo :String; pCidade :string; pUF :string);
var VerificaExite: Boolean;
begin
   try
      VerificaExite := ExisteCidade(EdtCodigo.Text);
     if (VerificaExite) then
     begin
        if (Application.MessageBox('A cidade já esta cadastrada dejesa alterar ?', 'Alteração de dado', MB_YESNO + MB_ICONINFORMATION) = mrNo)then
            exit;
     end;
     CONEXAO.DMConexao.StartTransaction;
     QyCidade.Close;
     QyCidade.SQL.Clear;
     if (VerificaExite) then
        QyCidade.SQL.Add('UPDATE TBCIDADE SET DESCRICAO_CIDADE = :CIDADE, UF = :UF WHERE CODIGO = :CODIGO')
     else
         QyCidade.SQL.Add('INSERT INTO TBCIDADE(CODIGO,DESCRICAO_CIDADE,UF) VALUES (:CODIGO,:CIDADE,:UF)');
     QyCidade.ParamByName('CODIGO').AsString := pCodigo;
     QyCidade.ParamByName('CIDADE').AsString := pCidade;
     QyCidade.ParamByName('UF').AsString := pUF;
     QyCidade.ExecSQL;
     CONEXAO.DMConexao.Commit;
     Application.MessageBox('Informação gravada com sucesso', 'Dados Gravados', MB_OK + MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao gravar a informação', 'Falha ao gravar', MB_OK + MB_ICONERROR);
      end;
      QyCidade.Close;
   end;
end;

procedure TFTRE003C.RemoverCidade(const pCodigo :String);
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      QyCidade.Close;
      QyCidade.SQL.Clear;
      QyCidade.SQL.Add('DELETE FROM TBCIDADE WHERE CODIGO = :CODIGO');
      QyCidade.ParamByName('CODIGO').AsString := pCodigo;
      QyCidade.ExecSQL;
      QyCidade.Close;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Informação excluida com sucesso', 'Dado Excluir', MB_OK + MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao excluir a informação', 'Falha na exclusão', MB_OK + MB_ICONERROR);
      end;
   end;
end;

procedure TFTRE003C.CarregaBanco();
begin
   QyCidade.Close;
   QyCidade.SQL.Clear;
   QyCidade.SQL.Add('SELECT CODIGO,DESCRICAO_CIDADE, UF FROM TBCIDADE ');
   QyCidade.Open;
   LimpaStringGrid(StringGridCidades);
   while not(QyCidade.Eof) do
   begin
      if (StringGridCidades.Cells[CntLinhaum,StringGridCidades.RowCount -1] <> '') then
         StringGridCidades.RowCount := StringGridCidades.RowCount + 1;
      StringGridCidades.Cells[CntLinhaum,StringGridCidades.RowCount -1]:= QyCidade.FieldByName('CODIGO').AsString;
      StringGridCidades.Cells[CntLinhaDois,StringGridCidades.RowCount -1]:= QyCidade.FieldByName('DESCRICAO_CIDADE').AsString;
      StringGridCidades.Cells[CntLinhatres,StringGridCidades.RowCount -1]:= QyCidade.FieldByName('UF').AsString;
      QyCidade.Next;
   end;
   QyCidade.Close;
end;

procedure TFTRE003C.EdtCodigoClick(Sender: TObject);
begin
   EdtCodigo.Text := IntToStr(CodigoAltoIncremento());
end;

procedure TFTRE003C.EdtCodigoExit(Sender: TObject);
begin
   if (EdtCodigo.Text <> '') then
   begin
      BitExcluir.Enabled := ExisteCidade(EdtCodigo.Text);
      BitAdicionar.Enabled := true;
   end;
end;

function TFTRE003C.ExisteCidade(const pCodigo :String): boolean;
begin
   QyCidade.Close;
   QyCidade.SQL.Clear;
   QyCidade.SQL.Add('SELECT CODIGO,DESCRICAO_CIDADE, UF FROM TBCIDADE WHERE CODIGO = :CODIGO');
   QyCidade.ParamByName('CODIGO').AsString := pCodigo;
   QyCidade.open;
   if (not (QyCidade.IsEmpty)) then
   begin
      EdtCidade.Text:= QyCidade.FieldByName('DESCRICAO_CIDADE').AsString;
      CombEstados.Text := QyCidade.FieldByName('UF').AsString;
      BitAdicionar.Enabled:=true;
      BitExcluir.Enabled:=true;
   end;
   Result := not (QyCidade.IsEmpty);
   QyCidade.Close;
end;

function TFTRE003C.CodigoAltoIncremento(): Integer;
begin
   QyCidade.Close;
   QyCidade.SQL.Clear;
   QyCidade.SQL.Add('SELECT ISNULL (MAX(CODIGO),0)+1 AS PROXIMO FROM TBCIDADE');
   QyCidade.Open;
   Result := QyCidade.FieldByName('PROXIMO').AsInteger;
   QyCidade.Close;
end;

procedure TFTRE003C.FormCreate(Sender: TObject);
begin
   StringGridCidades.Cells[CntLinhaum,CntLinhaum]:= 'Código';
   StringGridCidades.Cells[CntLinhaDois,CntLinhaum]:= 'Cidade';
   StringGridCidades.Cells[CntLinhatres,CntLinhaum]:= 'UF';
end;

procedure TFTRE003C.FormShow(Sender: TObject);
begin
   QyCidade.Close;
   QyCidade.SQL.Clear;
   QyCidade.SQL.Add('SELECT UF FROM TBESTADO');
   QyCidade.Open;
   while not (QyCidade.Eof) do
   begin
      CombEstados.Items.Add(QyCidade.FieldByName('UF').AsString);
      QyCidade.Next;
   end;
   QyCidade.close;
end;

procedure TFTRE003C.LimpaCampos();
begin
   EdtCodigo.Clear;
   EdtCidade.Clear;
   CombEstados.Text := '';
   BitAdicionar.Enabled := False;
   BitExcluir.Enabled := False;
   EdtCodigo.SetFocus;
end;

procedure TFTRE003C.BitAdicionarClick(Sender: TObject);
begin
   if ((trim(EdtCodigo.Text) <> '') and (trim(EdtCidade.Text) <> '') and (CombEstados.Text <> '')) then
      AdicionarCidade(EdtCodigo.Text, EdtCidade.Text, CombEstados.Text)
   else
      Application.MessageBox('Por Favor, Insira todos os dados','Dados Incompletos', MB_OK + MB_ICONWARNING);
   LimpaCampos();
end;

procedure TFTRE003C.BitExcluirClick(Sender: TObject);
begin
   if (Application.MessageBox('Tem certeza que deseja excluir esse dados? ','Exclusão de dado',MB_YESNO + MB_ICONINFORMATION) = mrNo) then
      exit;
   RemoverCidade(EdtCodigo.Text);
   LimpaCampos();
end;

procedure TFTRE003C.StringGridCidadesDblClick(Sender: TObject);
begin
   EdtCodigo.Text := StringGridCidades.Cells[CntLinhaum,StringGridCidades.Row];
   EdtCidade.Text := StringGridCidades.Cells[CntLinhaDois,StringGridCidades.Row];
   //CombEstados.Text := StringGridCidades.Cells[CntLinhatres,StringGridCidades.Row];
   CombEstados.ItemIndex := CombEstados.Items.IndexOf(StringGridCidades.Cells[CntLinhatres,StringGridCidades.Row]);
   TPabPrincipal.TabIndex := CntLinhaum;
   BitAdicionar.Enabled := true;
   BitExcluir.Enabled := true;
end;

procedure TFTRE003C.TPabPrincipalChange(Sender: TObject);
begin
   if (TPabPrincipal.ActivePage = TabListar ) then
      CarregaBanco();
   BitAdicionar.Enabled := false;
   BitExcluir.Enabled := false;
end;

end.
