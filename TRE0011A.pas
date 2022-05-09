unit TRE0011A;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Bde.DBTables, Datasnap.DBClient,
  Datasnap.Provider, DateUtils;

type
  TFTRE011A = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EdtCodigo: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    EdtNome: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtHorarioInicio: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdtAgendamento: TEdit;
    Label7: TLabel;
    CheckCusto: TCheckBox;
    EdtValor: TEdit;
    LBLValor: TLabel;
    MemoObservacao: TMemo;
    Label9: TLabel;
    Panel2: TPanel;
    Label10: TLabel;
    DBGrid1: TDBGrid;
    BitSalvar: TBitBtn;
    BitNovo: TBitBtn;
    BitRemover: TBitBtn;
    SpeedButton2: TSpeedButton;
    EdtFinal: TMaskEdit;
    QyAgenda: TQuery;
    DSAgenda: TDataSource;
    Panel3: TPanel;
    SpeedAdcicionar: TSpeedButton;
    SpeedRemover: TSpeedButton;
    CDSAgenda: TClientDataSet;
    CDSAgendaDATA_AGENDAMENTO: TDateField;
    CDSAgendaHORARIO_INICIO: TStringField;
    CDSAgendaHORARIO_FINAL: TStringField;
    CDSAgendaVALOR: TFloatField;
    CDSAgendaOBSERVACAO: TStringField;
    DataSetProvider1: TDataSetProvider;
    CDSAgendaNOME: TStringField;
    CDSAgendaTIPO_AGENDAMENTO: TStringField;
    EdtData: TMaskEdit;
    procedure CheckCustoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdtCodigoExit(Sender: TObject);
    procedure BitNovoClick(Sender: TObject);
    procedure SpeedAdcicionarClick(Sender: TObject);
    procedure EdtFinalExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitSalvarClick(Sender: TObject);
    procedure SpeedRemoverClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure LimparCampos(FLimparDbGrid: Boolean);
    procedure Gravar();
    function  VerificaQuantidadeDeAgendamento(DataAgendamentoUm: String; DataAgendamentoDois: String): Boolean;
//    procedure Excluir();
    { Private declarations }
  public
    { Public declarations }
  end;

  var
  FTRE011A: TFTRE011A;
  TempoAgendado,TempoLimite: TTime;
  Contadora: Integer;
  MaiorData: TDateTime;

implementation

{$R *.dfm}

uses TRE012A, TRE200P, CONEXAO001, Util;

procedure TFTRE011A.BitNovoClick(Sender: TObject);
begin
   LimparCampos(true);
   EdtData.SetFocus;
   BitSalvar.Enabled := false;
   EdtNome.Clear;
   EdtCodigo.Clear;
   EdtCodigo.SetFocus;
   QyAgenda.Close;
   Contadora:= 0;
end;

procedure TFTRE011A.BitSalvarClick(Sender: TObject);
begin
   if (SoNumero(EdtCodigo.Text) <> '') and (not(CDSAgenda.IsEmpty)) then
   begin
      Gravar();
      LimparCampos(True);
      BitSalvar.Enabled := false;
      Contadora:= 0;
   end
   else
      Application.MessageBox('Por favor, insira todas informações','Campo(s) vazio(s)', MB_OK+MB_ICONWARNING);
end;

procedure TFTRE011A.CheckCustoClick(Sender: TObject);
begin
   if (CheckCusto.Checked = true) then
   begin
      LBLValor.Enabled := true;
      EdtValor.Enabled := true;
   end
   else
   begin
      LBLValor.Enabled := false;
      EdtValor.Enabled := false;
   end;
end;

procedure TFTRE011A.DBGrid1DblClick(Sender: TObject);
begin
   SpeedRemover.Enabled := true;
   EdtNome.Text := DBGrid1.Fields[0].Value;
   EdtData.Text := DBGrid1.Fields[1].Value;
   EdtHorarioInicio.Text := DBGrid1.Fields[3].Value;
   EdtFinal.Text := DBGrid1.Fields[4].Value;
   EdtAgendamento.Text := DBGrid1.Fields[2].Value;
   if not(VarIsNull(DBGrid1.Fields[5].Value)) then
   begin
      CheckCusto.Checked := true;
      EdtValor.Text := DBGrid1.Fields[5].Value;
   end
   else
      CheckCusto.Checked := false;
   MemoObservacao.Text := DBGrid1.Fields[6].Value;
end;

