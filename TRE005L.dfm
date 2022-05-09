object FTRE005L: TFTRE005L
  Left = 295
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'listagem de Produtos'
  ClientHeight = 456
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 408
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 79
    Top = 408
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object StringGriListaProduto: TStringGrid
    Left = 0
    Top = 0
    Width = 767
    Height = 402
    Align = alTop
    BorderStyle = bsNone
    ColCount = 7
    DefaultColWidth = 105
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    OnDblClick = StringGriListaProdutoDblClick
  end
  object BitBtn1: TBitBtn
    Left = 664
    Top = 423
    Width = 95
    Height = 25
    Cursor = crHandPoint
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 4
  end
  object EdtProcurar: TEdit
    Left = 79
    Top = 427
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object BitProcurar: TBitBtn
    Left = 298
    Top = 425
    Width = 79
    Height = 25
    Cursor = crHandPoint
    Caption = 'Procurar'
    TabOrder = 3
    OnClick = BitProcurarClick
  end
  object EdtCodigo: TEdit
    Left = 8
    Top = 427
    Width = 65
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object BitAtualizar: TBitBtn
    Left = 391
    Top = 425
    Width = 79
    Height = 25
    Cursor = crHandPoint
    Caption = 'Atualizar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitAtualizarClick
  end
end
