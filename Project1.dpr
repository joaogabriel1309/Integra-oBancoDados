program Project1;

uses
  Vcl.Forms,
  Aula1 in 'Aula1.pas' {FTREPrincipal},
  TRE001C in 'TRE001C.pas' {FTRE001C},
  TRE002C in 'TRE002C.pas' {FTRE002C},
  TRE003C in 'TRE003C.pas' {FTRE003C},
  CONEXAO001 in 'CONEXAO001.pas' {CONEXAO},
  TRE004C in 'TRE004C.pas' {FTRE004C},
  TRE005C in 'TRE005C.pas' {FTRE005C},
  TRE005L in 'TRE005L.pas' {FTRE005L},
  Util in 'Util.pas',
  TRE600E in 'TRE600E.pas' {FTRE600E},
  TRE200P in 'TRE200P.pas' {FTRE200P},
  TRE006C in 'TRE006C.pas' {FTRE006C},
  TRE007C in 'TRE007C.pas' {FTRE007C},
  TRE201P in 'TRE201P.pas' {FTRE201P},
  TRE008C in 'TRE008C.pas' {FTRE008C},
  TRE009E in 'TRE009E.pas' {FTRE009E},
  TRE010C in 'TRE010C.pas' {FTRE010C},
  TRE001U in 'TRE001U.pas' {FTRE001U},
  TRE0011A in 'TRE0011A.pas' {FICO001C},
  TRE012A in 'TRE012A.pas' {FTRE012A},
  TRE013A in 'TRE013A.pas' {FTRE013A},
  TRE014D in 'TRE014D.pas' {FTRE014D};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFTRE001U, FTRE001U);
  Application.CreateForm(TCONEXAO, CONEXAO);
  Application.CreateForm(TFTRE200P, FTRE200P);
  Application.CreateForm(TFTRE201P, FTRE201P);
  Application.CreateForm(TFTREPrincipal, FTREPrincipal);
  Application.CreateForm(TFTRE012A, FTRE012A);
  Application.Run;
end.
