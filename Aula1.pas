unit Aula1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Bde.DBTables, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Menus, TRE005L,
  Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.CategoryButtons;

type
  TFTREPrincipal = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    Panel2: TPanel;
    CategoryButtons1: TCategoryButtons;
    ImageList2: TImageList;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    ButCadastro: TCategoryButtons;
    Panel4: TPanel;
    CategoryButtons3: TCategoryButtons;
    Butretalorio: TCategoryButtons;
    Image3: TImage;
    Image4: TImage;
    procedure CadastroTime1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items0Click(Sender: TObject);
    procedure CategoryButtons2Categories0Items0Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure CategoryButtons3Categories0Items2Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items2Click(Sender: TObject);
    procedure ButretalorioCategories0Items0Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items1Click(Sender: TObject);
    procedure CategoryButtons1Categories0Items3Click(Sender: TObject);
    procedure ButCadastroCategories0Items1Click(Sender: TObject);
    procedure ButCadastroCategories0Items2Click(Sender: TObject);
    procedure ButCadastroCategories0Items3Click(Sender: TObject);
    procedure ButCadastroCategories0Items4Click(Sender: TObject);
    procedure ButCadastroCategories0Items5Click(Sender: TObject);
    procedure ButCadastroCategories0Items6Click(Sender: TObject);
    procedure ButCadastroCategories0Items7Click(Sender: TObject);
    procedure ButCadastroCategories0Items8Click(Sender: TObject);
    procedure ButretalorioCategories0Items1Click(Sender: TObject);
    procedure ButCadastroCategories0Items9Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
  private
    procedure padrao;
    procedure VisiblePanel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTREPrincipal: TFTREPrincipal;

implementation

{$R *.dfm}

uses  TRE001C, TRE002C, TRE003C, CONEXAO001, TRE004C, TRE005C, TRE600E, TRE006C,
  TRE007C, TRE008C, TRE009E, TRE001U, TRE200P, TRE201P, TRE0011A,
  TRE013A, TRE014D, TRE012A, TRE010C, Util;

procedure TFTREPrincipal.ButCadastroCategories0Items1Click(Sender: TObject);
begin
   padrao;
   if not (Assigned(FTRE002C)) then
      FTRE002C := TFTRE002C.Create(self);
   FTRE002C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items2Click(Sender: TObject);
begin
   padrao;
   if not (Assigned(FTRE003C)) then
      FTRE003C := TFTRE003C.Create(self);
   FTRE003C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items3Click(Sender: TObject);
begin
   padrao;
   if not(Assigned(FTRE004C)) then
      FTRE004C := TFTRE004C.Create(self);
   FTRE004C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items4Click(Sender: TObject);
begin
   padrao;
   if not(Assigned(FTRE005C)) then
      FTRE005C := TFTRE005C.Create(Self);
   FTRE005C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items5Click(Sender: TObject);
begin
   padrao;
   if not (Assigned(FTRE006C)) then
      FTRE006C := TFTRE006C.Create(self);
   FTRE006C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items6Click(Sender: TObject);
begin
   padrao;
   if not(Assigned(FTRE007C)) then
      FTRE007C := TFTRE007C.Create(self);
   FTRE007C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items7Click(Sender: TObject);
begin
  padrao;
  if not(Assigned(FTRE008C)) then
      FTRE008C := TFTRE008C.Create(self);
   FTRE008C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items8Click(Sender: TObject);
begin
   padrao;
   if not (Assigned(FTRE010C)) then
      FTRE010C := TFTRE010C.Create(self);
   FTRE010C.Show;
end;

procedure TFTREPrincipal.ButCadastroCategories0Items9Click(Sender: TObject);
begin
   padrao;
   if not Assigned(FTRE011A) then
      FTRE011A := TFTRE011A.Create(self);
    FTRE011A.Show();
end;

procedure TFTREPrincipal.ButretalorioCategories0Items0Click(Sender: TObject);
begin
   padrao;
   if not Assigned(FTRE600E) then
      FTRE600E := TFTRE600E.Create(self);
    FTRE600E.Show();
end;

procedure TFTREPrincipal.ButretalorioCategories0Items1Click(Sender: TObject);
begin
   padrao;
   if not Assigned(FTRE009E) then
      FTRE009E := TFTRE009E.create(self);
   FTRE009E.Show();
end;

procedure TFTREPrincipal.padrao;
begin
  Panel2.Visible := false;
  Panel3.Visible := false;
end;

