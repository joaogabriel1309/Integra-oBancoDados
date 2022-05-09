unit TRE009E;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Data.DB, Bde.DBTables, Vcl.Grids, Vcl.DBGrids;

type
  TFTRE009E = class(TForm)
    EdtColaboradorCodigo: TEdit;
    EdtColaboradorNome: TEdit;
    EdtData: TMaskEdit;
    EdtMotivoCodigo: TEdit;
    EdtMotivoDescricao: TEdit;
    BitOK: TBitBtn;
    BitExcluir: TBitBtn;
    BitSair: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    MemoDescricao: TMemo;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    QyDestaqueMes: TQuery;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DSDestaqueMes: TDataSource;
    QYDestaqueMesDbGrid: TQuery;
    BitNovo: TBitBtn;
    procedure BitOKClick(Sender: TObject);
    procedure BitExcluirClick(Sender: TObject);
    procedure EdtColaboradorCodigoExit(Sender: TObject);
    procedure EdtMotivoCodigoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitNovoClick(Sender: TObject);
  private
     procedure LimparCampos();
     function VerificarExistencia(const pCodigo: Integer; const pMotivos: Integer; pData: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE009E: TFTRE009E;

implementation

{$R *.dfm}

uses Aula1, Util, CONEXAO001, TRE200P;

procedure TFTRE009E.BitExcluirClick(Sender: TObject);
begin
   if ((trim(EdtColaboradorCodigo.text)<> '')) then
   begin
      if (Application.MessageBox('Tem Certeza que deseja excluir esse dado?', 'Confirmação', MB_YESNO + MB_ICONINFORMATION) = mrNo) then
         exit;
      CONEXAO.DMConexao.StartTransaction;
      try
         QyDestaqueMes.Close;
         QyDestaqueMes.SQL.Clear;
         QyDestaqueMes.SQL.Add('DELETE FROM TBDESTAQUES_MES WHERE CLIENTE = :CODIGO AND DATA_DESTAQUE = :DATA AND MOTIVOS_DESTAQUE = :MOTIVO');
         QyDestaqueMes.ParamByName('CODIGO').AsInteger := StrToInt(SoNumero(EdtColaboradorCodigo.Text));
         QyDestaqueMes.ParamByName('DATA').AsDate := StrToDate(EdtData.Text);
         QyDestaqueMes.ParamByName('MOTIVO').AsInteger := StrToInt(SoNumero(EdtMotivoCodigo.Text));
         QyDestaqueMes.ExecSQL;
         CONEXAO.DMConexao.Commit;
         Application.MessageBox('Informação excluido com sucesso', 'Dados excluido', MB_OK + MB_ICONINFORMATION);
      finally
         if (CONEXAO.DMConexao.InTransaction) then
         begin
            CONEXAO.DMConexao.Rollback;
            Application.MessageBox('Falha ao excluir o dado', 'Falha', MB_OK+MB_ICONERROR);
         end;
         QyDestaqueMes.Close;
         LimparCampos();
      end;
   end
   else
     Application.MessageBox('Por Favor, Insira todas as informações', 'Campos Vazios', MB_OK+MB_ICONWARNING);
end;

procedure TFTRE009E.BitNovoClick(Sender: TObject);
begin
   LimparCampos();
end;

procedure TFTRE009E.BitOKClick(Sender: TObject);
begin
   if ((trim(EdtColaboradorCodigo.text)<> '')
      and (trim(EdtMotivoCodigo.text)<>'')
      and (SoNumero(EdtData.Text) <> '')) then
   begin
      CONEXAO.DMConexao.StartTransaction;
      try
         QyDestaqueMes.Close;
         QyDestaqueMes.SQL.Clear;
         QyDestaqueMes.SQL.Add('INSERT INTO TBDESTAQUES_MES(CLIENTE, MOTIVOS_DESTAQUE, DATA_DESTAQUE, OBSERVACAO) VALUES (:CLIENTE, :MOTIVOS_DESTAQUE, :DATA_DESTAQUE, :OBSERVACAO)');
         QyDestaqueMes.ParamByName('CLIENTE').AsInteger := StrToInt(SoNumero(Trim(EdtColaboradorCodigo.Text)));
         QyDestaqueMes.ParamByName('MOTIVOS_DESTAQUE').AsInteger := StrToInt(SoNumero(Trim(EdtMotivoCodigo.Text)));
         QyDestaqueMes.ParamByName('DATA_DESTAQUE').AsDate := StrToDate(EdtData.Text);
         QyDestaqueMes.ParamByName('OBSERVACAO').AsString := (UpperCase(MemoDescricao.Text));
         QyDestaqueMes.ExecSQL;
         CONEXAO.DMConexao.Commit;
         Application.MessageBox('Informação gravada com sucesso', 'Dados Gravados', MB_OK + MB_ICONINFORMATION);
      finally
         if (CONEXAO.DMConexao.InTransaction) then
         begin
            CONEXAO.DMConexao.Rollback;
            Application.MessageBox('Falha ao gravar a informação', 'Falha ao gravar', MB_OK + MB_ICONERROR);
         end;
         QyDestaqueMes.Close;
         LimparCampos();
      end;
   end
   else
      Application.MessageBox('Por Favor, Insira todas as informações', 'Campos Vazios', MB_OK+MB_ICONWARNING);
end;

procedure TFTRE009E.EdtColaboradorCodigoExit(Sender: TObject);
begin
   if (trim(EdtColaboradorCodigo.Text) <> '') then
   begin
      QyDestaqueMes.Close;
      QyDestaqueMes.SQL.Clear;
      QyDestaqueMes.SQL.Add('SELECT CODIGO,NOME FROM TBCLIENTE WHERE CODIGO = :CODIGO');
      QyDestaqueMes.ParamByName('CODIGO').AsInteger := StrToInt(SoNumero(EdtColaboradorCodigo.Text));
      QyDestaqueMes.Open;
      if not(QyDestaqueMes.IsEmpty) then
      begin
         EdtColaboradorNome.Text := QyDestaqueMes.FieldByName('NOME').AsString;
         BitOK.Enabled := true;
      end
      else
      begin
         Application.MessageBox('Colaborador não encontrado', 'Não Encontrado', MB_OK + MB_ICONWARNING);
         EdtColaboradorCodigo.Clear;
         EdtColaboradorCodigo.SetFocus;
      end;
      QYDestaqueMesDbGrid.Close;
      QYDestaqueMesDbGrid.SQL.Clear;
      QYDestaqueMesDbGrid.SQL.Add('SELECT TOP 5 TBCLIENTE.NOME, TBMOTIVOSDESTAQUES.DESCRICAO, TBDESTAQUES_MES.OBSERVACAO, TBDESTAQUES_MES.DATA_DESTAQUE');
      QYDestaqueMesDbGrid.SQL.Add('FROM TBDESTAQUES_MES');
      QYDestaqueMesDbGrid.SQL.Add('JOIN TBCLIENTE ON');
      QYDestaqueMesDbGrid.SQL.Add('(TBCLIENTE.CODIGO = TBDESTAQUES_MES.CLIENTE)');
      QYDestaqueMesDbGrid.SQL.Add('JOIN TBMOTIVOSDESTAQUES ON');
      QYDestaqueMesDbGrid.SQL.Add('(TBMOTIVOSDESTAQUES.CODIGO = TBDESTAQUES_MES.MOTIVOS_DESTAQUE)');
      QYDestaqueMesDbGrid.SQL.Add('WHERE CLIENTE = :CLIENTE');
      QYDestaqueMesDbGrid.SQL.Add('ORDER BY TBDESTAQUES_MES.DATA_DESTAQUE DESC');
      QYDestaqueMesDbGrid.ParamByName('CLIENTE').AsInteger := StrToInt(SoNumero(EdtColaboradorCodigo.Text));
      QYDestaqueMesDbGrid.Open;
      BitNovo.Enabled := true;
   end;
end;

procedure TFTRE009E.EdtMotivoCodigoExit(Sender: TObject);
begin
   if (Trim(EdtMotivoCodigo.Text) <> '') then
   begin
      QyDestaqueMes.Close;
      QyDestaqueMes.SQL.Clear;
      QyDestaqueMes.SQL.Add('SELECT CODIGO,DESCRICAO FROM TBMOTIVOSDESTAQUES WHERE CODIGO = :CODIGO');
      QyDestaqueMes.ParamByName('CODIGO').AsInteger := StrToInt(SoNumero(EdtMotivoCodigo.Text));
      QyDestaqueMes.Open;
      if not(QyDestaqueMes.IsEmpty) then
         EdtMotivoDescricao.Text := QyDestaqueMes.FieldByName('DESCRICAO').AsString
      else
      begin
         Application.MessageBox('Motivo não encontrado', 'Não Encontrado', MB_OK + MB_ICONWARNING);
         EdtMotivoCodigo.Clear;
         EdtMotivoCodigo.SetFocus;
      end;
      if ((SoNumero(EdtColaboradorCodigo.Text) <> '') and (SoNumero(EdtMotivoCodigo.Text) <> '') and (SoNumero(EdtData.Text) <> '')) then
      begin
         if (VerificarExistencia(StrToInt(SoNumero(EdtColaboradorCodigo.Text)),StrToInt(SoNumero(EdtMotivoCodigo.Text)),(EdtData.Text))) then
         begin
            Application.MessageBox('O colaborador já esta cadastrado com este motivo nessa data', 'Registardo', MB_OK + MB_ICONWARNING);
            BitExcluir.Enabled := true;
            BitOK.Enabled := false;
         end
      end;
   end;
end;

procedure TFTRE009E.LimparCampos;
begin
   EdtColaboradorCodigo.Clear;
   EdtColaboradorNome.Clear;
   EdtData.Clear;
   EdtMotivoCodigo.Clear;
   EdtMotivoDescricao.Clear;
   MemoDescricao.Clear;
   BitOK.Enabled:= false;
   BitExcluir.Enabled:= false;
   QYDestaqueMesDbGrid.Close;
   BitOK.Enabled := false;
   BitNovo.Enabled := false;
   BitExcluir.Enabled := false;
end;

procedure TFTRE009E.SpeedButton1Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqCliente;
   EdtColaboradorCodigo.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtColaboradorCodigo.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

procedure TFTRE009E.SpeedButton2Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqMotivos;
   EdtMotivoCodigo.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtMotivoCodigo.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

function TFTRE009E.VerificarExistencia(const pCodigo: Integer; const pMotivos: Integer; pData: String): Boolean;
begin
   QyDestaqueMes.Close;
   QyDestaqueMes.SQL.Clear;
   QyDestaqueMes.SQL.Add('SELECT CLIENTE, MOTIVOS_DESTAQUE, DATA_DESTAQUE, OBSERVACAO FROM TBDESTAQUES_MES WHERE CLIENTE = :CODIGO AND MOTIVOS_DESTAQUE = :MOTIVOS AND DATA_DESTAQUE = :DATA');
   QyDestaqueMes.ParamByName('CODIGO').AsInteger := pCodigo;
   QyDestaqueMes.ParamByName('MOTIVOS').AsInteger := pMotivos;
   QyDestaqueMes.ParamByName('DATA').AsDate := StrToDate(pData);
   QyDestaqueMes.Open;
   if not(QyDestaqueMes.IsEmpty) then
   begin
      EdtData.Text := QyDestaqueMes.FieldByName('DATA_DESTAQUE').AsString;
      MemoDescricao.Text := QyDestaqueMes.FieldByName('OBSERVACAO').AsString;
   end;
   Result := not(QyDestaqueMes.IsEmpty);
   QyDestaqueMes.Close;
end;

end.
