inherited frmPesquisaOSAberto: TfrmPesquisaOSAberto
  Caption = 'Pesquisa de OS'
  ClientHeight = 527
  ClientWidth = 782
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 798
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TcxGrid
    Left = 0
    Top = 114
    Width = 782
    Height = 413
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object gridView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnCellDblClick = gridView1CellDblClick
      DataController.DataSource = ds
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
      object gridView1Column5: TcxGridDBColumn
        DataBinding.FieldName = 'Status'
        Width = 80
      end
      object gridView1Column1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'COD_OS'
      end
      object gridView1Column2: TcxGridDBColumn
        Caption = 'Data'
        DataBinding.FieldName = 'DATA'
        Width = 80
      end
      object gridView1Column3: TcxGridDBColumn
        Caption = 'Nome do Arquivo'
        DataBinding.FieldName = 'ARQUIVO'
        Width = 250
      end
      object gridView1Column4: TcxGridDBColumn
        Caption = 'Cliente'
        DataBinding.FieldName = 'NOME'
        Width = 400
      end
      object gridView1Column6: TcxGridDBColumn
        Caption = 'Impressora'
        DataBinding.FieldName = 'IMPRESSORA'
      end
    end
    object gridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsDet
      DataController.DetailKeyFieldNames = 'COD_OS'
      DataController.MasterKeyFieldNames = 'COD_OS'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object gridDBTableView1Column1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'ID'
      end
      object gridDBTableView1Column2: TcxGridDBColumn
        Caption = 'Descri'#231#227'o dos Itens'
        DataBinding.FieldName = 'DESC'
      end
    end
    object gridLevel1: TcxGridLevel
      GridView = gridView1
      object gridLevel2: TcxGridLevel
        GridView = gridDBTableView1
      end
    end
  end
  object PainelCodigo: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 114
    Align = alTop
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      782
      114)
    object btnBuscar: TcxButton
      Left = 677
      Top = 16
      Width = 95
      Height = 58
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 4
      OnClick = btnBuscarClick
    end
    object btnSair: TcxButton
      Left = 677
      Top = 80
      Width = 95
      Height = 28
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 5
      OnClick = btnSairClick
    end
    object grpData: TGroupBox
      Left = 6
      Top = 1
      Width = 123
      Height = 107
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
        Left = 14
        Top = 57
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
        Left = 12
        Top = 72
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
    object edtConteudo: TGigatronLblEdit
      Left = 366
      Top = 83
      Width = 291
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      EditLabel.Left = 366
      EditLabel.Top = 61
      EditLabel.Width = 213
      EditLabel.Height = 19
      EditLabel.Caption = 'Digite o conte'#250'do da pesquisa'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 660
      CadastroButton.Top = 83
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
      CadastroButton.Visible = False
      PesquisaButton.Left = 660
      PesquisaButton.Top = 83
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
      PesquisaButton.Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      ModalPesquisa = False
      ModalCadastro = False
      ParentFont = False
      TabOrder = 3
      DescrEdit.Left = 660
      DescrEdit.Top = 83
      DescrEdit.Width = 121
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.AutoSize = False
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.Visible = False
    end
    object grpStatus: TcxRadioGroup
      Left = 135
      Top = 2
      Caption = '  Status  '
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
        end>
      ItemIndex = 0
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Height = 106
      Width = 94
    end
    object grpTipo: TcxRadioGroup
      Left = 236
      Top = 2
      Caption = '  Tipo de Pesquisa  '
      Properties.Items = <
        item
          Caption = 'Nome do Cliente'
          Value = '0'
        end
        item
          Caption = 'Nome do Arquivo'
          Value = '1'
        end>
      ItemIndex = 0
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Height = 106
      Width = 117
    end
  end
  object sds: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 528
    Top = 8
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 560
    Top = 8
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    AfterOpen = cdsAfterOpen
    AfterClose = cdsAfterClose
    Left = 592
    Top = 8
  end
  object ds: TDataSource
    DataSet = cds
    Left = 624
    Top = 8
  end
  object sdsDet: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 528
    Top = 48
  end
  object dspDet: TDataSetProvider
    DataSet = sdsDet
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 560
    Top = 48
  end
  object cdsDet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDet'
    Left = 592
    Top = 48
  end
  object dsDet: TDataSource
    DataSet = cdsDet
    Left = 624
    Top = 48
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 712
    Top = 344
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
