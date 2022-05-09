object FTRE009E: TFTRE009E
  Left = 328
  Top = 109
  Anchors = [akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Destaque do M'#234's'
  ClientHeight = 396
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    673
    396)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 51
    Top = 13
    Width = 103
    Height = 13
    Caption = 'Informe Colaborador '
  end
  object Label3: TLabel
    Left = 51
    Top = 69
    Width = 81
    Height = 13
    Caption = 'Motivo Destaque'
  end
  object Label5: TLabel
    Left = 584
    Top = 13
    Width = 72
    Height = 13
    Caption = 'Data Destaque'
  end
  object Label2: TLabel
    Left = 8
    Top = 125
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object SpeedButton1: TSpeedButton
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
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 87
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
  object Label4: TLabel
    Left = 8
    Top = 214
    Width = 209
    Height = 14
    Caption = 'Ultimos destaques do colaborador'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtColaboradorCodigo: TEdit
    Left = 51
    Top = 32
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnExit = EdtColaboradorCodigoExit
  end
  object EdtColaboradorNome: TEdit
    Left = 139
    Top = 32
    Width = 430
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object EdtData: TMaskEdit
    Left = 584
    Top = 32
    Width = 82
    Height = 21
    EditMask = '00/00/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object EdtMotivoCodigo: TEdit
    Left = 51
    Top = 88
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 2
    OnExit = EdtMotivoCodigoExit
  end
  object EdtMotivoDescricao: TEdit
    Left = 139
    Top = 88
    Width = 527
    Height = 21
    Enabled = False
    TabOrder = 8
  end
  object BitOK: TBitBtn
    Left = 345
    Top = 363
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = '&Salvar'
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitOKClick
  end
  object BitExcluir: TBitBtn
    Left = 506
    Top = 363
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = '&Excluir'
    Enabled = False
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitExcluirClick
  end
  object BitSair: TBitBtn
    Left = 587
    Top = 363
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = '&Fechar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 6
  end
  object MemoDescricao: TMemo
    Left = 8
    Top = 144
    Width = 658
    Height = 61
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 237
    Width = 657
    Height = 120
    DataSource = DSDestaqueMes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Colaborador'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Motivo Destaque'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACAO'
        Title.Caption = 'Observa'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_DESTAQUE'
        Title.Caption = 'Data Destaque'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object BitNovo: TBitBtn
    Left = 426
    Top = 363
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = '&Novo'
    Enabled = False
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 10
    OnClick = BitNovoClick
  end
  object QyDestaqueMes: TQuery
    DatabaseName = 'DMConexao'
    Left = 624
    Top = 104
  end
  object DSDestaqueMes: TDataSource
    DataSet = QYDestaqueMesDbGrid
    Left = 608
    Top = 264
  end
  object QYDestaqueMesDbGrid: TQuery
    DatabaseName = 'DMConexao'
    Left = 536
    Top = 264
  end
end
