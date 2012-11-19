inherited frmCadConsumiveis: TfrmCadConsumiveis
  Caption = 'Cadastro de Consum'#237'veis'
  ClientHeight = 331
  ClientWidth = 442
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 448
  ExplicitHeight = 359
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 442
    ExplicitWidth = 442
  end
  inherited PainelDados: TPanel
    Width = 442
    Height = 249
    ExplicitWidth = 442
    ExplicitHeight = 249
    object Label2: TLabel
      Left = 13
      Top = 38
      Width = 54
      Height = 13
      Caption = 'Impressora'
    end
    object edtNome: TLabeledDBEdit
      Left = 76
      Top = 9
      Width = 276
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DESC_CONSUMIVEL'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      EditLabel.Left = 46
      EditLabel.Top = 12
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      CadastroButton.Left = 355
      CadastroButton.Top = 9
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
      PesquisaButton.Left = 355
      PesquisaButton.Top = 9
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
      LabelPosition = lpLeft
      ModalPesquisa = True
      ModalCadastro = False
      DescrEdit.Left = 355
      DescrEdit.Top = 9
      DescrEdit.Width = 0
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
      DescrEdit.Visible = False
      showFrmPesquisaOnEnter = True
    end
    object cmbImpressora: TcxDBLookupComboBox
      Left = 71
      Top = 35
      DataBinding.DataField = 'ID_IMPRESSORA'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dsDet
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 276
    end
    object grade: TDBGrid
      Left = 1
      Top = 67
      Width = 440
      Height = 181
      TabStop = False
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      DataSource = dsTroca
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CONTADOR'
          Title.Alignment = taCenter
          Title.Caption = 'Contador'
          Width = 200
          Visible = True
        end>
    end
    object btnBuscar: TcxButton
      Left = 358
      Top = 5
      Width = 76
      Height = 58
      Anchors = [akTop, akRight]
      Caption = 'Troca'
      LookAndFeel.Kind = lfOffice11
      TabOrder = 2
      OnClick = btnBuscarClick
    end
  end
  inherited PainelBotoes: TPanel
    Top = 290
    Width = 442
    ExplicitTop = 290
    ExplicitWidth = 442
    DesignSize = (
      442
      41)
    inherited btnSair: TcxButton
      Left = 351
      OnClick = btnSairClick
      ExplicitLeft = 351
    end
  end
  inherited ds: TDataSource
    Left = 360
    Top = 8
  end
  inherited cds: TClientDataSet
    AfterOpen = cdsAfterOpen
    AfterClose = cdsAfterClose
    Left = 328
    Top = 8
  end
  inherited dsp: TDataSetProvider
    Left = 296
    Top = 8
  end
  inherited sds: TSQLDataSet
    CommandText = 'SELECT * FROM CONSUMIVEIS'
    Left = 264
    Top = 8
  end
  inherited dsDet: TDataSource
    Left = 256
  end
  inherited cdsDet: TClientDataSet
    Left = 224
  end
  inherited dspDet: TDataSetProvider
    Left = 192
  end
  inherited sdsDet: TSQLDataSet
    CommandText = 'SELECT * FROM IMPRESSORAS'
    Left = 160
  end
  inherited XPManifest1: TXPManifest
    Left = 8
    Top = 24
  end
  object sdsTroca: TSQLDataSet
    CommandText = 'SELECT * FROM CONSUMIVEIS_TROCA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 160
    Top = 206
  end
  object dspTroca: TDataSetProvider
    DataSet = sdsTroca
    Options = [poFetchBlobsOnDemand, poAllowCommandText]
    Left = 192
    Top = 206
  end
  object cdsTroca: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONSUMIVEL'
    MasterFields = 'ID'
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspTroca'
    OnNewRecord = cdsTrocaNewRecord
    Left = 223
    Top = 206
  end
  object dsTroca: TDataSource
    DataSet = cdsTroca
    Left = 254
    Top = 206
  end
end
