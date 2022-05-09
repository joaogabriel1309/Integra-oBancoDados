unit TRE200P;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Bde.DBTables;

type
   TTipoPesquisa = (tpPesqCliente, tpPesqProduto, tpPesqResponsavel, tpPesqMotivos, tpPesqAmbienteTrabalho, tpPesqConselho, tpPesqFormacao);
  TFTRE200P = class(TForm)
    BitBtnOK: TBitBtn;
    BitBtnFechar: TBitBtn;
    QyPesquisa: TQuery;
    DsPesquisa: TDataSource;
    DBGrid1: TDBGrid;
    EdtPesquisa: TEdit;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
    procedure Consulta;
  public
    { Public declarations }
    var TipoPesquisa: TTipoPesquisa;
      Retorno: String;
      RetornoInscricao: Integer;
      RetornoConselhoDescricao: String;
  end;

var
  FTRE200P: TFTRE200P;

implementation

{$R *.dfm}

procedure TFTRE200P.BitBtnFecharClick(Sender: TObject);
begin
   ModalResult := mrClose;
end;

procedure TFTRE200P.BitBtnOKClick(Sender: TObject);
begin
   case TipoPesquisa of
    tpPesqCliente:
    begin
       try
          Retorno:= QyPesquisa.FieldByName('CODIGO').AsString;
          QyPesquisa.Close;
          ModalResult := mrOk;
       except
          ModalResult := mrAbort;
       end;
    end;
    tpPesqProduto:
    begin
       try
          RetornoInscricao := QyPesquisa.FieldByName('TIPO_INSCRICAO').AsInteger;
          QyPesquisa.Close;
          ModalResult := mrOk;
       except
          ModalResult := mrAbort;
       end;
    end;
    tpPesqResponsavel:
       begin
          try
             RetornoInscricao:= QyPesquisa.FieldByName('TIPO_INSCRICAO').AsInteger;
             Retorno:= QyPesquisa.FieldByName('CODIGO').AsString;
             QyPesquisa.Close;
             ModalResult := mrOk;
          except
             ModalResult := mrAbort;
          end;
       end;
    tpPesqMotivos:
    begin
       try
          Retorno:= QyPesquisa.FieldByName('CODIGO').AsString;
          QyPesquisa.Close;
          ModalResult := mrOk;
       except
          ModalResult := mrAbort;
       end
    end;
    tpPesqAmbienteTrabalho:
    begin
       try
          Retorno:= QyPesquisa.FieldByName('CODIGO').AsString;
          QyPesquisa.Close;
          ModalResult := mrOk;
       except
          ModalResult := mrAbort;
       end
    end;
    tpPesqConselho:
    begin
       try
          Retorno:= QyPesquisa.FieldByName('SIGLA').AsString;
          RetornoConselhoDescricao := QyPesquisa.FieldByName('DESCRICAO').AsString;
          QyPesquisa.Close;
          ModalResult := mrOk;
       except
          ModalResult := mrAbort;
       end
    end;
    tpPesqFormacao:
    begin
       try
          Retorno:= QyPesquisa.FieldByName('CODIGO').AsString;
          QyPesquisa.Close;
          ModalResult := mrOk;
       except
          ModalResult := mrAbort;
       end
    end;
   end;
end;

procedure TFTRE200P.Consulta;
begin
   QyPesquisa.Close;
   QyPesquisa.SQL.Clear;
   case TipoPesquisa of
      tpPesqCliente:
      begin
         QyPesquisa.SQL.Add('SELECT CODIGO, NOME, ENDERECO FROM TBCLIENTE');
         if (Length(EdtPesquisa.Text) >= 2) then
            QyPesquisa.SQL.Add('WHERE NOME LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
         QyPesquisa.Open;
      end;
      tpPesqProduto:
      begin
         QyPesquisa.SQL.Add('SELECT CODIGO,DESCRICAO,PRECO_VENDA FROM TBPRODUTOJ');
         if (Length(EdtPesquisa.Text) >= 2) then
            QyPesquisa.SQL.Add('WHERE DESCRICAO LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
         QyPesquisa.Open;
      end;
      tpPesqResponsavel:
      begin
         QyPesquisa.SQL.Add('SELECT TIPO_INSCRICAO, INSCRICAO AS CODIGO, RAZAO_SOCIAL, CPF_RESPONSAVEL, DATA_NASCIMENTO,RESPONSAVEL_INFORMACAO , CPF_INFORMACAO FROM TBRESPONSAVEL');
         if (Length(EdtPesquisa.Text) >= 2) then
            QyPesquisa.SQL.Add('WHERE RAZAO_SOCIAL LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
         QyPesquisa.Open;
      end;
      tpPesqMotivos:
      begin
         QyPesquisa.SQL.Add('SELECT CODIGO AS CODIGO,DESCRICAO FROM TBMOTIVOSDESTAQUES');
         if (Length(EdtPesquisa.Text) >= 2) then
            QyPesquisa.SQL.Add('WHERE DESCRICAO LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
         QyPesquisa.Open;
      end;
      tpPesqAmbienteTrabalho:
      begin
         QyPesquisa.SQL.Add('SELECT CODIGO, NUMERO_INSCRICAO AS INCRIÇÃO, NOME_DO_AMBINETE AS AMBIENTE, DESCRICAO_AMBIENTE AS OBSERVAÇÕES FROM TBAMBIENTE_DE_TRABALHO');
         if (Length(EdtPesquisa.Text) >= 2) then
            QyPesquisa.SQL.Add('WHERE NOME_DO_AMBINETE LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
         QyPesquisa.Open;
      end;
      tpPesqConselho:
      begin
         QyPesquisa.SQL.Add('SELECT SIGLA, DESCRICAO FROM TBCONSELHO_REGIONAL');
         if (Length(EdtPesquisa.Text) >= 2) then
            QyPesquisa.SQL.Add('WHERE DESCRICAO LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
         QyPesquisa.Open;
      end;
      tpPesqFormacao:
      begin
         QyPesquisa.SQL.Add('SELECT TBFORMACAO.CODIGO, TBCLIENTE.NOME AS NOME,TBCONSELHO_REGIONAL.SIGLA, TBCONSELHO_REGIONAL.DESCRICAO FROM TBFORMACAO');
         QyPesquisa.SQL.Add('JOIN TBCONSELHO_REGIONAL ON (TBCONSELHO_REGIONAL.SIGLA = TBFORMACAO.FORMACAO) JOIN TBCLIENTE ON (TBCLIENTE.CODIGO = TBFORMACAO.CLIENTE)');
         if (Length(EdtPesquisa.Text) >= 2) then
            QyPesquisa.SQL.Add('WHERE NOME LIKE '+QuotedStr('%'+EdtPesquisa.Text+'%'));
         QyPesquisa.Open;
      end;
   end;
end;

procedure TFTRE200P.EdtPesquisaChange(Sender: TObject);
begin
   Consulta();
end;

procedure TFTRE200P.FormShow(Sender: TObject);
begin
   Consulta();
   EdtPesquisa.Clear;
   EdtPesquisa.SetFocus;
end;

end.
