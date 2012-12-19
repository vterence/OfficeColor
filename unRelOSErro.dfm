inherited frmRelOSErro: TfrmRelOSErro
  Caption = 'Relat'#243'rio de OS com Erro'
  ClientHeight = 304
  ClientWidth = 266
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 272
  ExplicitHeight = 332
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 266
    Height = 4
    Visible = False
    ExplicitWidth = 266
    ExplicitHeight = 4
    inherited btnNovo: TcxButton
      TabOrder = 2
    end
    inherited btnBusca: TcxButton
      TabOrder = 1
    end
  end
  inherited PainelDados: TPanel
    Top = 4
    Width = 266
    Height = 259
    ExplicitTop = 4
    ExplicitWidth = 266
    ExplicitHeight = 259
    object grpOrdenar: TcxRadioGroup
      Left = 6
      Top = 196
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Ordenar Por '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'C'#243'digo'
          Value = '0'
        end
        item
          Caption = 'Cliente'
          Value = '1'
        end
        item
          Caption = 'Data'
          Value = '2'
        end
        item
          Caption = 'Qtd Paginas'
          Value = '3'
        end>
      ItemIndex = 0
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Height = 55
      Width = 254
    end
    object edtUsuario: TGigatronLblEdit
      Left = 12
      Top = 170
      Width = 80
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      EditLabel.Left = 12
      EditLabel.Top = 154
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Usuario'
      CadastroButton.Left = 117
      CadastroButton.Top = 170
      CadastroButton.Width = 20
      CadastroButton.Height = 20
      CadastroButton.Flat = True
      CadastroButton.Font.Charset = DEFAULT_CHARSET
      CadastroButton.Font.Color = clWindowText
      CadastroButton.Font.Height = -11
      CadastroButton.Font.Name = 'courier new'
      CadastroButton.Font.Style = []
      CadastroButton.NumGlyphs = 2
      CadastroButton.ParentFont = False
      PesquisaButton.Left = 95
      PesquisaButton.Top = 170
      PesquisaButton.Width = 20
      PesquisaButton.Height = 20
      PesquisaButton.Flat = True
      PesquisaButton.Font.Charset = DEFAULT_CHARSET
      PesquisaButton.Font.Color = clWindowText
      PesquisaButton.Font.Height = -11
      PesquisaButton.Font.Name = 'courier new'
      PesquisaButton.Font.Style = []
      PesquisaButton.NumGlyphs = 2
      PesquisaButton.ParentFont = False
      PesquisaButton.OnClick = edtUsuarioSubButtonPesquisaClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      ParentFont = False
      TabOrder = 3
      OnEnter = edtClienteEnter
      OnExit = edtUsuarioExit
      DescrEdit.Left = 139
      DescrEdit.Top = 170
      DescrEdit.Width = 127
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 5
    end
    object edtImpressora: TGigatronLblEdit
      Left = 12
      Top = 130
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 12
      EditLabel.Top = 114
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Impressora'
      CadastroButton.Left = 72
      CadastroButton.Top = 130
      CadastroButton.Width = 20
      CadastroButton.Height = 20
      CadastroButton.Flat = True
      CadastroButton.Font.Charset = DEFAULT_CHARSET
      CadastroButton.Font.Color = clWindowText
      CadastroButton.Font.Height = -11
      CadastroButton.Font.Name = 'courier new'
      CadastroButton.Font.Style = []
      CadastroButton.NumGlyphs = 2
      CadastroButton.ParentFont = False
      PesquisaButton.Left = 50
      PesquisaButton.Top = 130
      PesquisaButton.Width = 20
      PesquisaButton.Height = 20
      PesquisaButton.Flat = True
      PesquisaButton.Font.Charset = DEFAULT_CHARSET
      PesquisaButton.Font.Color = clWindowText
      PesquisaButton.Font.Height = -11
      PesquisaButton.Font.Name = 'courier new'
      PesquisaButton.Font.Style = []
      PesquisaButton.NumGlyphs = 2
      PesquisaButton.ParentFont = False
      PesquisaButton.OnClick = edtImpressoraSubButtonPesquisaClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      ParentFont = False
      TabOrder = 2
      OnEnter = edtClienteEnter
      OnExit = edtImpressoraExit
      DescrEdit.Left = 94
      DescrEdit.Top = 130
      DescrEdit.Width = 172
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 6
    end
    object edtCliente: TGigatronLblEdit
      Left = 12
      Top = 90
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 12
      EditLabel.Top = 74
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cliente'
      CadastroButton.Left = 72
      CadastroButton.Top = 90
      CadastroButton.Width = 20
      CadastroButton.Height = 20
      CadastroButton.Flat = True
      CadastroButton.Font.Charset = DEFAULT_CHARSET
      CadastroButton.Font.Color = clWindowText
      CadastroButton.Font.Height = -11
      CadastroButton.Font.Name = 'courier new'
      CadastroButton.Font.Style = []
      CadastroButton.NumGlyphs = 2
      CadastroButton.ParentFont = False
      PesquisaButton.Left = 50
      PesquisaButton.Top = 90
      PesquisaButton.Width = 20
      PesquisaButton.Height = 20
      PesquisaButton.Flat = True
      PesquisaButton.Font.Charset = DEFAULT_CHARSET
      PesquisaButton.Font.Color = clWindowText
      PesquisaButton.Font.Height = -11
      PesquisaButton.Font.Name = 'courier new'
      PesquisaButton.Font.Style = []
      PesquisaButton.NumGlyphs = 2
      PesquisaButton.ParentFont = False
      PesquisaButton.OnClick = edtClienteSubButtonPesquisaClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      ParentFont = False
      TabOrder = 1
      OnEnter = edtClienteEnter
      OnExit = edtClienteExit
      DescrEdit.Left = 94
      DescrEdit.Top = 90
      DescrEdit.Width = 172
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 7
    end
    object grpData: TGroupBox
      Left = 6
      Top = 5
      Width = 254
      Height = 66
      Anchors = [akLeft, akTop, akRight]
      Caption = '  Data  '
      Color = clGradientInactiveCaption
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        254
        66)
      object Label2: TLabel
        Left = 14
        Top = 19
        Width = 27
        Height = 13
        Caption = 'Inicial'
      end
      object Label1: TLabel
        Left = 136
        Top = 19
        Width = 22
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Final'
        ExplicitLeft = 134
      end
      object edtDataInicial: TcxDateEdit
        Left = 12
        Top = 33
        Properties.InputKind = ikRegExpr
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonStyle = btsSimple
        Style.ButtonTransparency = ebtAlways
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        Width = 98
      end
      object edtDataFinal: TcxDateEdit
        Left = 134
        Top = 33
        Anchors = [akTop, akRight]
        Properties.InputKind = ikRegExpr
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonStyle = btsSimple
        Style.ButtonTransparency = ebtAlways
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        Width = 98
      end
    end
  end
  inherited PainelBotoes: TPanel
    Top = 263
    Width = 266
    ExplicitTop = 263
    ExplicitWidth = 266
    inherited btnSair: TcxButton
      Left = 136
      Top = 8
      Anchors = [akBottom]
      TabOrder = 4
      ExplicitLeft = 136
      ExplicitTop = 8
    end
    inherited btnConfirmar: TcxButton
      Left = -48
      Top = 31
      TabOrder = 1
      Visible = False
      ExplicitLeft = -48
      ExplicitTop = 31
    end
    inherited btnRetornar: TcxButton
      Left = -28
      Top = 31
      TabOrder = 2
      Visible = False
      ExplicitLeft = -28
      ExplicitTop = 31
    end
    inherited btnExcluir: TcxButton
      Left = -28
      Top = 31
      TabOrder = 3
      Visible = False
      ExplicitLeft = -28
      ExplicitTop = 31
    end
    object btnImprimir: TcxButton
      Left = 55
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Imprimir'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000B0B0B0F1A1A1A211B1B1B211B1B1B211B1B1B211B1B1B211B1B
        1B211B1B1B211A1A1B210B0B0B0F000000000000000000000000000000070605
        05300A09084F35343387ACACADDDC2C2C3E0BABABCE0B9B9BBE0B9B9BBE0B8B8
        BAE0BBBBBCE0ADADADDD353333860A09084F0606053200000007020201114846
        44B5747372F66F6E6DF68D8D8DFEADADAEFFA8A8AAFFA8A8AAFFA8A8AAFFA7A7
        A9FFA9A9AAFF8C8C8BFE6E6E6DF6747372F6484644B402010110060504167675
        73CAAEAEAEFF929292FF575757FF5C5D5CFF5C5C5CFF5B5B5BFF5B5B5BFF5B5C
        5CFF5C5C5CFF565656FF929292FFAEAEAEFF73716FC405040313090808168F8F
        8DCACDCDCDFFCACACAFFC0C0C0FFC2C2C2FFC8C8C8FFCDCDCDFFCECECEFFCACA
        CAFFC4C4C4FFC1C1C1FFCBCBCBFFCDCDCDFF8A8987C307070613090808139E9D
        9BC5E3E3E3FFE3E3E3FFE4E4E4FFE6E6E7FFEAEAEAFFEDEDEDFFEEEEEEFFEBEB
        EBFFE8E8E8FFE0E3E3FFD8E1DFFFE3E3E3FF989796BF07070610000000047776
        749CE0E0E0FFDDDDDDFFDDDDDDFFDFDFDFFFE2E2E2FFE4E4E4FFE4E5E5FFE3E3
        E3FFE2E0E0FFB6D8D0FF92D2C4FFE0E0E0FF7473719900000003000000002524
        2243AFAEADEAC4C4C4FFC1C1C1FFC1C1C1FFC2C3C3FFC4C4C4FFC4C4C4FFC3C3
        C3FFC2C2C2FFBBC0BFFFBBC3C1FFAFAEADEA2523224300000000000000000000
        00042F2D2B6C8F8D8BE2A7A5A4FBACAAA9FFACABAAFFADACAAFFADACABFFADAB
        AAFFACAAA9FFA8A6A5FC8F8D8BE22F2D2B6C0000000400000000000000000000
        0000000000022F2F2E5092918FD8C6C5C4FFCBCAC8FFCDCCCAFFCCCBCAFFCBCA
        C8FFC6C5C3FF929290D92E2E2D4F000000020000000000000000000000000000
        00000000000034343435B1B1B1CFF3F3F3FFF7F7F8FFF9F9F9FFF9F9F9FFF8F8
        F8FFF4F4F4FFB2B2B2CF34343435000000000000000000000000000000000000
        00000000000036363637B1B1B1D0F0F0F0FFF3F3F3FFF4F4F4FFF5F5F5FFF4F4
        F4FFF1F1F1FFB2B2B2D036363637000000000000000000000000000000000000
        00000000000024242425A5A5A5C5EFEFEFFFF2F2F2FFF2F2F2FFF3F3F3FFF3F3
        F3FFE9E9E9FFA0A0A0C524242425000000000000000000000000000000000000
        00000000000000000000828282A2EEEEEEFFF1F1F1FFF0F0F0FFF2F2F2FFE3E3
        E3FFB3B3B3F64848486E00000000000000000000000000000000000000000000
        000000000000000000006C6C6C8EC3C3C3E4C1C1C1E0C1C1C1E0C0C0C0E0A6A6
        A6DE4C4C4C7C0404040800000000000000000000000000000000000000000000
        000000000000000000000E0E0E15161616221616162116161621151515211212
        121F050505090000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfFlat
      TabOrder = 0
      OnClick = btnImprimirClick
    end
  end
  inherited ds: TDataSource
    Left = 103
    Top = 3
  end
  inherited cds: TClientDataSet
    Left = 71
    Top = 3
  end
  inherited dsp: TDataSetProvider
    Left = 39
    Top = 3
  end
  inherited sds: TSQLDataSet
    Left = 7
    Top = 3
  end
  inherited dsDet: TDataSource
    Left = 256
    Top = 8
  end
  inherited cdsDet: TClientDataSet
    Left = 224
    Top = 8
  end
  inherited dspDet: TDataSetProvider
    Left = 192
    Top = 8
  end
  inherited sdsDet: TSQLDataSet
    Left = 160
    Top = 8
  end
  inherited XPManifest1: TXPManifest
    Left = 304
    Top = 0
  end
  object rvdsOS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    DataSet = cds
    Left = 191
    Top = 143
  end
  object rvdsDetalhe: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    Left = 111
    Top = 143
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 191
    Top = 111
  end
  object RvProject1: TRvProject
    Engine = RvSystem
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 111
    Top = 111
  end
end
