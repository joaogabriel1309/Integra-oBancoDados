object FTRE001C: TFTRE001C
  Left = 399
  Top = 244
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Atividade'
  ClientHeight = 236
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    428
    236)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtnFECHAR: TBitBtn
    Left = 346
    Top = 201
    Width = 74
    Height = 27
    Anchors = [akRight, akBottom]
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 3
  end
  object BitBtnOK: TBitBtn
    Left = 185
    Top = 201
    Width = 74
    Height = 27
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtnOKClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 416
    Height = 185
    ActivePage = TabSheet1
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 3
        Top = 53
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 55
        Top = 53
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object EDT_CODIGO: TEdit
        Left = 3
        Top = 72
        Width = 46
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        OnClick = EDT_CODIGOClick
        OnExit = EDT_CODIGOExit
      end
      object EDT_DESCRICAO: TEdit
        Left = 55
        Top = 72
        Width = 322
        Height = 21
        TabOrder = 1
      end
    end
    object TabSheetConsulta: TTabSheet
      Caption = 'Consulta'
      ImageIndex = 1
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 408
        Height = 157
        Align = alClient
        ColCount = 2
        DefaultColWidth = 190
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnDblClick = StringGrid1DblClick
        ExplicitHeight = 180
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 265
    Top = 201
    Width = 75
    Height = 27
    Anchors = [akRight, akBottom]
    Caption = 'Excluir'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object QyAtividade: TQuery
    DatabaseName = 'DMConexao'
    Left = 384
    Top = 32
  end
end
