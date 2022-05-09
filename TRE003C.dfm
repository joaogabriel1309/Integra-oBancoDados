object FTRE003C: TFTRE003C
  Left = 450
  Top = 234
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Cidade'
  ClientHeight = 250
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TPabPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 553
    Height = 209
    ActivePage = TabAlteracoes
    TabOrder = 0
    OnChange = TPabPrincipalChange
    object TabAlteracoes: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 24
        Top = 53
        Width = 33
        Height = 13
        Caption = 'Codigo'
      end
      object Label2: TLabel
        Left = 104
        Top = 53
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label3: TLabel
        Left = 357
        Top = 53
        Width = 57
        Height = 13
        Caption = 'Estado (UF)'
      end
      object EdtCodigo: TEdit
        Left = 24
        Top = 72
        Width = 57
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        OnClick = EdtCodigoClick
        OnExit = EdtCodigoExit
      end
      object EdtCidade: TEdit
        Left = 104
        Top = 72
        Width = 239
        Height = 21
        TabOrder = 1
      end
      object CombEstados: TComboBox
        Left = 357
        Top = 72
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 2
      end
    end
    object TabListar: TTabSheet
      Caption = 'Listar Cidades'
      ImageIndex = 1
      object StringGridCidades: TStringGrid
        Left = 0
        Top = 0
        Width = 545
        Height = 181
        Align = alClient
        ColCount = 3
        DefaultColWidth = 170
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGridCidadesDblClick
      end
    end
  end
  object BitAdicionar: TBitBtn
    Left = 240
    Top = 207
    Width = 98
    Height = 39
    Caption = 'Adicionar'
    Enabled = False
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitAdicionarClick
  end
  object BitExcluir: TBitBtn
    Left = 344
    Top = 207
    Width = 92
    Height = 39
    Caption = 'Excluir'
    Enabled = False
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitExcluirClick
  end
  object BitFechar: TBitBtn
    Left = 442
    Top = 207
    Width = 91
    Height = 39
    Caption = 'Fechar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object QyCidade: TQuery
    DatabaseName = 'DMConexao'
    Left = 496
    Top = 88
  end
end
