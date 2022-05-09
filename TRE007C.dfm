object FTRE007C: TFTRE007C
  Left = 407
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro Ambiente de Trabalho'
  ClientHeight = 431
  ClientWidth = 555
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
    555
    431)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 13
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 111
    Top = 13
    Width = 81
    Height = 13
    Caption = 'Tipo de Inscri'#231#227'o'
  end
  object Label3: TLabel
    Left = 262
    Top = 13
    Width = 101
    Height = 13
    Caption = 'N'#250'mero  da Inscri'#231#227'o'
  end
  object Label4: TLabel
    Left = 8
    Top = 69
    Width = 72
    Height = 13
    Caption = 'Local Ambiente'
  end
  object Label5: TLabel
    Left = 8
    Top = 115
    Width = 150
    Height = 13
    Caption = 'Nome do Ambiente de Trabalho'
  end
  object Label6: TLabel
    Left = 8
    Top = 156
    Width = 114
    Height = 13
    Caption = 'Fator de Risco Detalhes'
  end
  object Label7: TLabel
    Left = 8
    Top = 333
    Width = 154
    Height = 13
    Caption = 'Descri'#231#227'o Ambiente de Trabalho'
  end
  object SpeedButton1: TSpeedButton
    Left = 424
    Top = 41
    Width = 113
    Height = 68
    Cursor = crHandPoint
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFBFBFBF555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3
      C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFF
      F9F9F99393933939390C0C0C0B0B0B383838949494F9F9F9BFBFBF161616BFBF
      BFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E43030304C4C4CBDBDBDF3F3F3F3F3F3BD
      BDBD4B4B4B2C2C2C161616BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8303030
      848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383832C2C2CF9F9F9FFFF
      FFFFFFFFFFFFFFFFFFFF9292924C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF4B4B4B949494FFFFFFFFFFFFFFFFFFFFFFFF373737BEBEBE
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD383838FFFF
      FFFFFFFFFFFFFFFFFFFF0C0C0CF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF1F1F10D0D0DFFFFFFFFFFFFFFFFFFFFFFFF0C0C0CF3F3F3
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F20C0C0CFFFF
      FFFFFFFFFFFFFFFFFFFF363636BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFBDBDBD383838FFFFFFFFFFFFFFFFFFFFFFFF9191914D4D4D
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4C949494FFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F82F2F2F868686FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF848484313131F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4
      2F2F2F4D4D4DBFBFBFF4F4F4F4F4F4BEBEBE4C4C4C303030E4E4E4FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F89191913737370B0B0B0B0B0B37
      3737939393F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = SpeedButton1Click
  end
  object Label8: TLabel
    Left = 8
    Top = 408
    Width = 161
    Height = 14
    Caption = #218'ltimo C'#243'digo Registrado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object UltimoCodigo: TLabel
    Left = 175
    Top = 410
    Width = 3
    Height = 13
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 31
    Width = 23
    Height = 22
    Cursor = crHandPoint
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFBFBFBF555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3
      C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFC3C3C3161616BDBDBDFFFFFFFFFFFFFFFFFFFFFFFF
      F9F9F99393933939390C0C0C0B0B0B383838949494F9F9F9BFBFBF161616BFBF
      BFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E43030304C4C4CBDBDBDF3F3F3F3F3F3BD
      BDBD4B4B4B2C2C2C161616BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8303030
      848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383832C2C2CF9F9F9FFFF
      FFFFFFFFFFFFFFFFFFFF9292924C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF4B4B4B949494FFFFFFFFFFFFFFFFFFFFFFFF373737BEBEBE
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD383838FFFF
      FFFFFFFFFFFFFFFFFFFF0C0C0CF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF1F1F10D0D0DFFFFFFFFFFFFFFFFFFFFFFFF0C0C0CF3F3F3
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F20C0C0CFFFF
      FFFFFFFFFFFFFFFFFFFF363636BFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFBDBDBD383838FFFFFFFFFFFFFFFFFFFFFFFF9191914D4D4D
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4C949494FFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F82F2F2F868686FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF848484313131F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4
      2F2F2F4D4D4DBFBFBFF4F4F4F4F4F4BEBEBE4C4C4C303030E4E4E4FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F89191913737370B0B0B0B0B0B37
      3737939393F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = SpeedButton2Click
  end
  object EdtCodigo: TEdit
    Left = 48
    Top = 32
    Width = 57
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnEnter = EdtCodigoEnter
    OnExit = EdtCodigoExit
  end
  object ComboTipoInscricao: TComboBox
    Left = 111
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnExit = ComboTipoInscricaoExit
  end
  object ComboLocalAmbiente: TComboBox
    Left = 8
    Top = 88
    Width = 392
    Height = 21
    Style = csDropDownList
    TabOrder = 3
  end
  object EdtNomeAmbienteTrabalho: TEdit
    Left = 8
    Top = 134
    Width = 529
    Height = 21
    TabOrder = 4
  end
  object DBFatorRisco: TDBGrid
    Left = 8
    Top = 174
    Width = 537
    Height = 123
    DataSource = DsAmbienteTrabalho
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBFatorRiscoDblClick
  end
  object MemoDescricaoAmbiente: TMemo
    Left = 8
    Top = 348
    Width = 537
    Height = 49
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object BitSair: TBitBtn
    Left = 456
    Top = 398
    Width = 92
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = '&Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clPurple
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkClose
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 9
  end
  object BitExcluir: TBitBtn
    Left = 358
    Top = 398
    Width = 92
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = '&Remover'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkCancel
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 8
    OnClick = BitExcluirClick
  end
  object BitOK: TBitBtn
    Left = 260
    Top = 398
    Width = 92
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkOK
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 7
    OnClick = BitOKClick
  end
  object EdtNumeroInscricao: TMaskEdit
    Left = 262
    Top = 32
    Width = 138
    Height = 21
    EditMask = '99.999.999/9999-99;0;_'
    MaxLength = 18
    TabOrder = 2
    OnExit = EdtNumeroInscricaoExit
  end
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 302
    Width = 240
    Height = 25
    DataSource = DsAmbienteTrabalho
    Kind = dbnHorizontal
    TabOrder = 10
  end
  object QyAmbienteTrabalho: TQuery
    DatabaseName = 'DMConexao'
    Left = 216
    Top = 16
  end
  object DsAmbienteTrabalho: TDataSource
    DataSet = DcsTemporario
    Left = 288
    Top = 152
  end
  object DcsTemporario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 216
    Top = 152
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = QyAmbienteTrabalho
    Left = 216
    Top = 80
  end
end
