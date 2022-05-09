object FTRE201P: TFTRE201P
  Left = -1046
  Top = 335
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Detalhes Fatores de Risco'
  ClientHeight = 296
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 628
    Height = 225
    Align = alTop
    DataSource = DsFatorRisco
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object EdtPesquisa: TEdit
    Left = 0
    Top = 224
    Width = 628
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = EdtPesquisaChange
  end
  object BitBtn1: TBitBtn
    Left = 512
    Top = 255
    Width = 98
    Height = 25
    Cursor = crHandPoint
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object RBCodigo: TRadioButton
    Left = 9
    Top = 255
    Width = 129
    Height = 17
    Caption = 'Pesquisar Pelo C'#243'digo'
    TabOrder = 3
  end
  object RBDescricao: TRadioButton
    Left = 144
    Top = 255
    Width = 145
    Height = 17
    Caption = 'Pesquisar Pela Descri'#231#227'o'
    Checked = True
    TabOrder = 4
    TabStop = True
  end
  object QyFatorRisco: TQuery
    DatabaseName = 'DMConexao'
    Left = 552
    Top = 136
  end
  object DsFatorRisco: TDataSource
    DataSet = QyFatorRisco
    Left = 552
    Top = 80
  end
end
