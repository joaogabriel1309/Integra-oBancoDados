unit TRE006C;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  Data.DB, Bde.DBTables;

type
  TFTRE006C = class(TForm)
    ComboInscricao: TComboBox;
    EdtNumeroIncricao: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtRazaoSocial: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EdtCpfResponsavel: TMaskEdit;
    Label6: TLabel;
    EdtResponsavelInf: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    EdtDataNascimento: TMaskEdit;
    EdtCpf: TMaskEdit;
    EdtEndereco: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EdtComplemento: TEdit;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    ComboUF: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    EdtCep: TMaskEdit;
    EdtTelefone: TMaskEdit;
    Label16: TLabel;
    Label17: TLabel;
    EdtFAX: TMaskEdit;
    EdtCelular: TMaskEdit;
    Label18: TLabel;
    EdtCodigoMunicipio: TEdit;
    BitOK: TBitBtn;
    BitSair: TBitBtn;
    Label19: TLabel;
    EdtEmail: TEdit;
    QyResponsavel: TQuery;
    Label20: TLabel;
    EdtNumeroEndereco: TEdit;
    BitLimpar: TBitBtn;
    BitExcluir: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure BitSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitOKClick(Sender: TObject);
    procedure BitLimparClick(Sender: TObject);
    procedure ComboInscricaoExit(Sender: TObject);
    procedure BitExcluirClick(Sender: TObject);
    procedure EdtNumeroIncricaoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdtCpfResponsavelExit(Sender: TObject);
  private
    procedure Gravar();
    procedure LimparCampos();
    Function ExisteResponsavel(Const RcbCodigo: String; CarregarDados: Boolean): Boolean;
    procedure ExcluirDados();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE006C: TFTRE006C;

implementation

{$R *.dfm}

uses Util, CONEXAO001, TRE200P;

procedure TFTRE006C.BitExcluirClick(Sender: TObject);
begin
   if (Application.MessageBox('Tem certeza que deseja excluir esses dados?', 'Excluir Dados',  MB_YESNO + MB_ICONINFORMATION) = mrYes) then
      ExcluirDados();
end;

procedure TFTRE006C.BitLimparClick(Sender: TObject);
begin
   LimparCampos();
end;

procedure TFTRE006C.BitOKClick(Sender: TObject);
begin
   if ((EdtNumeroIncricao.Text <> '')
        and (EdtRazaoSocial.Text <> '')
        and (EdtCpfResponsavel.Text <> '')
        and (EdtResponsavelInf.Text <> '')
        and (EdtDataNascimento.Text <> '')
        and (EdtCpf.Text <> '')
        and (EdtEndereco.Text <> '')
        and (EdtNumeroEndereco.Text <> '')
        and (EdtBairro.Text <> '')
        and (EdtCep.Text <> '')
        and (EdtCidade.Text <> '')
        and (EdtEmail.Text <> '')
        and (EdtCelular.Text <> '')) then
      Gravar()
   else
      Application.MessageBox('Por Favor, Insira todas as informações', 'Campo obrigatorio Vazio', MB_OK + MB_ICONWARNING);
end;

procedure TFTRE006C.BitSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFTRE006C.ComboInscricaoExit(Sender: TObject);
begin
   EdtNumeroIncricao.Clear;
   if (ComboInscricao.ItemIndex = 0) then
      EdtNumeroIncricao.EditMask := '99.999.999/9999-99;0;_';
   if (ComboInscricao.ItemIndex = 1) then
      EdtNumeroIncricao.EditMask := '99-999-99.999-9/9;0;_';
   if (ComboInscricao.ItemIndex = 2) then
      EdtNumeroIncricao.EditMask := '999.999.999-99;0;_';
   if (ComboInscricao.ItemIndex = 3) then
      EdtNumeroIncricao.EditMask := '999.999.999/999-99;0;_';
end;

procedure TFTRE006C.EdtCpfResponsavelExit(Sender: TObject);
begin
   if not (VerificarCPF(SoNumero(TMaskEdit(Sender).Text))) then
   begin
      Application.MessageBox('CPF Inválido, por favor insira um CPF valido!', 'CPF Inválido', MB_OK + MB_ICONERROR);
      TMaskEdit(Sender).Clear;
   end;
end;