procedure TFTREPrincipal.VisiblePanel;
begin
  Panel3.Visible := false;
  ButCadastro.Visible := False;
  Butretalorio.Visible := False;
end;

procedure TFTREPrincipal.CadastroTime1Click(Sender: TObject);
begin
   if not Assigned(FTRE001C) then
      FTRE001C := TFTRE001C.create(self);
   FTRE001C.Show();
end;

procedure TFTREPrincipal.CategoryButtons1Categories0Items0Click(
  Sender: TObject);
begin
   if Panel3.Visible = false then
   begin
      Butretalorio.Visible := false;
      Panel3.Visible := true;
      ButCadastro.Visible := true;
   end
   else
   begin
      Panel3.Visible := false;
      ButCadastro.Visible := False;
   end;
end;

procedure TFTREPrincipal.CategoryButtons1Categories0Items1Click(
  Sender: TObject);
begin
   VisiblePanel;
end;

procedure TFTREPrincipal.CategoryButtons1Categories0Items2Click(
  Sender: TObject);
begin
   VisiblePanel;
end;

procedure TFTREPrincipal.CategoryButtons1Categories0Items3Click(
  Sender: TObject);
begin
   if Panel3.Visible = false then
   begin
      ButCadastro.Visible := false;
      Panel3.Visible := true;
      Butretalorio.Visible := true;
   end
   else
   begin
      Panel3.Visible := false;
      Butretalorio.Visible := False;
   end;
end;

procedure TFTREPrincipal.CategoryButtons2Categories0Items0Click(
  Sender: TObject);
begin
  padrao;
   if not Assigned(FTRE001C) then
      FTRE001C := TFTRE001C.create(self);
   FTRE001C.Show();
end;

procedure TFTREPrincipal.CategoryButtons3Categories0Items2Click(
  Sender: TObject);
begin
   if (Application.MessageBox('Tem certeza que deseja sair?','Sair', MB_YESNO + MB_ICONINFORMATION) = mrYes) then
      Close;
end;

procedure TFTREPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(FTRE001C) then
      FreeAndNil(FTRE001C);
   if Assigned(FTRE002C) then
      FreeAndNil(FTRE002C);
   if Assigned(FTRE003C) then
      FreeAndNil(FTRE003C);
   if Assigned(FTRE004C) then
      FreeAndNil(FTRE004C);
   if Assigned(FTRE005C) then
      FreeAndNil(FTRE005C);
   if Assigned(FTRE600E) then
      FreeAndNil(FTRE600E);
   if Assigned(FTRE006C) then
      FreeAndNil(FTRE006C);
   if Assigned(FTRE007C) then
      FreeAndNil(FTRE007C);
   if Assigned(FTRE008C) then
      FreeAndNil(FTRE008C);
   if Assigned(FTRE009E) then
      FreeAndNil(FTRE009E);
   if Assigned(FTRE010C) then
      FreeAndNil(FTRE010C);
   if Assigned(FTRE201P) then
      FreeAndNil(FTRE201P);
   if Assigned(FTRE200P) then
      FreeAndNil(FTRE200P);
   if Assigned(FTRE011A) then
      FreeAndNil(FTRE011A);
   if Assigned(FTRE014D) then
      FreeAndNil(FTRE014D);
   if Assigned(FTREPrincipal) then
      FreeAndNil(FTREPrincipal);
   if Assigned(FTRE001U) then
      FreeAndNil(FTRE001U);
   if Assigned(CONEXAO) then
      FreeAndNil(CONEXAO);
end;

procedure TFTREPrincipal.Image1Click(Sender: TObject);
begin
   if Panel2.Visible = false then
      Panel2.Visible := true
   else
   begin
      Panel2.Visible := false;
      Panel3.Visible := false;
   end;
end;

procedure TFTREPrincipal.Image2Click(Sender: TObject);
begin
   if Panel4.Visible = false then
      Panel4.Visible := true
   else
      Panel4.Visible := false;
end;

procedure TFTREPrincipal.Image3Click(Sender: TObject);
begin
   padrao;
   if not Assigned(FTRE013A) then
      FTRE013A := TFTRE013A.Create(self);
    FTRE013A.Show();
end;

procedure TFTREPrincipal.Image4Click(Sender: TObject);
begin
   padrao;
   if not Assigned(FTRE014D) then
      FTRE014D := TFTRE014D.Create(self);
    FTRE014D.Show();
end;

procedure TFTREPrincipal.Timer1Timer(Sender: TObject);
begin
   Label1.Caption := DateTimeToStr(Now());
end;

end.
