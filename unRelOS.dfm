inherited frmRelOS: TfrmRelOS
  Caption = 'Relat'#243'rio de OS'
  ClientHeight = 369
  ClientWidth = 266
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 282
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  object PainelCodigo: TPanel
    Left = 0
    Top = 0
    Width = 266
    Height = 323
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      266
      323)
    object grpData: TGroupBox
      Left = 6
      Top = 5
      Width = 252
      Height = 66
      Anchors = [akLeft, akTop, akRight]
      Caption = '  Data  '
      Color = clGradientInactiveCaption
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        252
        66)
      object Label2: TLabel
        Left = 14
        Top = 19
        Width = 27
        Height = 13
        Caption = 'Inicial'
      end
      object Label1: TLabel
        Left = 134
        Top = 19
        Width = 22
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Final'
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
        Left = 132
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
    object grpStatus: TcxRadioGroup
      Left = 6
      Top = 71
      Anchors = [akLeft, akTop, akRight]
      Caption = '  Status  '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Aberta'
          Value = '0'
        end
        item
          Caption = 'Execu'#231#227'o'
          Value = '1'
        end
        item
          Caption = 'Encerrada'
          Value = '2'
        end
        item
          Caption = 'Todas'
          Value = '4'
        end>
      ItemIndex = 3
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Height = 55
      Width = 252
    end
    object edtCliente: TGigatronLblEdit
      Left = 12
      Top = 145
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 12
      EditLabel.Top = 129
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cliente'
      CadastroButton.Left = 72
      CadastroButton.Top = 145
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
      PesquisaButton.Top = 145
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
      TabOrder = 2
      OnEnter = edtClienteEnter
      OnExit = edtClienteExit
      DescrEdit.Left = 94
      DescrEdit.Top = 145
      DescrEdit.Width = 170
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
      OnFrmPesquisaClose = edtClienteFrmPesquisaClose
    end
    object edtImpressora: TGigatronLblEdit
      Left = 12
      Top = 185
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 12
      EditLabel.Top = 169
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Impressora'
      CadastroButton.Left = 72
      CadastroButton.Top = 185
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
      PesquisaButton.Top = 185
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
      TabOrder = 3
      OnEnter = edtClienteEnter
      OnExit = edtImpressoraExit
      DescrEdit.Left = 94
      DescrEdit.Top = 185
      DescrEdit.Width = 170
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
      OnFrmPesquisaClose = edtClienteFrmPesquisaClose
    end
    object rdgTipo: TcxRadioGroup
      Left = 6
      Top = 252
      Anchors = [akLeft, akTop, akRight]
      Caption = '  Tipo  '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'OS'
          Value = '0'
        end
        item
          Caption = 'Prova'
          Value = '1'
        end
        item
          Caption = 'Teste de Cor'
          Value = '2'
        end
        item
          Caption = 'Arquivo Interno'
          Value = '3'
        end
        item
          Caption = 'Cortesia'
          Value = '4'
        end
        item
          Caption = 'Todas'
          Value = '5'
        end>
      ItemIndex = 0
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 8
      Height = 66
      Width = 252
    end
    object edtUsuario: TGigatronLblEdit
      Left = 12
      Top = 225
      Width = 80
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      EditLabel.Left = 12
      EditLabel.Top = 209
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Usuario'
      CadastroButton.Left = 117
      CadastroButton.Top = 225
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
      PesquisaButton.Top = 225
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
      TabOrder = 4
      OnEnter = edtClienteEnter
      OnExit = edtUsuarioExit
      DescrEdit.Left = 139
      DescrEdit.Top = 225
      DescrEdit.Width = 125
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
      OnFrmPesquisaClose = edtClienteFrmPesquisaClose
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 323
    Width = 266
    Height = 46
    Align = alBottom
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      266
      46)
    object btnSair: TcxButton
      Left = 137
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FF00009A174AFD103BF400009AFF00FFFF
        00FFFF00FFFF00FF00009A002CF80030FC00009AFF00FFFF00FFFF00FFFF00FF
        00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
        F300009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A1C47F61B4DFF143EF400
        009A00009A002DF80134FF032BF200009AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1A48F913
        42FF0C3CFF0733F600009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A2E5BF92C5FFF22
        4DF8204BF82355FF1B46F600009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
        9AFF00FFFF00FFFF00FFFF00FFFF00FF00009A4071FA4274FF325DF100009AFF
        00FFFF00FF00009A224DF1275AFF204CF800009AFF00FFFF00FFFF00FFFF00FF
        00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
        FA00009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfFlat
      TabOrder = 1
      OnClick = btnSairClick
    end
    object btnImprimir: TcxButton
      Left = 54
      Top = 10
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
  object rvdsOS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    DataSet = cds
    Left = 191
    Top = 143
  end
  object RvRenderHTML1: TRvRenderHTML
    DisplayName = 'Web Page (HTML)'
    FileExtension = '*.html;*.htm'
    ServerMode = False
    UseBreakingSpaces = True
    Left = 191
    Top = 191
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    DocInfo.Creator = 'Rave Reports (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 231
    Top = 191
  end
  object sds: TSQLDataSet
    SchemaName = 'sysdba'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 127
    Top = 123
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 159
    Top = 123
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 191
    Top = 123
  end
  object ds: TDataSource
    DataSet = cds
    Left = 223
    Top = 123
  end
  object sdsDet: TSQLDataSet
    SchemaName = 'sysdba'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 135
    Top = 59
  end
  object dspDet: TDataSetProvider
    DataSet = sdsDet
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 167
    Top = 59
  end
  object cdsDet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDet'
    AfterClose = cdsDetAfterClose
    Left = 199
    Top = 59
  end
  object dsDet: TDataSource
    DataSet = cdsDet
    Left = 231
    Top = 59
  end
  object rvdsDetalhe: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    DataSet = cdsDet
    Left = 111
    Top = 143
  end
  object RvProject1: TRvProject
    Engine = RvSystem
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 151
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
    Left = 231
    Top = 143
  end
end