procedure TFTRE006C.EdtNumeroIncricaoExit(Sender: TObject);
begin
   BitOK.Enabled := False;
   if (SoNumero(EdtNumeroIncricao.Text) <> '')then
   begin
      BitExcluir.Enabled := ExisteResponsavel(SoNumero(EdtNumeroIncricao.Text), True);
      case ComboInscricao.ItemIndex of
         0:
         begin
            if (VerificaarCNPJ(SoNumero(EdtNumeroIncricao.Text)) = False) then
            begin
               BitLimpar.Enabled := False;
               Application.MessageBox('CNPJ Inválido, por favor insira um CNPJ valido', 'CNPJ Inválido', MB_OK + MB_ICONERROR);
               EdtNumeroIncricao.Clear;
               exit;
            end;
         end;
         2: EdtCpfResponsavelExit(EdtNumeroIncricao);
      end;
      BitOK.Enabled := True;
    end;
end;

procedure TFTRE006C.ExcluirDados;
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      QyResponsavel.Close;
      QyResponsavel.SQL.Clear;
      QyResponsavel.SQL.Add('DELETE FROM TBRESPONSAVEL WHERE INSCRICAO = :CODIGO');
      QyResponsavel.ParamByName('CODIGO').AsString := SoNumero(EdtNumeroIncricao.Text);
      QyResponsavel.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Dados excluido com sucesso', 'Dados Excluidos', MB_OK+MB_ICONINFORMATION);
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao excluir as informações', 'ERRO', MB_OK + MB_ICONERROR);
      end;
      LimparCampos();
   end;
end;

function TFTRE006C.ExisteResponsavel(const RcbCodigo: String; CarregarDados: Boolean): Boolean;
begin
    QyResponsavel.Close;
    QyResponsavel.SQL.Clear;
    QyResponsavel.SQL.Add('SELECT INSCRICAO,RAZAO_SOCIAL,CPF_RESPONSAVEL,RESPONSAVEL_INFORMACAO,DATA_NASCIMENTO,CPF_INFORMACAO,ENDERECO,NUMERO_ENDERECO,COMPLEMENTO,BAIRRO,CEP,CODIGO_MUNICIPIO,CIDADE,UF,EMAIL,TELEFONE,FAX,CELULAR FROM TBRESPONSAVEL WHERE INSCRICAO = :CODIGO');
    QyResponsavel.ParamByName('CODIGO').AsString := RcbCodigo;
    QyResponsavel.Open;
    if (not(QyResponsavel.IsEmpty) and (CarregarDados)) then
    begin
       EdtComplemento.TextHint:='';
       EdtCodigoMunicipio.TextHint:='';
       EdtRazaoSocial.Text := QyResponsavel.FieldByName('RAZAO_SOCIAL').AsString;
       EdtCpfResponsavel.Text := QyResponsavel.FieldByName('CPF_RESPONSAVEL').AsString;
       EdtResponsavelInf.Text := QyResponsavel.FieldByName('RESPONSAVEL_INFORMACAO').AsString;
       EdtDataNascimento.Text := QyResponsavel.FieldByName('DATA_NASCIMENTO').AsString;
       EdtCpf.Text := QyResponsavel.FieldByName('CPF_INFORMACAO').AsString;
       EdtEndereco.Text := QyResponsavel.FieldByName('ENDERECO').AsString;
       EdtNumeroEndereco.Text := QyResponsavel.FieldByName('NUMERO_ENDERECO').AsString;
       EdtComplemento.Text := QyResponsavel.FieldByName('COMPLEMENTO').AsString;
       EdtBairro.Text := QyResponsavel.FieldByName('BAIRRO').AsString;
       EdtCep.Text := QyResponsavel.FieldByName('CEP').AsString;
       EdtCodigoMunicipio.Text := QyResponsavel.FieldByName('CODIGO_MUNICIPIO').AsString;
       EdtCidade.Text := QyResponsavel.FieldByName('CIDADE').AsString;
       ComboUF.ItemIndex := ComboUF.Items.IndexOf(QyResponsavel.FieldByName('UF').AsString);
       EdtTelefone.Text := QyResponsavel.FieldByName('TELEFONE').AsString;
       EdtFAX.Text := QyResponsavel.FieldByName('FAX').AsString;
       EdtCelular.Text := QyResponsavel.FieldByName('CELULAR').AsString;
       EdtEmail.Text := QyResponsavel.FieldByName('EMAIL').AsString;
       BitLimpar.Enabled := true;
    end;
    Result := not(QyResponsavel.IsEmpty);
    QyResponsavel.Close;
    BitLimpar.Enabled := true;