procedure TFTRE011A.EdtCodigoExit(Sender: TObject);
var teste: String;
begin
   if (SoNumero(EdtCodigo.Text) <> '') then
   begin
      QyAgenda.Close;
      QyAgenda.SQL.Clear;
      QyAgenda.SQL.Add('SELECT NOME FROM TBCLIENTE WHERE CODIGO = :CODIGO');
      QyAgenda.ParamByName('CODIGO').AsInteger := StrToInt(EdtCodigo.Text);
      QyAgenda.open;
      if (not(QyAgenda.IsEmpty)) then
      begin
         EdtNome.Text := QyAgenda.FieldByName('NOME').AsString;
         BitNovo.Enabled := true;
         if (DSAgenda.DataSet <> QyAgenda) then
            DSAgenda.DataSet := QyAgenda;
         QyAgenda.Close;
         QyAgenda.SQL.Clear;
         QyAgenda.SQL.Add('SELECT TOP 5 TBAGENDAMENTOS.DATA_AGENDAMENTO, TBCLIENTE.NOME, TBAGENDAMENTOS.TIPO_AGENDAMENTO, TBAGENDAMENTOS.HORARIO_INICIO, TBAGENDAMENTOS.HORARIO_FINAL, TBAGENDAMENTOS.VALOR, TBAGENDAMENTOS.OBSERVACAO');
         QyAgenda.SQL.Add('FROM TBCLIENTE');
         QyAgenda.SQL.Add('JOIN TBAGENDAMENTOS ON');
         QyAgenda.SQL.Add('(TBAGENDAMENTOS.CLIENTE = TBCLIENTE.CODIGO)');
         QyAgenda.SQL.Add('WHERE TBAGENDAMENTOS.CLIENTE = :CODIGO');
         QyAgenda.SQL.Add('ORDER BY TBAGENDAMENTOS.DATA_AGENDAMENTO DESC');
         QyAgenda.ParamByName('CODIGO').AsInteger := StrToInt(EdtCodigo.Text);
         QyAgenda.Open;
      end
      else
      begin
         Application.MessageBox('Cliente não cadastrado em nosso banco de dados', 'Codigo Invalido', MB_OK + MB_ICONINFORMATION);
         EdtCodigo.Clear;
         EdtNome.Clear;
     end;
   end;
end;

procedure TFTRE011A.EdtFinalExit(Sender: TObject);
begin
   if ((SoNumero(EdtHorarioInicio.Text) <> '') and (SoNumero(EdtFinal.Text) <> '')) then
   begin
      if (StrToTime(EdtHorarioInicio.Text) < StrToTime(EdtFinal.Text)) then
      begin
         TempoAgendado := StrToTime(EdtHorarioInicio.Text) - StrToTime(EdtFinal.Text);
         if (TimeToStr(TempoAgendado) > '02:30:00') then
         begin
            Application.MessageBox('O agendamento não pode utrapassar o limite de 2:30 horas por sessão', 'Hoario Inválido', MB_OK+MB_ICONWARNING);
            EdtFinal.Clear;
         end
      end
      else
      begin
         Application.MessageBox('Horario inválido, hora final maior que hora inicial','Campo(s) Inválidos', MB_OK+MB_ICONWARNING);
         EdtFinal.Clear;
      end;
   end;
end;

procedure TFTRE011A.FormShow(Sender: TObject);
begin
   Contadora := 0;
end;

procedure TFTRE011A.Gravar;
begin
   CONEXAO.DMConexao.StartTransaction;
   try
      QyAgenda.close;
      QyAgenda.SQL.Clear;
      QyAgenda.SQL.Add('INSERT INTO TBAGENDAMENTOS (DATA_AGENDAMENTO, CLIENTE, TIPO_AGENDAMENTO, HORARIO_INICIO, HORARIO_FINAL, VALOR, OBSERVACAO) VALUES (:DATA_AGENDAMANTO, :CLIENTE, :TIPO_AGENDAMENTO, :HORARIO_INICIO, :HORARIO_FINAL, :VALOR, :OBSERVACAO)');
      CDSAgenda.First;
      while not(CDSAgenda.Eof) do
      begin
         QyAgenda.ParamByName('DATA_AGENDAMANTO').AsDate := CDSAgenda.FieldByName('DATA_AGENDAMENTO').AsDateTime;
         QyAgenda.ParamByName('CLIENTE').AsInteger := StrToInt(SoNumero(EdtCodigo.Text));
         QyAgenda.ParamByName('TIPO_AGENDAMENTO').AsString := CDSAgenda.FieldByName('TIPO_AGENDAMENTO').AsString;
         QyAgenda.ParamByName('HORARIO_INICIO').AsString := CDSAgenda.FieldByName('HORARIO_INICIO').AsString;
         QyAgenda.ParamByName('HORARIO_FINAL').AsString := CDSAgenda.FieldByName('HORARIO_FINAL').AsString;
         QyAgenda.ParamByName('VALOR').AsFloat := CDSAgenda.FieldByName('VALOR').AsFloat;
         QyAgenda.ParamByName('OBSERVACAO').AsString := CDSAgenda.FieldByName('OBSERVACAO').AsString;
         QyAgenda.ExecSQL;
         CDSAgenda.Next;
      end;
      QyAgenda.Close;
      Application.MessageBox('Dados Gravados com sucesso', 'Dados Gravados', MB_OK+MB_ICONINFORMATION);
      CONEXAO.DMConexao.Commit;
      EdtCodigo.Clear;
      EdtNome.Clear;
      CDSAgenda.Close;
   finally
      if CONEXAO.DMConexao.InTransaction then
      begin
         CONEXAO.DMConexao.Rollback;
         Application.MessageBox('Falha ao gravar os dados','Falha', MB_OK+MB_ICONERROR);
      end;
   end;
