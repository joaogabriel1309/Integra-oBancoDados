unit TRE001U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Bde.DBTables;

type
  TFTRE001U = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    EdtUsuario: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    Label7: TLabel;
    EdtSenha: TEdit;
    Panel7: TPanel;
    SpeedButton2: TSpeedButton;
    LBMErro: TLabel;
    Label6: TLabel;
    QyLogin: TQuery;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTRE001U: TFTRE001U;

implementation

{$R *.dfm}

uses Aula1;

procedure TFTRE001U.SpeedButton1Click(Sender: TObject);
begin
   QyLogin.Close;
   QyLogin.SQL.Clear;
   QyLogin.SQL.Add('SELECT LOGINS,SENHA FROM TBLOGIN WHERE LOGINS = :LOGINS AND SENHA = :SENHA');
   QyLogin.ParamByName('LOGINS').AsString := EdtUsuario.Text;
   QyLogin.ParamByName('SENHA').AsString := EdtSenha.Text;
   QyLogin.Open;
   if not(QyLogin.IsEmpty) then
   begin
      if not(Assigned(FTREPrincipal)) then
         FTREPrincipal := FTREPrincipal.Create(self);
      FTREPrincipal.Show;
   end
   else
   begin
      LBMErro.Caption := 'Usuário ou Senha Incorreto(s)';
      EdtSenha.Clear;
      EdtUsuario.SetFocus;
   end;
end;

procedure TFTRE001U.SpeedButton2Click(Sender: TObject);
begin
   Close;
end;
end.