end;

procedure TFTRE006C.FormShow(Sender: TObject);
begin
   QyResponsavel.Close;
   QyResponsavel.SQL.Clear;
   QyResponsavel.SQL.Add('SELECT UF FROM TBESTADO ORDER BY UF');
   QyResponsavel.Open;
   while not(QyResponsavel.Eof) do
   begin
      ComboUF.Items.Add(QyResponsavel.FieldByName('UF').AsString);
      QyResponsavel.Next;
   end;
   QyResponsavel.Close;
   QyResponsavel.SQL.Clear;
   QyResponsavel.SQL.Add('SELECT CODIGO||'' - ''||DESCRICAO AS INSCRICAO FROM TBTIPOINSCRICAO');
   QyResponsavel.Open;
   while not(QyResponsavel.Eof) do
   begin
      ComboInscricao.Items.Add(QyResponsavel.FieldByName('INSCRICAO').AsString);
      QyResponsavel.Next;
   end;
   QyResponsavel.Close;
   ComboInscricao.ItemIndex := 0;
   ComboUF.ItemIndex := 0;
end;

procedure TFTRE006C.Gravar;
var VerificarExistencia: Boolean;
begin
   try
      VerificarExistencia := ExisteResponsavel(SoNumero(EdtNumeroIncricao.Text), False);
      if (VerificarExistencia) then
      begin
         if (Application.MessageBox('O código digitado ja exite na tabela, tem certeza que deseja altera-lo?', 'Alterar dados', MB_YESNO + MB_ICONINFORMATION) = mrNo) then
           exit
      end;
      CONEXAO.DMConexao.StartTransaction;
      QyResponsavel.Close;
      QyResponsavel.SQL.Clear;
      if (VerificarExistencia) then
      begin
         QyResponsavel.SQL.Add('UPDATE TBRESPONSAVEL SET TIPO_INSCRICAO = :TIPO_INSCRICAO, RAZAO_SOCIAL = :RAZAO_SOCIAL, CPF_RESPONSAVEL = :CPF_RESPONSAVEL, RESPONSAVEL_INFORMACAO = :RESPONSAVEL_INFORMACAO, DATA_NASCIMENTO = :DATA_NASCIMENTO,');
         QyResponsavel.SQL.Add('CPF_INFORMACAO = :CPF_INFORMACAO, ENDERECO = :ENDERECO, NUMERO_ENDERECO = :NUMERO_ENDERECO, COMPLEMENTO = :COMPLEMENTO, BAIRRO = :BAIRRO, CEP = :CEP, CODIGO_MUNICIPIO = :CODIGO_MUNICIPIO, CIDADE = :CIDADE, UF = :UF, EMAIL = :EMAIL,');
         QyResponsavel.SQL.Add('TELEFONE = :TELEFONE, FAX = :FAX, CELULAR = :CELULAR WHERE INSCRICAO = :INSCRICAO');
      end
      else
      begin
         QyResponsavel.SQL.Add('INSERT INTO TBRESPONSAVEL(TIPO_INSCRICAO, INSCRICAO, RAZAO_SOCIAL, CPF_RESPONSAVEL, RESPONSAVEL_INFORMACAO, DATA_NASCIMENTO, CPF_INFORMACAO, ENDERECO, NUMERO_ENDERECO, COMPLEMENTO, BAIRRO, CEP, ');
         QyResponsavel.SQL.Add('CODIGO_MUNICIPIO, CIDADE, UF, EMAIL, TELEFONE, FAX, CELULAR) VALUES ');
         QyResponsavel.SQL.Add('(:TIPO_INSCRICAO,:INSCRICAO,:RAZAO_SOCIAL,:CPF_RESPONSAVEL,:RESPONSAVEL_INFORMACAO,:DATA_NASCIMENTO,:CPF_INFORMACAO,:ENDERECO, :NUMERO_ENDERECO,:COMPLEMENTO, :BAIRRO, :CEP, :CODIGO_MUNICIPIO, :CIDADE, :UF, :EMAIL, :TELEFONE, :FAX, :CELULAR)');
      end;
      QyResponsavel.ParamByName('TIPO_INSCRICAO').AsInteger := StrToIntDef(SoNumero(ComboInscricao.Text),0);
      QyResponsavel.ParamByName('INSCRICAO').AsString := SoNumero(EdtNumeroIncricao.Text);
      QyResponsavel.ParamByName('RAZAO_SOCIAL').AsString := SoLetras(UpperCase(EdtRazaoSocial.Text));
      QyResponsavel.ParamByName('CPF_RESPONSAVEL').AsString := SoNumero(EdtCpfResponsavel.Text);
      QyResponsavel.ParamByName('RESPONSAVEL_INFORMACAO').AsString := SoLetras(UpperCase(EdtResponsavelInf.Text));
      QyResponsavel.ParamByName('DATA_NASCIMENTO').AsDate :=  StrToDate(EdtDataNascimento.Text);
      QyResponsavel.ParamByName('CPF_INFORMACAO').AsString := SoNumero(EdtCpf.Text);
      QyResponsavel.ParamByName('ENDERECO').AsString := SoLetras(UpperCase(EdtEndereco.Text));
      QyResponsavel.ParamByName('NUMERO_ENDERECO').AsInteger := StrToIntDef(EdtNumeroEndereco.Text,0);
      QyResponsavel.ParamByName('COMPLEMENTO').AsString := SoLetras(UpperCase(EdtComplemento.Text));
      QyResponsavel.ParamByName('BAIRRO').AsString := SoLetras(UpperCase(EdtBairro.Text));
      QyResponsavel.ParamByName('CEP').AsInteger := StrToIntDef(soNumero(EdtCep.Text),0);
      QyResponsavel.ParamByName('CODIGO_MUNICIPIO').AsInteger := StrToIntDef(EdtCodigoMunicipio.Text,0);
      QyResponsavel.ParamByName('CIDADE').AsString := SoLetras(UpperCase(EdtCidade.Text));
      QyResponsavel.ParamByName('UF').AsString := UpperCase(ComboUF.Text);
      QyResponsavel.ParamByName('EMAIL').AsString := trim(EdtEmail.Text);
      QyResponsavel.ParamByName('TELEFONE').AsString := SoNumero(EdtTelefone.Text);
      QyResponsavel.ParamByName('FAX').AsString := SoNumero(EdtFAX.Text);
      QyResponsavel.ParamByName('CELULAR').AsString := SoNumero(EdtCelular.Text);
      QyResponsavel.ExecSQL;
      CONEXAO.DMConexao.Commit;
      Application.MessageBox('Informações gravadas com sucesso', 'Gravadas', MB_OK + MB_ICONINFORMATION);
      LimparCampos();
   finally
      if (CONEXAO.DMConexao.InTransaction) then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao gravar informações', 'ERRO', MB_OK + MB_ICONERROR);
      end;
      QyResponsavel.Close;
   end;
