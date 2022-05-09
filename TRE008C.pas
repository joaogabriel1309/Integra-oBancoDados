unit TRE008C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Bde.DBTables;

type
  TFTRE008C = class(TForm)
    BitOk: TBitBtn;
    BitExcluir: TBitBtn;
    BitFechar: TBitBtn;
    EdtCodigo: TEdit;
    EdtMotivoDestaques: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    QyMotivosDestaques: TQuery;
    SpeedButton1: TSpeedButton;
    procedure BitOkClick(Sender: TObject);
    procedure BitExcluirClick(Sender: TObject);
    procedure EdtCodigoEnter(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    function VerificaExitente(const pCodigo: Integer; CarregaDados: Boolean): Boolean;
    procedure LimparCampos();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE008C: TFTRE008C;

implementation

{$R *.dfm}

uses Util, CONEXAO001, TRE200P;

procedure TFTRE008C.BitOkClick(Sender: TObject);
var VerificarExistencia: Boolean;
begin
   if (trim(EdtCodigo.Text) <> '') and (trim(EdtMotivoDestaques.Text) <> '')then
   begin
      VerificarExistencia := VerificaExitente(StrToIntDef(EdtCodigo.Text,0), False);
      if (VerificarExistencia) then
      begin
         if (Application.MessageBox('O motivo já esta cadastrada dejesa altera-lo ?', 'Alteração de dado', MB_YESNO + MB_ICONINFORMATION) = mrNo)then
            exit;
      end;
      CONEXAO.DMConexao.StartTransaction;
      try
         QyMotivosDestaques.Close;
         QyMotivosDestaques.SQL.Clear;
         if (VerificarExistencia) then
            QyMotivosDestaques.SQL.Add('UPDATE TBMOTIVOSDESTAQUES SET DESCRICAO = :DESCRICAO WHERE CODIGO = :CODIGO')
         else
            QyMotivosDestaques.SQL.Add('INSERT INTO TBMOTIVOSDESTAQUES(CODIGO, DESCRICAO) VALUES (:CODIGO,:DESCRICAO)');
         QyMotivosDestaques.ParamByName('CODIGO').AsInteger := StrToIntDef(EdtCodigo.Text,0);
         QyMotivosDestaques.ParamByName('DESCRICAO').AsString := SoLetras(Trim(UpperCase(EdtMotivoDestaques.Text)));
         QyMotivosDestaques.ExecSQL;
         CONEXAO.DMConexao.Commit;
         Application.MessageBox('Informação gravada com sucesso', 'Dados Gravados', MB_OK + MB_ICONINFORMATION);
      finally
         if (CONEXAO.DMConexao.InTransaction) then
         begin
            CONEXAO.DMConexao.Rollback;
            Application.MessageBox('Falha ao gravar a informação', 'Falha ao gravar', MB_OK + MB_ICONERROR);
         end;
         LimparCampos();
         QyMotivosDestaques.Close;
      end;
   end
   else
      Application.MessageBox('Por Favor, Insira todos os dados','Campos Vazios', MB_OK + MB_ICONWARNING);
end;

procedure TFTRE008C.BitExcluirClick(Sender: TObject);
begin
   if (trim(EdtCodigo.Text) <> '') then
   begin
      CONEXAO.DMConexao.StartTransaction;
      try
         QyMotivosDestaques.Close;
         QyMotivosDestaques.SQL.Clear;
         QyMotivosDestaques.SQL.Add('DELETE TBMOTIVOSDESTAQUES WHERE CODIGO = :CODIGO');
         QyMotivosDestaques.ParamByName('CODIGO').AsInteger := StrToIntDef(SoNumero(EdtCodigo.Text),0);
         QyMotivosDestaques.ExecSQL;
         CONEXAO.DMConexao.Commit;
         Application.MessageBox('Informação excluido com sucesso', 'Dados excluido', MB_OK + MB_ICONINFORMATION);
      finally
         if (CONEXAO.DMConexao.InTransaction) then
         begin
            CONEXAO.DMConexao.Rollback;
            Application.MessageBox('Falha ao excluir a informação', 'Falha ao excluir', MB_OK + MB_ICONERROR);
         end;
         LimparCampos();
         QyMotivosDestaques.Close;
      end;
   end
   else
     Application.MessageBox('Por Favor, Insira todos os dados','Campos Vazios', MB_OK + MB_ICONWARNING);
end;

procedure TFTRE008C.EdtCodigoEnter(Sender: TObject);
begin
   QyMotivosDestaques.Close;
   QyMotivosDestaques.SQL.Clear;
   QyMotivosDestaques.SQL.Add('SELECT ISNULL (MAX(CODIGO),0)+1 AS MAXIMO FROM TBMOTIVOSDESTAQUES');
   QyMotivosDestaques.Open;
   EdtCodigo.Text := QyMotivosDestaques.FieldByName('MAXIMO').AsString;
   QyMotivosDestaques.Close;
end;

procedure TFTRE008C.EdtCodigoExit(Sender: TObject);
begin
   if (trim(EdtCodigo.Text) <> '') then
   begin
      if not(VerificaExitente(StrToIntDef(SoNumero(EdtCodigo.Text),0), True)) then
      begin
         EdtMotivoDestaques.Clear;
         BitOk.Enabled := false;
         BitExcluir.Enabled := false;
      end
      else
         BitExcluir.Enabled := true;
      BitOk.Enabled := true;
   end;
end;

procedure TFTRE008C.LimparCampos;
begin
   EdtCodigo.Clear;
   EdtMotivoDestaques.Clear;
   EdtCodigo.SetFocus;
   BitOk.Enabled := false;
   BitExcluir.Enabled := false;
end;

procedure TFTRE008C.SpeedButton1Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqMotivos;
   EdtCodigo.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtCodigo.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

function TFTRE008C.VerificaExitente(const pCodigo: Integer; CarregaDados: Boolean): Boolean;
begin
   QyMotivosDestaques.Close;
   QyMotivosDestaques.SQL.Clear;
   QyMotivosDestaques.SQL.Add('SELECT CODIGO,DESCRICAO FROM TBMOTIVOSDESTAQUES WHERE CODIGO = :CODIGO');
   QyMotivosDestaques.ParamByName('CODIGO').AsInteger := pCodigo;
   QyMotivosDestaques.Open;
   if ((not(QyMotivosDestaques.IsEmpty)) and CarregaDados) then
   begin
      EdtMotivoDestaques.Text := QyMotivosDestaques.FieldByName('DESCRICAO').AsString;
      result := True;
      BitExcluir.Enabled := True;
   end
   else
      result := not(QyMotivosDestaques.IsEmpty);
   BitOk.Enabled := True;
end;

end.
