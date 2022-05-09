object FTRE600E: TFTRE600E
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Vendas'
  ClientHeight = 410
  ClientWidth = 692
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = 'C'#243'digo Venda'
  end
  object Label2: TLabel
    Left = 39
    Top = 53
    Width = 84
    Height = 13
    Caption = 'C'#243'digo do Cliente'
  end
  object Label3: TLabel
    Left = 151
    Top = 53
    Width = 78
    Height = 13
    Caption = 'Nome do Cliente'
  end
  object Label4: TLabel
    Left = 527
    Top = 8
    Width = 58
    Height = 13
    Caption = 'Data e Hora'
  end
  object Label5: TLabel
    Left = 8
    Top = 109
    Width = 102
    Height = 13
    Caption = 'Forma de Pagamento'
  end
  object Label6: TLabel
    Left = 40
    Top = 173
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label7: TLabel
    Left = 130
    Top = 173
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label8: TLabel
    Left = 360
    Top = 173
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label9: TLabel
    Left = 469
    Top = 173
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label10: TLabel
    Left = 8
    Top = 357
    Width = 99
    Height = 13
    Caption = 'Quantidade de Itens'
  end
  object Label11: TLabel
    Left = 152
    Top = 358
    Width = 67
    Height = 13
    Caption = 'Desconto (%)'
  end
  object Label12: TLabel
    Left = 296
    Top = 357
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object Label13: TLabel
    Left = 96
    Top = 8
    Width = 92
    Height = 13
    Caption = 'C'#243'digo da Empresa'
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 72
    Width = 25
    Height = 21
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
    Top = 192
    Width = 25
    Height = 21
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
  object EdtCodigoVenda: TEdit
    Left = 8
    Top = 24
    Width = 66
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    OnEnter = EdtCodigoVendaEnter
    OnExit = EdtCodigoVendaExit
  end
  object EdtCodigoCliente: TEdit
    Left = 39
    Top = 72
    Width = 97
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnExit = EdtCodigoClienteExit
  end
  object EdtNomeCliente: TEdit
    Left = 151
    Top = 72
    Width = 265
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object EdtData: TEdit
    Left = 527
    Top = 24
    Width = 156
    Height = 21
    Enabled = False
    TabOrder = 14
  end
  object ComboFormaPagamento: TComboBox
    Left = 8
    Top = 128
    Width = 297
    Height = 21
    Style = csDropDownList
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    OnExit = ComboFormaPagamentoExit
  end
  object EdtCodigoProduto: TEdit
    Left = 40
    Top = 192
    Width = 66
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    OnExit = EdtCodigoProdutoExit
  end
  object EdtProduto: TEdit
    Left = 128
    Top = 192
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 12
  end
  object EdtPreco: TEdit
    Left = 360
    Top = 192
    Width = 89
    Height = 21
    Enabled = False
    TabOrder = 15
  end
  object EdtQuantidade: TEdit
    Left = 469
    Top = 192
    Width = 65
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
  object StringGridProdutos: TStringGrid
    Left = 8
    Top = 232
    Width = 675
    Height = 120
    TabStop = False
    DefaultColWidth = 130
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 7
    OnDblClick = StringGridProdutosDblClick
  end
  object EdtQuantidadeItens: TEdit
    Left = 8
    Top = 376
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 16
    Text = '0'
  end
  object EdtDesconto: TEdit
    Left = 152
    Top = 376
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '0'
    OnExit = EdtDescontoExit
  end
  object EdtValorTotal: TEdit
    Left = 296
    Top = 376
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 17
    Text = '0'
  end
  object BitConfirmar: TBitBtn
    Left = 446
    Top = 374
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Salvar'
    Enabled = False
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 9
    OnClick = BitConfirmarClick
  end
  object BitCancelar: TBitBtn
    Left = 527
    Top = 374
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Cancelar'
    Enabled = False
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 10
    OnClick = BitCancelarClick
  end
  object BitFechar: TBitBtn
    Left = 608
    Top = 374
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Fechar'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 11
    OnClick = BitFecharClick
  end
  object BitAdicionar: TBitBtn
    Left = 559
    Top = 190
    Width = 34
    Height = 25
    Cursor = crHandPoint
    Caption = '+'
    Enabled = False
    TabOrder = 5
    OnClick = BitAdicionarClick
  end
  object BitRemover: TBitBtn
    Left = 599
    Top = 190
    Width = 34
    Height = 25
    Cursor = crHandPoint
    Caption = '-'
    Enabled = False
    TabOrder = 6
    OnClick = BitRemoverClick
  end
  object EdtCodigoEmpresa: TEdit
    Left = 96
    Top = 24
    Width = 31
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 18
    Text = '1'
  end
  object QyVendas: TQuery
    DatabaseName = 'DMConexao'
    Left = 648
    Top = 48
  end
end
