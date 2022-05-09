object FTRE004C: TFTRE004C
  Left = 418
  Top = 258
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Bairro'
  ClientHeight = 234
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    533
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object Adicionar: TBitBtn
    Left = 256
    Top = 198
    Width = 84
    Height = 28
    Anchors = [akRight, akBottom]
    Caption = 'Adicionar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = AdicionarClick
  end
  object Excluir: TBitBtn
    Left = 346
    Top = 198
    Width = 86
    Height = 28
    Anchors = [akRight, akBottom]
    Caption = 'Excluir'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = ExcluirClick
  end
  object Sair: TBitBtn
    Left = 438
    Top = 198
    Width = 83
    Height = 28
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 2
  end
  object TPagPrincipal: TPageControl
    Left = 0
    Top = -1
    Width = 537
    Height = 193
    ActivePage = PagListar
    TabOrder = 3
    OnChange = TPagPrincipalChange
    object PagCadastro: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 16
        Top = 53
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 96
        Top = 53
        Width = 73
        Height = 13
        Caption = 'Nome do Bairro'
      end
      object Label3: TLabel
        Left = 304
        Top = 53
        Width = 33
        Height = 13
        Caption = 'Regi'#227'o'
      end
      object EdtCodigo: TEdit
        Left = 16
        Top = 72
        Width = 57
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        OnClick = EdtCodigoClick
        OnExit = EdtCodigoExit
      end
      object EdtBairro: TEdit
        Left = 96
        Top = 72
        Width = 185
        Height = 21
        TabOrder = 1
      end
      object EdtRegiao: TEdit
        Left = 304
        Top = 72
        Width = 166
        Height = 21
        TabOrder = 2
      end
    end
    object PagListar: TTabSheet
      Caption = 'Listar'
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 165
        Align = alClient
        ColCount = 3
        DefaultColWidth = 170
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
      end
    end
  end
  object QyBairro: TQuery
    DatabaseName = 'DMConexao'
    Left = 496
    Top = 24
  end
end
