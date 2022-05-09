object FTRE013A: TFTRE013A
  Left = 213
  Top = 117
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Calendario'
  ClientHeight = 517
  ClientWidth = 957
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGridCalendario: TStringGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 517
    Align = alClient
    ColCount = 8
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
  end
  object QyCalendario: TQuery
    DatabaseName = 'DMConexao'
    Left = 472
    Top = 264
  end
end
