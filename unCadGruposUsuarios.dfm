inherited frmCadGruposUsuarios: TfrmCadGruposUsuarios
  Caption = 'Cadastro de Grupos de Usu'#225'rios'
  ClientHeight = 351
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 469
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    ExplicitWidth = 463
  end
  inherited PainelDados: TPanel
    Height = 269
    ExplicitWidth = 463
    ExplicitHeight = 269
    object edtDescricao: TLabeledDBEdit
      Tag = 101
      Left = 71
      Top = 13
      Width = 355
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'DESC_USR_GRUPO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      EditLabel.Left = 19
      EditLabel.Top = 16
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 429
      CadastroButton.Top = 13
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
      PesquisaButton.Left = 429
      PesquisaButton.Top = 13
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
      LabelSpacing = 4
      ModalPesquisa = False
      ModalCadastro = False
      DescrEdit.Left = 429
      DescrEdit.Top = 13
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
    object grade: TDBGrid
      Left = 1
      Top = 59
      Width = 461
      Height = 209
      TabStop = False
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      DataSource = dsAcessos
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = gradeCellClick
      OnDrawColumnCell = gradeDrawColumnCell
      OnKeyDown = gradeKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'SELECAO'
          Title.Caption = ' '
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_ACESSO'
          Title.Caption = 'Acesso'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_GRUPO_ACESSO'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 232
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MODULO'
          Title.Alignment = taCenter
          Title.Caption = 'M'#243'dulo'
          Width = 146
          Visible = True
        end>
    end
  end
  inherited PainelBotoes: TPanel
    Top = 310
    ExplicitTop = 310
    inherited btnSair: TcxButton
      OnClick = btnSairClick
      ExplicitLeft = 372
    end
  end
  inherited cds: TClientDataSet
    AfterOpen = cdsAfterOpen
    AfterClose = cdsAfterClose
  end
  object sdsItens: TSQLDataSet
    CommandText = 'SELECT * FROM USUARIOS_GRUPOS_ITENS'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 161
    Top = 158
  end
  object dspItens: TDataSetProvider
    DataSet = sdsItens
    Options = [poFetchBlobsOnDemand, poAllowCommandText]
    Left = 192
    Top = 158
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_GRUPO'
    MasterFields = 'COD_GRUPO'
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspItens'
    Left = 223
    Top = 158
  end
  object sdsAcessos: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 160
    Top = 206
  end
  object dspAcessos: TDataSetProvider
    DataSet = sdsAcessos
    Options = [poFetchBlobsOnDemand, poAllowCommandText]
    Left = 192
    Top = 206
  end
  object cdsAcessos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcessos'
    Left = 223
    Top = 206
  end
  object dsAcessos: TDataSource
    DataSet = cdsAcessos
    Left = 254
    Top = 206
  end
end
