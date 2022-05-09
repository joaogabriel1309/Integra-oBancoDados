unit TRE010C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Bde.DBTables;

type
  TFTRE010C = class(TForm)
    EdtCodigoCliente: TEdit;
    EdtNomeCliente: TEdit;
    EdtConselhoRegional: TEdit;
    EdtSigla: TEdit;
    BitSalvar: TBitBtn;
    BitNovo: TBitBtn;
    BitExcluir: TBitBtn;
    BitFechar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    QyFormacao: TQuery;
    EdtCodigoFormacao: TEdit;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitNovoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EdtCodigoClienteExit(Sender: TObject);
    procedure EdtSiglaExit(Sender: TObject);
    procedure EdtCodigoFormacaoEnter(Sender: TObject);
    procedure EdtCodigoFormacaoExit(Sender: TObject);
    procedure BitExcluirClick(Sender: TObject);
    procedure BitSalvarClick(Sender: TObject);
  private
    procedure VerificaExiste(const pCodigo: String; pCarregaEdit: Integer);
    procedure LimparCampos();
    function CodigoMax(): String;
    procedure Gravar();
    procedure Excluir();
    function VerificaExistencia(pCarregarDados: Boolean): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE010C: TFTRE010C;
const
  IniciaEditCliente = 1;
  IniciaEditConselho = 2;

implementation

{$R *.dfm}

uses TRE200P, Util, CONEXAO001;

