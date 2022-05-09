unit TRE014D;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, Bde.DBTables,StrUtils;

type
  TFTRE014D = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    EdtPesquisa: TEdit;
    BitBtn1: TBitBtn;
    CBEspecifico: TCheckBox;
    EdtMesEsp: TMaskEdit;
    BitConsultar: TBitBtn;
    QyDestaqueMes: TQuery;
    DSDestaqueMes: TDataSource;
    Label1: TLabel;
    procedure CBEspecificoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE014D: TFTRE014D;
  FData: String;

implementation

{$R *.dfm}

uses CONEXAO001, Util;

procedure TFTRE014D.CBEspecificoClick(Sender: TObject);
begin
   if (CBEspecifico.Checked = true) then
   begin
      EdtMesEsp.Visible := true;
      BitConsultar.Visible := true;
   end
   else
   begin
      EdtMesEsp.Visible := false;
      BitConsultar.Visible := false;
   end;

end;

procedure TFTRE014D.FormCreate(Sender: TObject);
var DataFormatada: String;
begin
   EdtMesEsp.Text := FormatDateTime('yyy-mm',now);
end;

procedure TFTRE014D.FormShow(Sender: TObject);
var MesInicial,MesFinal: String;
begin
   MesInicial := EdtMesEsp.Text+'-01';
   case (StrToInt(copy(EdtMesEsp.Text,6))) of
   01: MesFinal := EdtMesEsp.Text+'-31';
   02: MesFinal := EdtMesEsp.Text+'-28';
   03: MesFinal := EdtMesEsp.Text+'-31';
   04: MesFinal := EdtMesEsp.Text+'-30';
   05: MesFinal := EdtMesEsp.Text+'-31';
   06: MesFinal := EdtMesEsp.Text+'-30';
   07: MesFinal := EdtMesEsp.Text+'-31';
   08: MesFinal := EdtMesEsp.Text+'-31';
   09: MesFinal := EdtMesEsp.Text+'-30';
   10: MesFinal := EdtMesEsp.Text+'-31';
   11: MesFinal := EdtMesEsp.Text+'-30';
   12: MesFinal := EdtMesEsp.Text+'-31';
   end;
   QyDestaqueMes.Close;
   QyDestaqueMes.SQL.Clear;
   QyDestaqueMes.SQL.Add('SELECT TBCLIENTE.NOME, TBMOTIVOSDESTAQUES.DESCRICAO, TBDESTAQUES_MES.OBSERVACAO ');
   QyDestaqueMes.SQL.Add('FROM TBDESTAQUES_MES');
   QyDestaqueMes.SQL.Add('JOIN TBCLIENTE ON');
   QyDestaqueMes.SQL.Add('(TBCLIENTE.CODIGO = TBDESTAQUES_MES.CLIENTE)');
   QyDestaqueMes.SQL.Add('JOIN TBMOTIVOSDESTAQUES ON');
   QyDestaqueMes.SQL.Add('(TBMOTIVOSDESTAQUES.CODIGO = TBDESTAQUES_MES.MOTIVOS_DESTAQUE)');
   QyDestaqueMes.SQL.Add('WHERE DATA_DESTAQUE BETWEEN ('+QuotedStr(MesInicial)+') AND ('+QuotedStr(MesFinal)+') AND NOME LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
   QyDestaqueMes.Open;
end;

end.