end;

procedure TFTRE011A.LimparCampos(FLimparDbGrid: Boolean);
begin
   EdtData.Clear;
   EdtHorarioInicio.Clear;
   EdtFinal.Clear;
   EdtAgendamento.Clear;
   EdtValor.Clear;
   CheckCusto.Checked := false;
   MemoObservacao.Clear;
   BitNovo.Enabled := false;
   if (FLimparDbGrid) then
   begin
      while not(CDSAgenda.Eof) do
         CDSAgenda.Delete;
   end;
end;

procedure TFTRE011A.SpeedButton1Click(Sender: TObject);
begin
   FTRE200P.TipoPesquisa := tpPesqCliente;
   EdtCodigo.SetFocus;
   if FTRE200P.ShowModal = mrOk then
   begin
      EdtCodigo.Text := FTRE200P.Retorno;
      SelectNext(ActiveControl,true,true);
   end;
end;

procedure TFTRE011A.SpeedButton2Click(Sender: TObject);
begin
   if not (Assigned(FTRE012A)) then
      FTRE012A := FTRE012A.Create(self);
   FTRE012A.ShowModal
end;

procedure TFTRE011A.SpeedAdcicionarClick(Sender: TObject);
var Data,SemanaDoMesUm, SemanaDoMesDois: Integer;
begin
   if ((SoNumero(EdtCodigo.Text) <> '')
    and (SoNumero(EdtData.Text) <> '')
    and (Trim(EdtAgendamento.Text) <> '')
    and (SoNumero(EdtHorarioInicio.Text) <> '')
    and (SoNumero(EdtFinal.Text) <> '')) then
   begin
   if (DSAgenda.DataSet <> CDSAgenda) then
   begin
      DSAgenda.DataSet := CDSAgenda;
      CDSAgenda.CreateDataSet;
   end;
      if (Contadora >= 2) then
      begin
         SemanaDoMesUm := (StrToInt(FormatDateTime('dd',MaiorData)) - 1) div 7 + 1;
         SemanaDoMesDois := (StrToInt(FormatDateTime('dd',StrToDate(EdtData.Text))) - 1) div 7 + 1;
         //Data:= DaysBetween(MaiorData, StrToDate(EdtData.Text));
         if (SemanaDoMesUm = SemanaDoMesDois) then
         begin
            Application.MessageBox('Não é possível ter mais que dois registros de um mesmo cliente na semana','Limite de registro', MB_OK+ MB_ICONWARNING);
            LimparCampos(false);
            exit;
         end;
      end;
      if (MaiorData < StrToDate(EdtData.Text)) then
         MaiorData := StrToDate(EdtData.Text);
      CDSAgenda.Append;
      CDSAgenda.FieldByName('DATA_AGENDAMENTO').AsDateTime := StrToDate(EdtData.Text);
      CDSAgenda.FieldByName('NOME').AsString := EdtNome.Text;
      CDSAgenda.FieldByName('HORARIO_INICIO').AsString := EdtHorarioInicio.Text;
      CDSAgenda.FieldByName('HORARIO_FINAL').AsString := EdtFinal.Text;
      CDSAgenda.FieldByName('TIPO_AGENDAMENTO').AsString := EdtAgendamento.Text;
      if (CheckCusto.Checked = true) then
         CDSAgenda.FieldByName('VALOR').AsString := EdtValor.Text;
      CDSAgenda.FieldByName('OBSERVACAO').AsString := MemoObservacao.Text;
      CDSAgenda.Post;
      BitSalvar.Enabled := true;
      LimparCampos(false);
      EdtData.SetFocus;
      Contadora := Contadora + 1;
   end
   else
      Application.MessageBox('Por Favor insira todos os dados','Campo(s) Vazios', MB_OK+MB_ICONWARNING);
   BitNovo.Enabled := true;
end;

procedure TFTRE011A.SpeedRemoverClick(Sender: TObject);
begin
   CDSAgenda.Edit;
   CDSAgenda.Delete;
   LimparCampos(false);
   Contadora := Contadora - 1;
end;

function TFTRE011A.VerificaQuantidadeDeAgendamento(DataAgendamentoUm,
  DataAgendamentoDois: String): Boolean;
begin


end;

end.
