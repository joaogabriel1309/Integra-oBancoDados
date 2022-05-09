unit TRE007C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Data.DB, Bde.DBTables, Vcl.Mask, Datasnap.DBClient, Vcl.ExtCtrls,
  Vcl.DBCtrls, Datasnap.Provider;

type
  TFTRE007C = class(TForm)
    EdtCodigo: TEdit;
    ComboTipoInscricao: TComboBox;
    ComboLocalAmbiente: TComboBox;
    EdtNomeAmbienteTrabalho: TEdit;
    DBFatorRisco: TDBGrid;
    MemoDescricaoAmbiente: TMemo;
    BitSair: TBitBtn;
    BitExcluir: TBitBtn;
    BitOK: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    QyAmbienteTrabalho: TQuery;
    EdtNumeroInscricao: TMaskEdit;
    DsAmbienteTrabalho: TDataSource;
    DcsTemporario: TClientDataSet;
    Label8: TLabel;
    UltimoCodigo: TLabel;
    SpeedButton2: TSpeedButton;
    DBNavigator1: TDBNavigator;
    DataSetProvider1: TDataSetProvider;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboTipoInscricaoExit(Sender: TObject);
    procedure EdtCodigoEnter(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BitExcluirClick(Sender: TObject);
    procedure BitOKClick(Sender: TObject);
    procedure EdtNumeroInscricaoExit(Sender: TObject);
    procedure DBFatorRiscoDblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    function VerificaExistente(const pCodigo: Integer; pCarregarDados: Boolean): Boolean;
    procedure CarregarFatores(pCodigo: Integer);
    procedure SelecionarMaskara;
    procedure Gravar();
    procedure Remover(const pCodigo: Integer);
    procedure RemoverFatores(const pCodigo: Integer);
    procedure GravarFatores(const ARegistroExistente:Boolean);
    procedure LimparCampos();
    procedure CodigoMaximo();
    procedure LimparDBGrid();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE007C: TFTRE007C;

implementation

{$R *.dfm}

uses TRE201P, Util, CONEXAO001, TRE200P;

procedure TFTRE007C.BitExcluirClick(Sender: TObject);
begin
   if (SoNumero(EdtCodigo.Text) <> '') then
   begin
      if (Application.MessageBox('Tem Certeza que deseja excluir ?','Confirmação',MB_YESNO+MB_ICONINFORMATION) = mrYes) then
         Remover(StrToInt(SoNumero(EdtCodigo.Text)));
   end
   else
      Application.MessageBox('Por Favor, Insira todos os dados', 'Campos Vazios', MB_OK + MB_ICONWARNING);
end;

procedure TFTRE007C.BitOKClick(Sender: TObject);
begin
   if ((SoNumero(EdtCodigo.Text) <> '')
      and (SoNumero(EdtNumeroInscricao.Text) <> '')
      and (ComboTipoInscricao.ItemIndex <> -1)
      and (ComboLocalAmbiente.ItemIndex <> -1)
      and ((EdtNomeAmbienteTrabalho.Text) <> '')
      and ((MemoDescricaoAmbiente.Text) <> '')) then
      Gravar
   else
      Application.MessageBox('Por Favor, Insira todos os dados', 'Campos Vazios', MB_OK + MB_ICONWARNING);
end;

procedure TFTRE007C.CarregarFatores(pCodigo: Integer);
var id,descricao: String;
begin
   LimparDBGrid();
   QyAmbienteTrabalho.Close;
   QyAmbienteTrabalho.SQL.Clear;
   QyAmbienteTrabalho.SQL.Add('SELECT TBIFP_ES_FATORDERISCO.ID,TBIFP_ES_FATORDERISCO.DESCRICAO FROM TBFARORES_NO_AMBIENTE JOIN TBIFP_ES_FATORDERISCO ON (TBIFP_ES_FATORDERISCO.ID = TBFARORES_NO_AMBIENTE.CODIGO_FATORES)');
   QyAmbienteTrabalho.SQL.Add('WHERE TBFARORES_NO_AMBIENTE.CODIGO_AMBINETE = :CODIGO');
   QyAmbienteTrabalho.ParamByName('CODIGO').AsInteger := pCodigo;
// FORMA 02
   DcsTemporario.Close;
   DcsTemporario.Open;

// FORMA 01
//   QyAmbienteTrabalho.Open;
//   DcsTemporario.DisableControls;
//   while not(QyAmbienteTrabalho.Eof) do
//   begin
//      DcsTemporario.Append;
//      DcsTemporario.FieldByName('ID').AsString := QyAmbienteTrabalho.FieldByName('ID').AsString;
//      DcsTemporario.FieldByName('DESCRICAO').AsString := QyAmbienteTrabalho.FieldByName('DESCRICAO').AsString;
//      QyAmbienteTrabalho.Next;
//      DcsTemporario.Next;
//   end;
//   DcsTemporario.EnableControls;
   QyAmbienteTrabalho.Close;
end;

procedure TFTRE007C.SelecionarMaskara;
begin
  EdtNumeroInscricao.Clear;
  if (ComboTipoInscricao.ItemIndex = 0) then
    EdtNumeroInscricao.EditMask := '99.999.999/9999-99;0;_';
  if (ComboTipoInscricao.ItemIndex = 1) then
    EdtNumeroInscricao.EditMask := '99-999-99.999-9/9;0;_';
  if (ComboTipoInscricao.ItemIndex = 2) then
    EdtNumeroInscricao.EditMask := '999.999.999-99;0;_';
  if (ComboTipoInscricao.ItemIndex = 3) then
    EdtNumeroInscricao.EditMask := '999.999.999/999-99;0;_';
  EdtNumeroInscricao.SetFocus;
end;

procedure TFTRE007C.ComboTipoInscricaoExit(Sender: TObject);
begin
  SelecionarMaskara();
end;

procedure TFTRE007C.DBFatorRiscoDblClick(Sender: TObject);
begin
   DcsTemporario.Edit;
   DcsTemporario.Delete;
end;

procedure TFTRE007C.EdtCodigoEnter(Sender: TObject);
begin
   DcsTemporario.close;
   DcsTemporario.CreateDataSet;
   CodigoMaximo();
   UltimoCodigo.Caption := IntToStr(StrToInt(EdtCodigo.Text) -1);
end;

procedure TFTRE007C.EdtCodigoExit(Sender: TObject);
begin
   if (VerificaExistente(StrToInt(EdtCodigo.Text), True)) then
   begin
      BitOK.Enabled := true;
      BitExcluir.Enabled := true;
   end;
end;

procedure TFTRE007C.EdtNumeroInscricaoExit(Sender: TObject);
begin
   if (SoNumero(EdtNumeroInscricao.Text) <> '') then
   begin
      case ComboTipoInscricao.ItemIndex of
         0:
         begin
            if (VerificaarCNPJ(SoNumero(EdtNumeroInscricao.Text)) = False) then
            begin
               Application.MessageBox('Por Favor, insira um CNPJ valido','CNPJ invalido',MB_OK+MB_ICONWARNING);
               EdtNumeroInscricao.Clear;
               exit;
            end;
         end;
         2:
         begin
            if (VerificarCPF(SoNumero(EdtNumeroInscricao.Text)) = False) then
            begin
               Application.MessageBox('Por Favor, insira um CPF valido','CPF invalido',MB_OK+MB_ICONWARNING);
               EdtNumeroInscricao.Clear;
               Exit;
            end;
         end;
      end;
      BitOK.Enabled := true;
   end;
end;

procedure TFTRE007C.FormShow(Sender: TObject);
begin
   QyAmbienteTrabalho.Close;
   QyAmbienteTrabalho.SQL.Clear;
   QyAmbienteTrabalho.SQL.Add('SELECT CODIGO|| '' - '' ||DESCRICAO AS INSCRICAO FROM TBTIPOINSCRICAO ');
   QyAmbienteTrabalho.Open;
   while not(QyAmbienteTrabalho.Eof) do
   begin
      ComboTipoInscricao.Items.Add(QyAmbienteTrabalho.FieldByName('INSCRICAO').AsString);
      QyAmbienteTrabalho.Next;
   end;
   QyAmbienteTrabalho.Close;
   QyAmbienteTrabalho.SQL.Clear;
   QyAmbienteTrabalho.SQL.Add('SELECT CODIGO|| '' - '' ||DESCRICAO AS LOCAL FROM TBLOCALDETRABALHO ');
   QyAmbienteTrabalho.Open;
   while not(QyAmbienteTrabalho.Eof) do
   begin
      ComboLocalAmbiente.Items.Add(QyAmbienteTrabalho.FieldByName('LOCAL').AsString);
      QyAmbienteTrabalho.Next;
   end;
end;

procedure TFTRE007C.Gravar;
var VerificarExistencia: Boolean;
begin
   VerificarExistencia := VerificaExistente(StrToInt(SoNumero(EdtCodigo.Text)), False);
   if (VerificarExistencia) then
   begin
      if (Application.MessageBox('O código digitado ja exite na tabela, tem certeza que deseja altera-lo?', 'Alterar dados', MB_YESNO + MB_ICONINFORMATION) = mrNo) then
        Exit;
   end;
   CONEXAO.DMConexao.StartTransaction;
   try
      QyAmbienteTrabalho.Close;
      QyAmbienteTrabalho.SQL.Clear;
      if (VerificarExistencia) then
         QyAmbienteTrabalho.SQL.Add('UPDATE TBAMBIENTE_DE_TRABALHO SET TIPO_INSCRICAO = :TIPO_INSCRICAO, NUMERO_INSCRICAO = :NUMERO_INSCRICAO, LOCAL_DE_TRABALHO = :LOCAL_DE_TRABALHO, NOME_DO_AMBINETE = :NOME_DO_AMBINETE, DESCRICAO_AMBIENTE = :DESCRICAO_AMBIENTE  WHERE CODIGO = :CODIGO')
      else
         QyAmbienteTrabalho.SQL.Add('INSERT INTO TBAMBIENTE_DE_TRABALHO (CODIGO,TIPO_INSCRICAO,NUMERO_INSCRICAO,LOCAL_DE_TRABALHO,NOME_DO_AMBINETE,DESCRICAO_AMBIENTE) VALUES (:CODIGO,:TIPO_INSCRICAO,:NUMERO_INSCRICAO,:LOCAL_DE_TRABALHO,:NOME_DO_AMBINETE,:DESCRICAO_AMBIENTE)');
      QyAmbienteTrabalho.ParamByName('CODIGO').AsInteger := StrToInt(SoNumero(EdtCodigo.Text));
      QyAmbienteTrabalho.ParamByName('TIPO_INSCRICAO').AsInteger := StrToInt(SoNumero(ComboTipoInscricao.Text));
      QyAmbienteTrabalho.ParamByName('NUMERO_INSCRICAO').AsString := SoNumero(EdtNumeroInscricao.Text);
      QyAmbienteTrabalho.ParamByName('LOCAL_DE_TRABALHO').AsInteger := StrToInt(SoNumero(ComboLocalAmbiente.Text));
      QyAmbienteTrabalho.ParamByName('NOME_DO_AMBINETE').AsString := SoLetras(UpperCase(EdtNomeAmbienteTrabalho.Text));
      QyAmbienteTrabalho.ParamByName('DESCRICAO_AMBIENTE').AsString := SoLetras(UpperCase(MemoDescricaoAmbiente.Text));
      QyAmbienteTrabalho.ExecSQL;
      QyAmbienteTrabalho.Close;
      GravarFatores(VerificarExistencia);
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Informações gravadas com sucesso', 'Gravadas', MB_OK + MB_ICONINFORMATION);
      UltimoCodigo.Caption := EdtCodigo.Text;
      limparCampos();
      EdtCodigo.SetFocus;
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao gravar informações', 'ERRO', MB_OK + MB_ICONERROR);
      end;
      QyAmbienteTrabalho.Close;
   end;
end;

procedure TFTRE007C.GravarFatores(const ARegistroExistente:Boolean);
begin
   if (ARegistroExistente) then
     RemoverFatores(StrToInt(SoNumero(EdtCodigo.Text)));
   QyAmbienteTrabalho.Close;
   QyAmbienteTrabalho.SQL.Clear;
   QyAmbienteTrabalho.SQL.Add('INSERT INTO TBFARORES_NO_AMBIENTE(CODIGO_AMBINETE,CODIGO_FATORES) VALUES (:AMBIENTE,:FATORES)');
   DcsTemporario.First;
   while not (DcsTemporario.Eof) do
   begin
      QyAmbienteTrabalho.ParamByName('AMBIENTE').AsInteger := StrToInt(EdtCodigo.Text);
      QyAmbienteTrabalho.ParamByName('FATORES').AsString := DcsTemporario.FieldByName('ID').AsString;
      QyAmbienteTrabalho.ExecSQL;
      DcsTemporario.Next;
   end;
   QyAmbienteTrabalho.Close;
end;

procedure TFTRE007C.LimparCampos;
begin
   ComboTipoInscricao.ItemIndex := -1;
   EdtNumeroInscricao.Clear;
   ComboLocalAmbiente.ItemIndex := -1;
   EdtNomeAmbienteTrabalho.Clear;
   MemoDescricaoAmbiente.Clear;
   BitOK.Enabled := False;
   BitExcluir.Enabled := False;
   DcsTemporario.First;
   DcsTemporario.Close;
   DcsTemporario.CreateDataSet;
end;

procedure TFTRE007C.LimparDBGrid;
begin
   DcsTemporario.First;
   while not(DcsTemporario.Eof) do
   begin
      DcsTemporario.Edit;
      DcsTemporario.Delete;
   end;
end;

procedure TFTRE007C.CodigoMaximo;
begin
  QyAmbienteTrabalho.Close;
  QyAmbienteTrabalho.SQL.Clear;
  QyAmbienteTrabalho.SQL.Add('SELECT ISNULL (MAX(CODIGO),0)+1 AS PROXIMO FROM TBAMBIENTE_DE_TRABALHO');
  QyAmbienteTrabalho.Open;
  EdtCodigo.Text := QyAmbienteTrabalho.FieldByName('PROXIMO').AsString;
  QyAmbienteTrabalho.Close;
end;

procedure TFTRE007C.Remover(const pCodigo: Integer);
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      RemoverFatores(pCodigo);
      QyAmbienteTrabalho.Close;
      QyAmbienteTrabalho.SQL.Clear;
      QyAmbienteTrabalho.SQL.Add('DELETE FROM TBAMBIENTE_DE_TRABALHO WHERE CODIGO = :CODIGO');
      QyAmbienteTrabalho.ParamByName('CODIGO').AsInteger := pCodigo;
      QyAmbienteTrabalho.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Dados excluido com sucesso', 'Dados Excluidos', MB_OK+MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao gravar informações', 'ERRO', MB_OK + MB_ICONERROR);
      end;
      EdtCodigo.Clear;
      LimparCampos();
      EdtCodigo.SetFocus;
      QyAmbienteTrabalho.Close;
   end;
