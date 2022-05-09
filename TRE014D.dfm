object FTRE014D: TFTRE014D
  Left = 312
  Top = 137
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Destaque do M'#234's'
  ClientHeight = 479
  ClientWidth = 719
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 417
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 147
      Height = 14
      Caption = 'Destaques do m'#234's atual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 27
      Width = 717
      Height = 389
      Align = alCustom
      DataSource = DSDestaqueMes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
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
          Width = 225
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Motivo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 225
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
          Width = 225
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 417
    Width = 719
    Height = 72
    Align = alTop
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 1
    object EdtPesquisa: TEdit
      Left = 1
      Top = 1
      Width = 717
      Height = 21
      Align = alTop
      TabOrder = 0
      OnChange = FormShow
    end
    object BitBtn1: TBitBtn
      Left = 624
      Top = 30
      Width = 83
      Height = 25
      Cursor = crHandPoint
      Caption = '&Fechar'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 1
    end
    object CBEspecifico: TCheckBox
      Left = 8
      Top = 30
      Width = 161
      Height = 17
      Caption = 'Selecionar um m'#234's especifico'
      TabOrder = 2
      OnClick = CBEspecificoClick
    end
    object EdtMesEsp: TMaskEdit
      Left = 175
      Top = 28
      Width = 58
      Height = 21
      EditMask = '0000-00;1;_'
      MaxLength = 7
      TabOrder = 3
      Text = '    -  '
      Visible = False
    end
    object BitConsultar: TBitBtn
      Left = 247
      Top = 28
      Width = 90
      Height = 25
      Caption = '&Consultar'
      Kind = bkYes
      NumGlyphs = 2
      TabOrder = 4
      Visible = False
      OnClick = FormShow
    end
  end
  object QyDestaqueMes: TQuery
    DatabaseName = 'DMConexao'
    Left = 528
    Top = 168
  end
  object DSDestaqueMes: TDataSource
    DataSet = QyDestaqueMes
    Left = 536
    Top = 232
  end
end
