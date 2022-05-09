object FTRE006C: TFTRE006C
  Left = 557
  Top = 147
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Respons'#225'vel da Empresa'
  ClientHeight = 431
  ClientWidth = 573
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
  DesignSize = (
    573
    431)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 35
    Top = 11
    Width = 66
    Height = 13
    Caption = 'Tipo Inscri'#231#227'o'
  end
  object Label2: TLabel
    Left = 274
    Top = 11
    Width = 43
    Height = 13
    Caption = 'Inscri'#231#227'o'
  end
  object Label3: TLabel
    Left = 24
    Top = 48
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object Label4: TLabel
    Left = 456
    Top = 34
    Width = 106
    Height = 13
    Caption = 'C.P.F do Respons'#225'vel'
  end
  object Label5: TLabel
    Left = 456
    Top = 48
    Width = 64
    Height = 13
    Caption = 'pela Empresa'
  end
  object Label6: TLabel
    Left = 24
    Top = 104
    Width = 150
    Height = 13
    Caption = 'Respons'#225'vel pelas informa'#231#245'es'
  end
  object Label7: TLabel
    Left = 313
    Top = 104
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object Label8: TLabel
    Left = 440
    Top = 104
    Width = 31
    Height = 13
    Caption = 'C.P.F.'
  end
  object Label9: TLabel
    Left = 25
    Top = 168
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label10: TLabel
    Left = 6
    Top = 203
    Width = 65
    Height = 13
    Caption = 'Complemento'
  end
  object Label11: TLabel
    Left = 43
    Top = 234
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label12: TLabel
    Left = 51
    Top = 266
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label13: TLabel
    Left = 38
    Top = 296
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label14: TLabel
    Left = 58
    Top = 330
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label15: TLabel
    Left = 28
    Top = 362
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label16: TLabel
    Left = 251
    Top = 362
    Width = 19
    Height = 13
    Caption = 'FAX'
  end
  object Label17: TLabel
    Left = 409
    Top = 362
    Width = 33
    Height = 13
    Caption = 'Celular'
  end
  object Label18: TLabel
    Left = 337
    Top = 266
    Width = 94
    Height = 13
    Caption = 'C'#243'digo do Municipio'
  end
  object Label19: TLabel
    Left = 164
    Top = 330
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label20: TLabel
    Left = 398
    Top = 168
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object SpeedButton1: TSpeedButton
    Left = 6
    Top = 8
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
  object ComboInscricao: TComboBox
    Left = 107
    Top = 8
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnExit = ComboInscricaoExit
  end
  object EdtNumeroIncricao: TMaskEdit
    Left = 323
    Top = 8
    Width = 102
    Height = 21
    EditMask = '99-999-99.999-9/9;0;_'
    MaxLength = 17
    TabOrder = 1
    OnExit = EdtNumeroIncricaoExit
  end
  object EdtRazaoSocial: TEdit
    Left = 24
    Top = 67
    Width = 418
    Height = 21
    TabOrder = 2
  end
  object EdtCpfResponsavel: TMaskEdit
    Left = 456
    Top = 67
    Width = 102
    Height = 21
    EditMask = '###.###.###-##;0;_'
    MaxLength = 14
    TabOrder = 3
    OnExit = EdtCpfResponsavelExit
  end
  object EdtResponsavelInf: TEdit
    Left = 24
    Top = 123
    Width = 265
    Height = 21
    TabOrder = 4
  end
  object EdtDataNascimento: TMaskEdit
    Left = 313
    Top = 123
    Width = 81
    Height = 21
    EditMask = '99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  object EdtCpf: TMaskEdit
    Left = 440
    Top = 123
    Width = 103
    Height = 21
    EditMask = '999.999.999-99;0;_'
    MaxLength = 14
    TabOrder = 6
    OnExit = EdtCpfResponsavelExit
  end
  object EdtEndereco: TEdit
    Left = 76
    Top = 165
    Width = 299
    Height = 21
    TabOrder = 7
  end
  object EdtComplemento: TEdit
    Left = 76
    Top = 200
    Width = 486
    Height = 21
    TabOrder = 9
    TextHint = 'Informa'#231#227'o Opcional'
  end
  object EdtBairro: TEdit
    Left = 76
    Top = 231
    Width = 486
    Height = 21
    TabOrder = 10
  end
  object EdtCidade: TEdit
    Left = 76
    Top = 296
    Width = 486
    Height = 21
    TabOrder = 13
  end
  object ComboUF: TComboBox
    Left = 76
    Top = 327
    Width = 62
    Height = 21
    Style = csDropDownList
    ParentShowHint = False
    ShowHint = False
    TabOrder = 14
  end
  object EdtCep: TMaskEdit
    Left = 76
    Top = 263
    Width = 118
    Height = 21
    EditMask = '99999-999;0;_'
    MaxLength = 9
    TabOrder = 11
  end
  object EdtTelefone: TMaskEdit
    Left = 76
    Top = 359
    Width = 94
    Height = 21
    EditMask = '(99)99999-9999;0;_'
    MaxLength = 14
    TabOrder = 16
  end
  object EdtFAX: TMaskEdit
    Left = 276
    Top = 359
    Width = 95
    Height = 21
    EditMask = '(99)99999-9999;0;_'
    MaxLength = 14
    TabOrder = 17
  end
  object EdtCelular: TMaskEdit
    Left = 448
    Top = 359
    Width = 93
    Height = 21
    EditMask = '(99)99999-9999;0;_'
    MaxLength = 14
    TabOrder = 18
  end
  object EdtCodigoMunicipio: TEdit
    Left = 437
    Top = 263
    Width = 125
    Height = 21
    NumbersOnly = True
    TabOrder = 12
    TextHint = 'Informa'#231#227'o Opcional'
  end
  object BitOK: TBitBtn
    Left = 155
    Top = 398
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 19
    OnClick = BitOKClick
  end
  object BitSair: TBitBtn
    Left = 464
    Top = 398
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Anchors = [akRight, akBottom]
    Caption = '&Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 20
    OnClick = BitSairClick
  end
  object EdtEmail: TEdit
    Left = 198
    Top = 327
    Width = 364
    Height = 21
    TabOrder = 15
    TextHint = 'Ex: Paulo@gmail.com'
  end
  object EdtNumeroEndereco: TEdit
    Left = 441
    Top = 165
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 8
  end
  object BitLimpar: TBitBtn
    Left = 258
    Top = 398
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Caption = '&Limpar'
    Enabled = False
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 21
    OnClick = BitLimparClick
  end
  object BitExcluir: TBitBtn
    Left = 361
    Top = 398
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Caption = 'Excluir'
    Enabled = False
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 22
    OnClick = BitExcluirClick
  end
  object QyResponsavel: TQuery
    DatabaseName = 'DMConexao'
    Left = 16
    Top = 384
  end
end
