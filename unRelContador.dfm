inherited frmRelContador: TfrmRelContador
  Caption = 'Relat'#243'rio de Contador'
  ClientHeight = 203
  ClientWidth = 265
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 271
  ExplicitHeight = 231
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 265
    Height = 3
    Visible = False
    ExplicitWidth = 265
    ExplicitHeight = 3
  end
  inherited PainelDados: TPanel
    Top = 3
    Width = 265
    Height = 159
    ExplicitTop = 161
    ExplicitWidth = 265
    ExplicitHeight = 5
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 263
      Height = 157
      Align = alClient
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 274
      ExplicitHeight = 161
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
        OnEnter = edtImpressoraEnter
        OnExit = edtImpressoraExit
        DescrEdit.Left = 94
        DescrEdit.Top = 130
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
        DescrEdit.TabOrder = 3
        OnFrmPesquisaClose = edtImpressoraFrmPesquisaClose
      end
      object grpStatus: TcxRadioGroup
        Left = 6
        Top = 71
        Caption = '  Contador  '
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = 'Fechado'
            Value = '0'
          end
          item
            Caption = 'Todos'
            Value = '1'
          end>
        ItemIndex = 1
        Style.BorderColor = clGradientActiveCaption
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        Height = 39
        Width = 252
      end
    end
  end
  inherited PainelBotoes: TPanel
    Top = 162
    Width = 265
    ExplicitTop = 166
    ExplicitWidth = 265
    inherited btnSair: TcxButton
      Left = 136
      Top = 8
      Anchors = [akBottom]
      TabOrder = 1
      ExplicitLeft = 136
      ExplicitTop = 8
    end
    inherited btnConfirmar: TcxButton
      Left = -48
      Top = 23
      TabOrder = 2
      Visible = False
      ExplicitLeft = -48
      ExplicitTop = 23
    end
    inherited btnRetornar: TcxButton
      Left = -32
      Top = 22
      TabOrder = 3
      Visible = False
      ExplicitLeft = -32
      ExplicitTop = 22
    end
    inherited btnExcluir: TcxButton
      Left = -43
      Top = 22
      TabOrder = 4
      Visible = False
      ExplicitLeft = -43
      ExplicitTop = 22
    end
    object btnImprimir: TcxButton
      Left = 55
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akBottom]
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
    Left = 111
    Top = 11
  end
  inherited cds: TClientDataSet
    Left = 79
    Top = 11
  end
  inherited dsp: TDataSetProvider
    Left = 47
    Top = 11
  end
  inherited sds: TSQLDataSet
    Left = 15
    Top = 11
  end
  inherited dsDet: TDataSource
    Left = 232
    Top = 0
  end
  inherited cdsDet: TClientDataSet
    Left = 200
    Top = 0
  end
  inherited dspDet: TDataSetProvider
    Left = 168
    Top = 0
  end
  inherited sdsDet: TSQLDataSet
    Left = 136
    Top = 0
  end
  object rvdsContador: TRvDataSetConnection
    LocalFilter = False
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = cds
    Left = 151
    Top = 79
  end
  object RvProject1: TRvProject
    Engine = RvSystem
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 111
    Top = 87
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
    Left = 199
    Top = 87
  end
  object RvRenderPDF1: TRvRenderPDF
    DisplayName = 'Adobe Acrobat (PDF)'
    FileExtension = '*.pdf'
    DocInfo.Creator = 'Rave Reports (http://www.nevrona.com/rave)'
    DocInfo.Producer = 'Nevrona Designs'
    Left = 191
    Top = 151
  end
  object RvRenderHTML1: TRvRenderHTML
    DisplayName = 'Web Page (HTML)'
    FileExtension = '*.html;*.htm'
    ServerMode = False
    UseBreakingSpaces = True
    Left = 143
    Top = 143
  end
end
