inherited frmPesquisaOSAberto: TfrmPesquisaOSAberto
  Caption = 'Pesquisa de OS'
  ClientHeight = 527
  ClientWidth = 782
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 788
  ExplicitHeight = 555
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 782
    Height = 117
    ExplicitWidth = 782
    ExplicitHeight = 117
    inherited Código: TLabel
      Left = 360
      Top = 66
      Width = 146
      Caption = 'Digite o Conte'#250'do da Pesquisa'
      ExplicitLeft = 360
      ExplicitTop = 66
      ExplicitWidth = 146
    end
    inherited edtCodigo: TEdit
      Left = 678
      Top = 36
      TabOrder = 6
      Visible = False
      ExplicitLeft = 678
      ExplicitTop = 36
    end
    inherited btnNovo: TcxButton
      TabOrder = 7
    end
    inherited btnBusca: TcxButton
      TabOrder = 8
    end
    object btnBuscarPesquisa: TcxButton
      Left = 677
      Top = 23
      Width = 75
      Height = 25
      TabOrder = 9
      Visible = False
    end
    object grpTipo: TcxRadioGroup
      Left = 234
      Top = 4
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
    object grpStatus: TcxRadioGroup
      Left = 135
      Top = 4
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
    object grpData: TGroupBox
      Left = 6
      Top = 3
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
    object btnBuscar: TcxButton
      Left = 677
      Top = 21
      Width = 95
      Height = 58
      Anchors = [akTop, akRight]
      Caption = 'Buscar'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 4
      OnClick = btnBuscarClick
    end
    object edtConteudo: TEdit
      Left = 359
      Top = 85
      Width = 312
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 3
    end
    object btnFechar: TcxButton
      Left = 677
      Top = 85
      Width = 95
      Height = 27
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  inherited PainelDados: TPanel
    Top = 117
    Width = 782
    Height = 369
    ExplicitTop = 117
    ExplicitWidth = 782
    ExplicitHeight = 369
    object grade: TcxGrid
      Left = 0
      Top = 0
      Width = 780
      Height = 408
      TabOrder = 0
    end
  end
  object grid: TcxGrid [2]
    Left = 0
    Top = 117
    Width = 782
    Height = 369
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 3
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
      Styles.ContentEven = cxStyle2
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
  inherited PainelBotoes: TPanel
    Top = 486
    Width = 782
    Visible = False
    ExplicitTop = 486
    ExplicitWidth = 782
    inherited btnSair: TcxButton
      Left = 677
      Top = 81
      Anchors = [akTop, akRight]
      ExplicitLeft = 677
      ExplicitTop = 81
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 712
    Top = 344
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
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
