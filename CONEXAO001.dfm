object CONEXAO: TCONEXAO
  Left = 489
  Top = 253
  Caption = 'CONEXAO'
  ClientHeight = 199
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DMConexao: TDatabase
    AliasName = 'DBA_J'
    Connected = True
    DatabaseName = 'DMConexao'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=dba')
    SessionName = 'Default'
    Left = 144
    Top = 64
  end
end
