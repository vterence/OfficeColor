object frmPadraoPesquisas: TfrmPadraoPesquisas
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 383
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PainelCodigo: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 83
    Align = alTop
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    object Código: TLabel
      Left = 32
      Top = 4
      Width = 55
      Height = 16
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtConteudo: TEdit
      Left = 32
      Top = 21
      Width = 465
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      TextHint = 'Conte'#250'do'
    end
    object btnBuscar: TcxButton
      Left = 520
      Top = 15
      Width = 95
      Height = 28
      Caption = 'Buscar'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 1
      OnClick = btnBuscarClick
    end
    object btnSair: TcxButton
      Left = 520
      Top = 49
      Width = 95
      Height = 28
      Caption = 'Sair'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
  object PainelDados: TPanel
    Left = 0
    Top = 83
    Width = 635
    Height = 300
    Align = alClient
    BevelOuter = bvLowered
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    object grade: TcxGrid
      Left = 1
      Top = 1
      Width = 633
      Height = 298
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      object gradeTB: TcxGridDBTableView
        OnDblClick = gradeTBDblClick
        OnKeyPress = gradeTBKeyPress
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DM.dsPesquisasGeral
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        Styles.ContentEven = cxStyle1
      end
      object gradeLevel1: TcxGridLevel
        GridView = gradeTB
      end
    end
    object grPadrao: TcxGrid
      Left = 128
      Top = 85
      Width = 305
      Height = 121
      TabOrder = 1
      Visible = False
      object grPadraoTB: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.SeparatorColor = clSilver
        object cxColuna: TcxGridDBColumn
          Caption = ' '
          DataBinding.FieldName = 'selecao'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              ImageIndex = 0
              Value = 0
            end
            item
              ImageIndex = 1
              Value = 1
            end>
        end
      end
      object grPadraoLevel1: TcxGridLevel
        GridView = grPadraoTB
      end
    end
  end
  object sds: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 496
    Top = 88
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 528
    Top = 88
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 560
    Top = 88
  end
  object ds: TDataSource
    DataSet = cds
    Left = 592
    Top = 88
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 448
    Top = 90
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGradientActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