end;

procedure TFTRE007C.RemoverFatores(const pCodigo: Integer);
begin
   QyAmbienteTrabalho.Close;
   QyAmbienteTrabalho.SQL.Clear;
   QyAmbienteTrabalho.SQL.Add('DELETE FROM TBFARORES_NO_AMBIENTE WHERE CODIGO_AMBINETE = :CODIGO');
   QyAmbienteTrabalho.ParamByName('CODIGO').AsInteger := pCodigo;
   QyAmbienteTrabalho.ExecSQL;
   QyAmbienteTrabalho.Close;
end;

procedure TFTRE007C.SpeedButton1Click(Sender: TObject);
begin
   if not Assigned(FTRE201P) then
      FTRE201P := FTRE201P.Create(self);
   FTRE201P.ShowModal;
end;

procedure TFTRE007C.SpeedButton2Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqAmbienteTrabalho;
   EdtCodigo.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtCodigo.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

function TFTRE007C.VerificaExistente(const pCodigo: Integer; pCarregarDados: Boolean): Boolean;
begin
   QyAmbienteTrabalho.Close;
   QyAmbienteTrabalho.SQL.Clear;
   QyAmbienteTrabalho.SQL.Add('SELECT CODIGO,TIPO_INSCRICAO AS INSCRIÇÃO,NUMERO_INSCRICAO,LOCAL_DE_TRABALHO,NOME_DO_AMBINETE,DESCRICAO_AMBIENTE FROM TBAMBIENTE_DE_TRABALHO WHERE CODIGO = :CODIGO');
   QyAmbienteTrabalho.ParamByName('CODIGO').AsInteger := pCodigo;
   QyAmbienteTrabalho.Open;
   Result := (not(QyAmbienteTrabalho.IsEmpty));
   if ((not(QyAmbienteTrabalho.IsEmpty)) and (pCarregarDados)) then
   begin
      ComboTipoInscricao.ItemIndex := QyAmbienteTrabalho.FieldByName('INSCRIÇÃO').AsInteger - 1;
      SelecionarMaskara;
      EdtNumeroInscricao.Text := QyAmbienteTrabalho.FieldByName('NUMERO_INSCRICAO').AsString;
      ComboLocalAmbiente.ItemIndex := QyAmbienteTrabalho.FieldByName('LOCAL_DE_TRABALHO').AsInteger - 1;
      EdtNomeAmbienteTrabalho.Text := QyAmbienteTrabalho.FieldByName('NOME_DO_AMBINETE').AsString;
      MemoDescricaoAmbiente.Text := QyAmbienteTrabalho.FieldByName('DESCRICAO_AMBIENTE').AsString;
      CarregarFatores(StrToInt(EdtCodigo.Text));
      Result := True;
      BitOK.Enabled := true;
      BitExcluir.Enabled := true;
   end
   else
   begin
      if (QyAmbienteTrabalho.IsEmpty)then
         LimparCampos();
   end;
   QyAmbienteTrabalho.Close;
end;

end.
