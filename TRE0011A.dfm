object FTRE011A: TFTRE011A
  Left = 232
  Top = 76
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Agendador de Atividade'
  ClientHeight = 569
  ClientWidth = 847
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 847
    Height = 209
    Align = alTop
    Caption = 'Panel1'
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 8
      Width = 128
      Height = 13
      Caption = 'Cadastro de Atividade '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 38
      Top = 38
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object SpeedButton1: TSpeedButton
      Left = 9
      Top = 52
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
    object Label3: TLabel
      Left = 121
      Top = 38
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 576
      Top = 38
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label5: TLabel
      Left = 699
      Top = 38
      Width = 63
      Height = 13
      Caption = 'Horar'#237'o In'#237'cio'
    end
    object Label6: TLabel
      Left = 775
      Top = 38
      Width = 63
      Height = 13
      Caption = 'Horar'#237'o Final '
    end
    object Label7: TLabel
      Left = 8
      Top = 85
      Width = 105
      Height = 13
      Caption = 'Tipo do Agendamento'
    end
    object LBLValor: TLabel
      Left = 8
      Top = 157
      Width = 24
      Height = 13
      Caption = 'Valor'
      Enabled = False
    end
    object Label9: TLabel
      Left = 374
      Top = 85
      Width = 109
      Height = 13
      Caption = 'Detalhes/Observa'#231#245'es'
    end
    object SpeedButton2: TSpeedButton
      Left = 665
      Top = 53
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF
        4747475555555555555555555555555555555555555555555555555555555555
        55474747B1B1B1FFFFFFFFFFFF575757F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9585858FFFFFFFFFFFF555555
        C5C5C53F3F3F3F3F3FC6C6C6C5C5C53F3F3F3F3F3FC6C6C6C5C5C53F3F3F3F3F
        3FC6C6C6555555FFFFFFFFFFFF555555C5C5C53E3E3E3E3E3EC6C6C6C5C5C53E
        3E3E3E3E3EC6C6C6C5C5C53E3E3E3E3E3EC6C6C6555555FFFFFFFFFFFF555555
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF555555FFFFFFFFFFFF555555E2E2E25B5B5B5B5B5BE2E2E2E2E2E25B
        5B5B5B5B5BE2E2E2E2E2E25B5B5B5B5B5BE2E2E2555555FFFFFFFFFFFF555555
        B0B0B0727272727272B0B0B0B0B0B0727272727272B0B0B0B0B0B07272727272
        72B0B0B0555555FFFFFFFFFFFF555555F8F8F8B0B0B0B0B0B0F8F8F8F8F8F8B0
        B0B0B0B0B0F8F8F8F8F8F8B0B0B0B0B0B0F8F8F8555555FFFFFFFFFFFF555555
        AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        AAAAAAAA555555FFFFFFFFFFFF555555AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
        AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA555555FFFFFFFFFFFF575757
        F9F9F9D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7
        D7F9F9F9585858FFFFFFFFFFFFAEAEAE7E7E7E555555C7C7C755555555555555
        5555555555555555555555C7C7C75555557E7E7EB0B0B0FFFFFFFFFFFFFFFFFF
        FFFFFF9D9D9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D9D
        9DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedButton2Click
    end
    object SpeedAdcicionar: TSpeedButton
      Left = 802
      Top = 104
      Width = 42
      Height = 44
      Cursor = crHandPoint
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E8E8D1A9A7B16C6AA3514F973B38973B
        38A3514FB26D6BD2A9A8F3E8E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EEEEC18A8894343192312E92312E
        92312E92312E92312E92312E92312E92312E933330BA7C7AF4EBEBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEC0BF983B3992312E92
        312E92312E92312E92312E92312E92312E92312E92312E92312E92312E92312E
        983C39DFC2C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0A6A59333
        3092312E92312E92312E92312E92312E92312E92312E92312E92312E92312E92
        312E92312E92312E92312E933330D0A7A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E0C4C393333092312E92312E92312E92312E92312E92312E953633D0A5A4CFA5
        A394353292312E92312E92312E92312E92312E92312E933330DEC1C0FFFFFFFF
        FFFFFFFFFFF3E9E9983B3992312E92312E92312E92312E92312E92312E92312E
        B4716FFFFFFFFFFFFFB3706E92312E92312E92312E92312E92312E92312E9231
        2E983C39F4EBEBFFFFFFFFFFFFBC817F92312E92312E92312E92312E92312E92
        312E92312E92312EB87A78FFFFFFFFFFFFB87A7892312E92312E92312E92312E
        92312E92312E92312E92312EBE8482FFFFFFF3E8E793333092312E92312E9231
        2E92312E92312E92312E92312E92312EB87A78FFFFFFFFFFFFB87A7892312E92
        312E92312E92312E92312E92312E92312E92312E943431F3E8E8D1A8A692312E
        92312E92312E92312E92312E92312E92312E92312E92312EB87A78FFFFFFFFFF
        FFB87A7892312E92312E92312E92312E92312E92312E92312E92312E92312ED2
        AAA9B16B6992312E92312E92312E92312E92312E92312E92312E92312E92312E
        B87A78FFFFFFFFFFFFB87A7892312E92312E92312E92312E92312E92312E9231
        2E92312E92312EB26D6BA2504D92312E92312E92312E953633B36F6DB67674B6
        7674B67674B67674D0A6A5FFFFFFFFFFFFD0A6A5B67674B67674B67674B67674
        B36F6D94353292312E92312E92312EA3514F973B3892312E92312E92312ED0A5
        A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCFA5A392312E92312E92312E983C39973B3892312E
        92312E92312ED0A6A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0A5A492312E92312E92312E97
        3B38A14E4C92312E92312E92312E953633B36F6DB67674B67674B67674B67674
        D0A6A5FFFFFFFFFFFFD0A6A5B67674B67674B67674B67674B36F6D9536339231
        2E92312E92312EA3514EB16B6992312E92312E92312E92312E92312E92312E92
        312E92312E92312EB87A78FFFFFFFFFFFFB87A7892312E92312E92312E92312E
        92312E92312E92312E92312E92312EB26D6BD0A6A592312E92312E92312E9231
        2E92312E92312E92312E92312E92312EB87A78FFFFFFFFFFFFB87A7892312E92
        312E92312E92312E92312E92312E92312E92312E92312ED1A9A7F2E7E6933330
        92312E92312E92312E92312E92312E92312E92312E92312EB87A78FFFFFFFFFF
        FFB87A7892312E92312E92312E92312E92312E92312E92312E92312E933330F3
        E8E8FFFFFFBB7F7D92312E92312E92312E92312E92312E92312E92312E92312E
        B87A78FFFFFFFFFFFFB87A7892312E92312E92312E92312E92312E92312E9231
        2E92312EBD8280FFFFFFFFFFFFF3E8E8973B3892312E92312E92312E92312E92
        312E92312E92312EB4716FFFFFFFFFFFFFB4716F92312E92312E92312E92312E
        92312E92312E92312E983B39F4EAEAFFFFFFFFFFFFFFFFFFDDBEBD9333309231
        2E92312E92312E92312E92312E92312E953633D0A6A5D0A5A495363392312E92
        312E92312E92312E92312E92312E933330DEC0BFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD0A5A493333092312E92312E92312E92312E92312E92312E92312E9231
        2E92312E92312E92312E92312E92312E92312E933330D0A6A5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDBEBD973B3892312E92312E92312E92312E
        92312E92312E92312E92312E92312E92312E92312E92312E983B39DEC0BFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E9E9BE838293
        333092312E92312E92312E92312E92312E92312E92312E92312E933330B67674
        F1E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF2E7E6D0A7A6B06A68A3514E973A37973A37A3514EB06A68D1
        A8A6F3E8E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedAdcicionarClick
    end
    object SpeedRemover: TSpeedButton
      Left = 803
      Top = 154
      Width = 41
      Height = 40
      Cursor = crHandPoint
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEBFEACB2FA707AF75661F63F4CF53F4C
        F55661F6717AF7ACB2FAEAEBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF0FE8D94F93946F43643F43643F4
        3643F43643F43643F43643F43643F43643F43946F4868EF8EBEDFEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C7FC414DF53643F436
        43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
        424EF5C4C8FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAFFA3844
        F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
        43F43643F43643F43643F43844F4ABB0FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C6CAFC3845F43643F43643F43643F43643F43643F43643F43643F43643F43643
        F43643F43643F43643F43643F43643F43643F43643F43844F4C3C7FCFFFFFFFF
        FFFFFFFFFFEBECFE404DF53643F43643F43643F43643F43643F43643F43643F4
        3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
        F4424EF5ECEDFEFFFFFFFFFFFF868DF83643F43643F43643F43643F43643F436
        43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
        3643F43643F43643F43643F48890F8FFFFFFE9EAFE3946F43643F43643F43643
        F43643F43643F46F79F6B0B5F84753F53643F43643F43643F43643F44753F5B1
        B6F86F78F63643F43643F43643F43643F43643F43946F4EAEBFEABB0FA3643F4
        3643F43643F43643F43643F43643F4B2B7F8FAFAFAD8DBF94753F53643F43643
        F44753F5D8DBF9FAFAFAB1B6F83643F43643F43643F43643F43643F43643F4AD
        B2FB7079F73643F43643F43643F43643F43643F43643F44752F5D8DAF9FAFAFA
        DBDEF94955F54752F5D8DAF9FAFAFADBDEF94A55F53643F43643F43643F43643
        F43643F43643F4717AF7545FF63643F43643F43643F43643F43643F43643F436
        43F44753F5D8DBF9FAFAFAD8DBF9D8DBF9FAFAFAD8DBF94753F53643F43643F4
        3643F43643F43643F43643F43643F45661F6404DF53643F43643F43643F43643
        F43643F43643F43643F43643F44752F5D8DAF9FAFAFAFAFAFADBDEF94A55F536
        43F43643F43643F43643F43643F43643F43643F43643F4414DF53F4CF53643F4
        3643F43643F43643F43643F43643F43643F43643F44752F5D8DAF9FAFAFAFAFA
        FADBDEF94955F53643F43643F43643F43643F43643F43643F43643F43643F43F
        4CF5535EF63643F43643F43643F43643F43643F43643F43643F44753F5D8DBF9
        FAFAFAD8DBF9D8DBF9FAFAFAD8DBF94753F53643F43643F43643F43643F43643
        F43643F43643F45560F67079F73643F43643F43643F43643F43643F43643F447
        52F5D8DAF9FAFAFADBDEF94A55F54752F5D8DAF9FAFAFADBDEF94955F53643F4
        3643F43643F43643F43643F43643F4717AF7A9AFFA3643F43643F43643F43643
        F43643F43643F4B1B6F8FAFAFAD8DBF94753F53643F43643F44753F5D8DBF9FA
        FAFAB0B5F83643F43643F43643F43643F43643F43643F4ABB1FAE8EAFE3845F4
        3643F43643F43643F43643F43643F46F79F6B1B6F84753F53643F43643F43643
        F43643F44753F5B1B6F86F79F63643F43643F43643F43643F43643F43946F4EA
        EBFEFFFFFF848CF83643F43643F43643F43643F43643F43643F43643F43643F4
        3643F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643
        F43643F4868EF8FFFFFFFFFFFFEAEBFE404DF53643F43643F43643F43643F436
        43F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F4
        3643F43643F43643F4414DF5EBEDFEFFFFFFFFFFFFFFFFFFC5C9FC3845F43643
        F43643F43643F43643F43643F43643F43643F43643F43643F43643F43643F436
        43F43643F43643F43643F43643F43844F4C2C5FCFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA9AFFA3844F43643F43643F43643F43643F43643F43643F43643F43643
        F43643F43643F43643F43643F43643F43643F43844F4AAAFFAFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C5FC404DF53643F43643F43643F43643F4
        3643F43643F43643F43643F43643F43643F43643F43643F4404DF5C2C6FCFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEBFE868EF839
        46F43643F43643F43643F43643F43643F43643F43643F43643F43844F47982F8
        E7E8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE8EAFEAAAFFA6F78F75660F63F4BF43F4BF45660F67079F7AB
        B0FAE9EAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = SpeedRemoverClick
    end
    object EdtCodigo: TEdit
      Left = 38
      Top = 53
      Width = 73
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      OnExit = EdtCodigoExit
    end
    object EdtNome: TEdit
      Left = 121
      Top = 53
      Width = 449
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object EdtHorarioInicio: TMaskEdit
      Left = 699
      Top = 53
      Width = 61
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 3
      Text = '  :  '
    end
    object EdtAgendamento: TEdit
      Left = 8
      Top = 104
      Width = 360
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object CheckCusto: TCheckBox
      Left = 8
      Top = 131
      Width = 97
      Height = 17
      Caption = 'Haver'#225' Custo'
      TabOrder = 6
      OnClick = CheckCustoClick
    end
    object EdtValor: TEdit
      Left = 8
      Top = 173
      Width = 360
      Height = 21
      Enabled = False
      TabOrder = 7
    end
    object MemoObservacao: TMemo
      Left = 374
      Top = 104
      Width = 426
      Height = 90
      TabOrder = 8
    end
    object EdtFinal: TMaskEdit
      Left = 775
      Top = 53
      Width = 60
      Height = 21
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 4
      Text = '  :  '
      OnExit = EdtFinalExit
    end
    object EdtData: TMaskEdit
      Left = 576
      Top = 53
      Width = 86
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 209
    Width = 847
    Height = 34
    Align = alTop
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 1
    object Label10: TLabel
      Left = 12
      Top = 9
      Width = 250
      Height = 13
      Caption = #218'ltimos 5 (cincos) agendamentos do cliente '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 243
    Width = 847
    Height = 286
    Align = alTop
    DataSource = DSAgenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
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
        FieldName = 'DATA_AGENDAMENTO'
        Title.Caption = 'Data'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_AGENDAMENTO'
        Title.Caption = 'Tipo'
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
        FieldName = 'HORARIO_INICIO'
        Title.Caption = 'Hor'#225'rio in'#237'cio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HORARIO_FINAL'
        Title.Caption = 'Hor'#225'rio final'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
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
        Width = 200
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 529
    Width = 847
    Height = 41
    Align = alTop
    Caption = 'Panel3'
    ParentShowHint = False
    ShowCaption = False
    ShowHint = False
    TabOrder = 2
    object BitNovo: TBitBtn
      Left = 675
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Novo'
      Enabled = False
      Kind = bkRetry
      NumGlyphs = 2
      TabOrder = 0
      OnClick = BitNovoClick
    end
    object BitRemover: TBitBtn
      Left = 756
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Remover'
      Enabled = False
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object BitSalvar: TBitBtn
      Left = 594
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = '&Salvar'
      Enabled = False
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 2
      OnClick = BitSalvarClick
    end
  end
  object QyAgenda: TQuery
    DatabaseName = 'DMConexao'
    Left = 768
    Top = 296
  end
  object DSAgenda: TDataSource
    DataSet = QyAgenda
    Left = 768
    Top = 456
  end
  object CDSAgenda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPAgenda'
    Left = 768
    Top = 408
    object CDSAgendaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CDSAgendaDATA_AGENDAMENTO: TDateField
      FieldName = 'DATA_AGENDAMENTO'
    end
    object CDSAgendaTIPO_AGENDAMENTO: TStringField
      FieldName = 'TIPO_AGENDAMENTO'
      Size = 60
    end
    object CDSAgendaHORARIO_INICIO: TStringField
      FieldName = 'HORARIO_INICIO'
    end
    object CDSAgendaHORARIO_FINAL: TStringField
      FieldName = 'HORARIO_FINAL'
    end
    object CDSAgendaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CDSAgendaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 90
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = QyAgenda
    Left = 768
    Top = 352
  end
end
