inherited frmRelTrocaConsumiveis: TfrmRelTrocaConsumiveis
  Caption = 'Relat'#243'rio de Troca de Consum'#237'veis'
  ClientHeight = 214
  ClientWidth = 249
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 255
  ExplicitHeight = 242
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 249
    Height = 3
    Visible = False
    ExplicitWidth = 249
    ExplicitHeight = 3
  end
  inherited PainelDados: TPanel
    Top = 3
    Width = 249
    Height = 170
    ExplicitTop = 3
    ExplicitWidth = 249
    ExplicitHeight = 170
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 247
      Height = 168
      Align = alClient
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        247
        168)
      object grpData: TGroupBox
        Left = 6
        Top = 5
        Width = 252
        Height = 66
        Caption = '  Data  '
        Color = clGradientInactiveCaption
        ParentBackground = False
        ParentColor = False
        TabOrder = 0
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
      object edtImpressora: TGigatronLblEdit
        Left = 9
        Top = 91
        Width = 35
        Height = 20
        AutoSize = False
        BorderStyle = bsNone
        EditLabel.Left = 9
        EditLabel.Top = 75
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Impressora'
        CadastroButton.Left = 69
        CadastroButton.Top = 91
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
        PesquisaButton.Left = 47
        PesquisaButton.Top = 91
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
        TabOrder = 1
        OnEnter = edtImpressoraEnter
        OnExit = edtImpressoraExit
        DescrEdit.Left = 91
        DescrEdit.Top = 91
        DescrEdit.Width = 195
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
        DescrEdit.TabOrder = 3
      end
      object edtConsumivel: TGigatronLblEdit
        Left = 9
        Top = 135
        Width = 35
        Height = 20
        AutoSize = False
        BorderStyle = bsNone
        EditLabel.Left = 9
        EditLabel.Top = 119
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Consum'#237'vel'
        CadastroButton.Left = 69
        CadastroButton.Top = 135
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
        PesquisaButton.Left = 47
        PesquisaButton.Top = 135
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
        PesquisaButton.OnClick = edtConsumivelSubButtonPesquisaClick
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
        OnEnter = edtImpressoraEnter
        OnExit = edtConsumivelExit
        DescrEdit.Left = 91
        DescrEdit.Top = 135
        DescrEdit.Width = 170
        DescrEdit.Height = 20
        DescrEdit.TabStop = False
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
        DescrEdit.TabOrder = 4
        OnFrmPesquisaClose = edtConsumivelFrmPesquisaClose
      end
    end
  end
  inherited PainelBotoes: TPanel
    Top = 173
    Width = 249
    ExplicitTop = 173
    ExplicitWidth = 249
    inherited btnSair: TcxButton
      Left = 128
      Top = 8
      TabOrder = 4
      ExplicitLeft = 128
      ExplicitTop = 8
    end
    inherited btnConfirmar: TcxButton
      Left = -10
      Top = 31
      TabOrder = 1
      Visible = False
      ExplicitLeft = -10
      ExplicitTop = 31
    end
    inherited btnRetornar: TcxButton
      Left = -10
      Top = 30
      TabOrder = 2
      Visible = False
      ExplicitLeft = -10
      ExplicitTop = 30
    end
    inherited btnExcluir: TcxButton
      Left = -10
      Top = 30
      TabOrder = 3
      Visible = False
      ExplicitLeft = -10
      ExplicitTop = 30
    end
    object btnImprimir: TcxButton
      Left = 47
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
    Left = 104
    Top = 8
  end
  inherited cds: TClientDataSet
    Left = 72
    Top = 8
  end
  inherited dsp: TDataSetProvider
    Left = 40
    Top = 8
  end
  inherited sds: TSQLDataSet
    CommandText = 
      'SELECT                                  '#13#10'    TROCA.ID_TROCA,   ' +
      '                  '#13#10'    TROCA.ID_CONSUMIVEL,                '#13#10'  ' +
      '  TROCA.DATA,                          '#13#10'    TROCA.CONTADOR,'#13#10'  ' +
      '  TROCA.OBSERVACAO,                      '#13#10'    IMP.NOME,'#13#10'    CO' +
      'NS.DESC_CONSUMIVEL'#13#10'FROM CONSUMIVEIS_TROCA TROCA            '#13#10'  ' +
      '  INNER JOIN CONSUMIVEIS CONS ON      '#13#10'        TROCA.ID_CONSUMI' +
      'VEL = CONS.ID   '#13#10'    INNER JOIN IMPRESSORAS IMP ON       '#13#10'    ' +
      '    IMP.ID = CONS.ID_IMPRESSORA'
    Left = 8
    Top = 8
  end
  inherited dsDet: TDataSource
    Left = 232
    Top = 8
  end
  inherited cdsDet: TClientDataSet
    Left = 200
    Top = 8
  end
  inherited dspDet: TDataSetProvider
    Left = 168
    Top = 8
  end
  inherited sdsDet: TSQLDataSet
    Left = 136
    Top = 8
  end
  object RvProject1: TRvProject
    Engine = RvSystem
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 119
    Top = 55
  end
  object rvdsConsumiveis: TRvDataSetConnection
    LocalFilter = False
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = cds
    Left = 159
    Top = 47
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
    Left = 151
    Top = 95
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    DocInfo.Creator = 'Rave Reports (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 183
    Top = 127
  end
  object RvRenderHTML1: TRvRenderHTML
    DisplayName = 'Web Page (HTML)'
    FileExtension = '*.html;*.htm'
    ServerMode = False
    UseBreakingSpaces = True
    Left = 143
    Top = 127
  end
  object SQLDataSet1: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT                                  '#13#10'    TROCA.ID_TROCA,   ' +
      '                  '#13#10'    TROCA.ID_CONSUMIVEL,                '#13#10'  ' +
      '  TROCA.DATA,                          '#13#10'    TROCA.CONTADOR,'#13#10'  ' +
      '  TROCA.OBSERVACAO,                      '#13#10'    IMP.NOME,'#13#10'    CO' +
      'NS.DESC_CONSUMIVEL'#13#10'FROM CONSUMIVEIS_TROCA TROCA            '#13#10'  ' +
      '  INNER JOIN CONSUMIVEIS CONS ON      '#13#10'        TROCA.ID_CONSUMI' +
      'VEL = CONS.ID   '#13#10'    INNER JOIN IMPRESSORAS IMP ON       '#13#10'    ' +
      '    IMP.ID = CONS.ID_IMPRESSORA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 87
    Top = 3
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 119
    Top = 3
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 151
    Top = 3
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 183
    Top = 3
  end
  object RvProject2: TRvProject
    Engine = RvSystem1
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 119
    Top = 79
  end
  object RvDataSetConnection1: TRvDataSetConnection
    LocalFilter = False
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = ClientDataSet1
    Left = 159
    Top = 79
  end
  object RvSystem1: TRvSystem
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
    Left = 199
    Top = 79
  end
end
