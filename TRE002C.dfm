object FTRE002C: TFTRE002C
  Left = 410
  Top = 240
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Estado'
  ClientHeight = 241
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitAdicionar: TBitBtn
    Left = 184
    Top = 199
    Width = 87
    Height = 34
    Caption = 'Adicionar'
    Kind = bkYes
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitAdicionarClick
  end
  object BitRemover: TBitBtn
    Left = 277
    Top = 199
    Width = 83
    Height = 34
    Caption = 'Remover'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitRemoverClick
  end
  object BitFechar: TBitBtn
    Left = 366
    Top = 199
    Width = 89
    Height = 34
    Caption = 'Fechar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitFecharClick
  end
  object PagPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 465
    Height = 193
    ActivePage = TabListar
    TabOrder = 3
    OnChange = PagPrincipalChange
    object TabAlteracoes: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 24
        Top = 47
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label2: TLabel
        Left = 104
        Top = 47
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label3: TLabel
        Left = 323
        Top = 47
        Width = 25
        Height = 13
        Caption = 'ICMS'
      end
      object EdtUf: TEdit
        Left = 24
        Top = 66
        Width = 57
        Height = 21
        TabOrder = 0
        OnExit = EdtUfExit
      end
      object EdtEstado: TEdit
        Left = 104
        Top = 66
        Width = 201
        Height = 21
        TabOrder = 1
      end
      object EdtICMS: TEdit
        Left = 323
        Top = 66
        Width = 65
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
    end
    object TabListar: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 457
        Height = 165
        Align = alClient
        ColCount = 3
        DefaultColWidth = 139
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
      end
    end
  end
  object QyEstado: TQuery
    DatabaseName = 'DMConexao'
    Left = 432
    Top = 24
  end
end