procedure TFTRE010C.BitExcluirClick(Sender: TObject);
begin
   if ((SoNumero(EdtCodigoFormacao.Text)) <> '') then
   begin
      if (Application.MessageBox('Tem Certeza que deseja excluir esse dado?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes) then
         Excluir();
   end
   else
      Application.MessageBox('Campos vazio(s)', 'Vazio', MB_OK+MB_ICONWARNING);
end;

procedure TFTRE010C.BitNovoClick(Sender: TObject);
begin
   LimparCampos();
end;

procedure TFTRE010C.BitSalvarClick(Sender: TObject);
begin
   if ((SoNumero(EdtCodigoFormacao.Text) <> '') and (SoNumero(EdtCodigoCliente.Text) <> '') and (trim(EdtSigla.Text) <> '')) then
      Gravar()
   else
      Application.MessageBox('Por Favor, insira todas as informações', 'Campo(s) Vazio(s)', MB_OK+MB_ICONWARNING);
end;

function TFTRE010C.CodigoMax: String;
begin
   QyFormacao.Close;
   QyFormacao.SQL.Clear;
   QyFormacao.SQL.Add('SELECT ISNULL (MAX(CODIGO),0)+1 AS MAXIMO FROM TBFORMACAO');
   QyFormacao.Open;
   Result := QyFormacao.FieldByName('MAXIMO').AsString;
end;

procedure TFTRE010C.EdtCodigoClienteExit(Sender: TObject);
begin
   if (trim(EdtCodigoCliente.Text) <> '') then
   begin
      VerificaExiste(SoNumero(EdtCodigoCliente.Text), IniciaEditCliente);
      BitNovo.Enabled := true;
   end;
end;

procedure TFTRE010C.EdtCodigoFormacaoEnter(Sender: TObject);
begin
   EdtCodigoFormacao.Text := CodigoMax();
end;

procedure TFTRE010C.EdtCodigoFormacaoExit(Sender: TObject);
begin
   VerificaExistencia(True);
end;

procedure TFTRE010C.EdtSiglaExit(Sender: TObject);
begin
   if (trim(EdtSigla.Text) <> '') then
   begin
      VerificaExiste(EdtSigla.Text, IniciaEditConselho);
      BitNovo.Enabled := true;
   end;
end;

procedure TFTRE010C.Excluir;
begin
   CONEXAO.DMConexao.StartTransaction;
   try
     QyFormacao.Close;
     QyFormacao.SQL.Clear;
     QyFormacao.SQL.Add('DELETE FROM TBFORMACAO WHERE CODIGO = :CODIGO');
     QyFormacao.ParamByName('CODIGO').AsString := SoNumero(EdtCodigoFormacao.Text);
     QyFormacao.ExecSQL;
     Application.MessageBox('Dados excluido com sucesso!','Dados Excluido', MB_OK+MB_ICONINFORMATION);
     CONEXAO.DMConexao.Commit;
   finally
     if CONEXAO.DMConexao.InTransaction then
     begin
        CONEXAO.DMConexao.Rollback;
        Application.MessageBox('Falhas ao excluir dados','Falha',MB_OK+MB_ICONERROR);
     end;
     LimparCampos;
   end;
end;

procedure TFTRE010C.Gravar;
var pExiste: Boolean;
begin
   pExiste := VerificaExistencia(False);
   try
     if (pExiste) then
        if (Application.MessageBox('O Código já existe deseja altera-lo?','Alterar', MB_YESNO + MB_ICONINFORMATION) = mrNo) then
           Exit;
     CONEXAO.DMConexao.StartTransaction;
     QyFormacao.Close;
     QyFormacao.SQL.Clear;
     if pExiste then
        QyFormacao.SQL.Add('UPDATE TBFORMACAO SET CLIENTE = :CLIENTE, FORMACAO = :FORMACAO WHERE CODIGO = :CODIGO')
     else
        QyFormacao.SQL.Add('INSERT INTO TBFORMACAO(CODIGO,CLIENTE,FORMACAO) VALUES (:CODIGO,:CLIENTE,:FORMACAO)');
     QyFormacao.ParamByName('CODIGO').AsString := SoNumero(EdtCodigoFormacao.Text);
     QyFormacao.ParamByName('CLIENTE').AsString := SoNumero(EdtCodigoCliente.Text);
     QyFormacao.ParamByName('FORMACAO').AsString := Trim(EdtSigla.Text);
     QyFormacao.ExecSQL;
     CONEXAO.DMConexao.Commit;
     Application.MessageBox('Informações gravadas com sucesso', 'Dados Gravados', MB_OK+MB_ICONINFORMATION);
   finally
     if CONEXAO.DMConexao.InTransaction then
     begin
        Application.MessageBox('Falha ao gravar informações','Falha', MB_OK+MB_ICONERROR);
        CONEXAO.DMConexao.Rollback;
     end;
     LimparCampos;
   end;
end;

procedure TFTRE010C.LimparCampos;
begin
   EdtCodigoCliente.Clear;
   EdtNomeCliente.Clear;
   EdtConselhoRegional.Clear;
   EdtSigla.Clear;
   EdtCodigoCliente.SetFocus;
   BitNovo.Enabled := false;
   BitSalvar.Enabled := false;
   BitExcluir.Enabled := false;
   EdtCodigoFormacao.SetFocus;
end;

procedure TFTRE010C.SpeedButton1Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqConselho;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtSigla.Text := FTRE200P.Retorno;
      EdtConselhoRegional.Text := FTRE200P.RetornoConselhoDescricao;
      BitSalvar.Enabled := true;
   end
   else
      BitSalvar.Enabled := false;
end;

procedure TFTRE010C.SpeedButton2Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqCliente;
   EdtCodigoCliente.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtCodigoCliente.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

procedure TFTRE010C.SpeedButton3Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqFormacao;
   EdtCodigoFormacao.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtCodigoFormacao.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

procedure TFTRE010C.VerificaExiste(const pCodigo: String; pCarregaEdit: Integer);
begin
   QyFormacao.Close;
   QyFormacao.SQL.Clear;
   if (pCarregaEdit = IniciaEditCliente) then
   begin
      QyFormacao.SQL.Add('SELECT CODIGO, NOME FROM TBCLIENTE WHERE CODIGO = :CODIGO');
      QyFormacao.ParamByName('CODIGO').AsString := pCodigo;
   end;
   if (pCarregaEdit = IniciaEditConselho) then
   begin
      QyFormacao.SQL.add('SELECT SIGLA, DESCRICAO FROM TBCONSELHO_REGIONAL WHERE SIGLA = :SIGLA');
      QyFormacao.ParamByName('SIGLA').AsString := pCodigo;
   end;
   QyFormacao.Open;
   if (not(QyFormacao.IsEmpty)) then
   begin
      if (pCarregaEdit = IniciaEditCliente) then
         EdtNomeCliente.Text := QyFormacao.FieldByName('NOME').AsString;
      if (pCarregaEdit = IniciaEditConselho) then
         EdtConselhoRegional.Text := QyFormacao.FieldByName('DESCRICAO').AsString;
   end
   else
     Application.MessageBox('Código Invalido!','Registor não encontrado',MB_OK+MB_ICONWARNING);
end;

function TFTRE010C.VerificaExistencia(pCarregarDados: Boolean): Boolean;
begin
   if (SoNumero(EdtCodigoFormacao.Text) <> '') then
   begin
      QyFormacao.Close;
      QyFormacao.SQL.Clear;
      QyFormacao.SQL.Add('SELECT TBFORMACAO.CODIGO, TBCLIENTE.CODIGO AS CODCLIENTE, TBCLIENTE.NOME AS NOMECLIENTE, TBCONSELHO_REGIONAL.SIGLA AS SIGLA, TBCONSELHO_REGIONAL.DESCRICAO AS DESCRICAO FROM TBFORMACAO');
      QyFormacao.SQL.Add('JOIN TBCLIENTE ON (TBCLIENTE.CODIGO = TBFORMACAO.CLIENTE) JOIN TBCONSELHO_REGIONAL ON (TBCONSELHO_REGIONAL.SIGLA = TBFORMACAO.FORMACAO)');
      QyFormacao.SQL.Add('WHERE TBFORMACAO.CODIGO = :CODIGO');
      QyFormacao.ParamByName('CODIGO').AsString := SoNumero(EdtCodigoFormacao.Text);
      QyFormacao.Open;
      if (not(QyFormacao.IsEmpty) and pCarregarDados) then
      begin
         EdtCodigoCliente.Text := QyFormacao.FieldByName('CODCLIENTE').AsString;
         EdtNomeCliente.Text := QyFormacao.FieldByName('NOMECLIENTE').AsString;
         EdtSigla.Text :=  QyFormacao.FieldByName('SIGLA').AsString;
         EdtConselhoRegional.Text :=  QyFormacao.FieldByName('DESCRICAO').AsString;
         BitExcluir.Enabled := true;
      end;
      Result := not(QyFormacao.IsEmpty);
      BitSalvar.Enabled := true;
      BitNovo.Enabled := true;
   end;
end;

end.
