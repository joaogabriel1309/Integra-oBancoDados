object FTRE200P: TFTRE200P
  Left = 486
  Top = 244
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 299
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    553
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnOK: TBitBtn
    Left = 389
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtnOKClick
  end
  object BitBtnFechar: TBitBtn
    Left = 470
    Top = 266
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Fechar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtnFecharClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 553
    Height = 249
    Align = alTop
    DataSource = DsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object EdtPesquisa: TEdit
    Left = 0
    Top = 239
    Width = 553
    Height = 21
    TabOrder = 3
    OnChange = EdtPesquisaChange
  end
  object QyPesquisa: TQuery
    DatabaseName = 'DMConexao'
    Left = 504
    Top = 80
  end
  object DsPesquisa: TDataSource
    DataSet = QyPesquisa
    Left = 496
    Top = 40
  end
end
