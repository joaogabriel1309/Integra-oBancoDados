object FTRE005C: TFTRE005C
  Left = 392
  Top = 276
  Anchors = [akRight, akBottom]
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Cadastro de Produto'
  ClientHeight = 310
  ClientWidth = 427
  Color = 2894892
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 43
    Height = 14
    Caption = 'Codigo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 61
    Width = 57
    Height = 14
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 44
    Height = 14
    Caption = 'Medida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 216
    Top = 128
    Width = 36
    Height = 14
    Caption = 'Marca'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 172
    Width = 91
    Height = 14
    Caption = 'Pre'#231'o de custo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 216
    Top = 172
    Width = 94
    Height = 14
    Caption = 'Pre'#231'o de venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtCodigo: TEdit
    Left = 8
    Top = 33
    Width = 57
    Height = 22
    Color = 7368816
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 0
    OnExit = EdtCodigoExit
  end
  object MemoDescricao: TMemo
    Left = 8
    Top = 81
    Width = 402
    Height = 41
    Color = 7368816
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object RGStatus: TRadioGroup
    Left = 79
    Top = 21
    Width = 233
    Height = 42
    Caption = 'Status'
    Color = 7368816
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Indisponivel'
      'Disponivel')
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
  object ComboMedida: TComboBox
    Left = 8
    Top = 144
    Width = 194
    Height = 22
    Color = 7368816
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ComboMarca: TComboBox
    Left = 216
    Top = 144
    Width = 194
    Height = 22
    Color = 7368816
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object EdtPrecoCusto: TEdit
    Left = 8
    Top = 192
    Width = 194
    Height = 22
    Color = 7368816
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object EdtPrecoVenda: TEdit
    Left = 216
    Top = 192
    Width = 194
    Height = 22
    Color = 7368816
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object BitOK: TEdit
    Left = 208
    Top = 239
    Width = 98
    Height = 27
    Cursor = crHandPoint
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = '    Salvar'
    OnClick = BitOKClick
    OnEnter = BitOKEnter
    OnExit = BitOKExit
    OnKeyDown = BitOKKeyDown
    OnMouseLeave = BitOKMouseLeave
    OnMouseMove = BitOKMouseMove
  end
  object BitExcluir: TEdit
    Left = 312
    Top = 239
    Width = 98
    Height = 27
    Cursor = crHandPoint
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    Text = '  Remover'
    OnClick = BitExcluirClick
    OnEnter = BitExcluirEnter
    OnExit = BitExcluirExit
    OnKeyDown = BitExcluirKeyDown
    OnMouseLeave = BitExcluirMouseLeave
    OnMouseMove = BitExcluirMouseMove
  end
  object BitListar: TEdit
    Left = 104
    Top = 239
    Width = 98
    Height = 27
    Cursor = crHandPoint
    Color = clPurple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
    Text = '     Listar'
    OnClick = BitListarClick
    OnMouseLeave = BitListarMouseLeave
    OnMouseMove = BitListarMouseMove
  end
  object Panel1: TPanel
    Left = 400
    Top = 8
    Width = 19
    Height = 18
    Cursor = crHandPoint
    Caption = ' X'
    Color = clRed
    ParentBackground = False
    TabOrder = 10
    OnClick = Panel1Click
  end
  object QyProduto: TQuery
    DatabaseName = 'DMConexao'
    Left = 56
    Top = 224
  end
end