end;

procedure TFTRE006C.LimparCampos;
begin
   ComboInscricao.ItemIndex := 0;
   EdtNumeroIncricao.Clear;
   EdtRazaoSocial.Clear;
   EdtCpfResponsavel.Clear;
   EdtResponsavelInf.Clear;
   EdtDataNascimento.Clear;
   EdtCpf.Clear;
   EdtEndereco.Clear;
   EdtNumeroEndereco.Clear;
   EdtComplemento.Clear;
   EdtBairro.Clear;
   EdtCep.Clear;
   EdtCodigoMunicipio.Clear;
   EdtCidade.Clear;
   ComboUF.ItemIndex := 0;
   EdtEmail.Clear;
   EdtTelefone.Clear;
   EdtFAX.Clear;
   EdtCelular.Clear;
   BitOK.Enabled := false;
   BitExcluir.Enabled := false;
   BitLimpar.Enabled := false;
   ComboInscricao.SetFocus;
   EdtComplemento.TextHint := 'Informação Opcional';
   EdtCodigoMunicipio.TextHint := 'Informação Opcional';
end;

procedure TFTRE006C.SpeedButton1Click(Sender: TObject);
begin
   LimparCampos();
   FTRE200P.TipoPesquisa := tpPesqResponsavel;
   ComboInscricao.SetFocus;
   if (FTRE200P.ShowModal = mrOk) then
   begin
      ComboInscricao.ItemIndex := FTRE200P.RetornoInscricao - 1;
      EdtNumeroIncricao.SetFocus;
      EdtNumeroIncricao.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

procedure TFTRE006C.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if (Assigned(FTRE006C)) then
      FreeAndNil(FTRE006C);
end;

end.
