inherited frmCadGruposAcesso: TfrmCadGruposAcesso
  Caption = 'Cadastro de Grupos de Acesso'
  ClientHeight = 384
  ClientWidth = 534
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 540
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 534
    ExplicitWidth = 534
    inherited btnNovo: TcxButton
      Visible = False
    end
  end
  inherited PainelDados: TPanel
    Width = 534
    Height = 302
    ExplicitWidth = 534
    ExplicitHeight = 302
    object edtDescricao: TLabeledDBEdit
      Tag = 101
      Left = 67
      Top = 6
      Width = 296
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Ctl3D = False
      DataField = 'DESC_GRUPO_ACESSO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      EditLabel.Left = 15
      EditLabel.Top = 9
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = 'Descri'#231#227'o'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 366
      CadastroButton.Top = 6
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
      PesquisaButton.Left = 366
      PesquisaButton.Top = 6
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
      Text = 'EDTDESCRICAO'
      DescrEdit.Left = 366
      DescrEdit.Top = 6
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
    object cmbModulo: TcxDBLookupComboBox
      Tag = 101
      Left = 369
      Top = 6
      Anchors = [akTop, akRight]
      DataBinding.DataField = 'MODULO'
      DataBinding.DataSource = ds
      ParentFont = False
      Properties.KeyFieldNames = 'MODULO'
      Properties.ListColumns = <
        item
          FieldName = 'DESC_MODULO'
        end>
      Properties.ListSource = dsModulos
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Courier New'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      StyleFocused.BorderStyle = ebsNone
      TabOrder = 1
      OnClick = cmbModuloClick
      Width = 136
    end
    object Tree: TTreeView
      Tag = 200
      Left = 1
      Top = 35
      Width = 532
      Height = 266
      Align = alBottom
      Anchors = [akLeft, akTop, akBottom]
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Images = frmPrincipal.ImageList1
      Indent = 19
      ParentFont = False
      ParentShowHint = False
      PopupMenu = PopupMenu1
      RightClickSelect = True
      ShowHint = True
      TabOrder = 2
      OnClick = TreeClick
      OnEditing = TreeEditing
      OnKeyPress = TreeKeyPress
    end
    object btnMenu: TcxButton
      Left = 505
      Top = 6
      Width = 22
      Height = 20
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0001000000030000000300000003000000030000000300000003000000040001
        0114000C063B00100847000C063B0001011300000001000000000201000A1810
        013E2116005320160052201600522016005220160052221600521C1805550245
        2991008C59DC009C64EB008C59DD0045288D0007041F00000000120C0025A284
        47D3CAB17EF2C8AF7BF1C8AF7CF1C8AF7CF1C8AF7CF1CAAF7BF168985DF100B1
        73FB0ECB8EFF63DEB7FF0FCB8EFF00B175FA004428870000000A150D0029C2AB
        7AE4EEE3C8FFEBDEBFFFECDEBFFFECDEBFFFEDDFC0FFE0D9B8FF2EB27AFF0BC6
        89FF38CD98FFCEF2E4FF38CD98FF0DC78AFF008956D6000C0623150D0029C1AA
        79E4EADDBCFFE7D7B1FFE7D8B2FFE7D8B2FFE9D8B3FFD8D0A8FF29AF73FF67D9
        B1FFD1F2E5FFF3FBF8FFD1F2E5FF68D9B2FF0E9A65E4000F0728150C0029C3AB
        7CE4F3EBD8FFF0E7CFFFF0E7D0FFF0E7D0FFF2E8D1FFE1E0C7FF4FB889FF22C4
        8BFF37C68FFFCEF0E2FF36C68FFF26C58DFF278F64D2000C051E150C0029C4AD
        7FE4FAF7F0FFF8F4EAFFF8F4EAFFF8F4EAFFF8F4EAFFF9F5EBFF90CBAAFF3ABC
        8AFF2FC48EFF75D7B1FF31C590FF3CB98AF80E472E7600000002150C0029C3AC
        7EE4F8F3E8FFF5F0E1FFF5F0E1FFF5F0E1FFF5F0E1FFF7F1E3FFEBEDDDFF92CA
        A7FF5BBA8DFF54B989FF51A976F6134A2D7D0007030E00000000150C0029C3AC
        7EE4F6F1E2FFF4EDDBFFF4EDDCFFF4EDDCFFF4EDDCFFF4EDDBFFF6EEDDFFF6EE
        DDFFE3E5D0FFDEE6D3FFB6A774E6130B00250000000000000000150C0029C3AC
        7DE4F5EEDDFFF2EAD5FFF3EAD6FFF3EAD6FFF3EAD6FFF3EAD6FFF2EAD5FFF3EA
        D6FFF4EBD6FFF7EFDEFFC6AD7EE6120B00240000000000000000150D0029C3AC
        7CE4F3EBD7FFF0E7CFFFF0E7D0FFF0E7D0FFF0E7D0FFF1E7D0FFF0E7CFFFF0E7
        CFFFF0E7CFFFF3EBD7FFC5AD7DE6120B00240000000000000000150D0029C2AB
        7BE4F1E8D2FFEEE3C9FFEEE3CAFFEEE3CAFFEFE3CAFFEEE3C9FFF0E7D0FFEFE4
        CDFFECDFC3FFEFE4CEFFC4AC7CE6120B00240000000000000000150D0029C2AB
        7AE4EFE5CCFFECE0C3FFEDE1C4FFEDE1C4FFEDE1C4FFECE0C3FFEEE2C9FFD8BA
        84FFDDC393FFDFC79BFFB39864D70F0A001B0000000000000000150D0029C2AA
        7AE4EDE2C6FFEADDBCFFEADDBDFFEADDBDFFEADDBDFFEADDBDFFEADBBCFFDDC3
        96FFF8F3E6FFCBB792E43C2E1350000000010000000000000000150C0028C2AB
        7BE4EEE4CAFFECDFC1FFECDFC1FFECDFC1FFECDFC1FFECDFC1FFECDFC3FFDFC7
        9BFFC1B090D7392B114C00000001000000000000000000000000120C001FAC8D
        4FD6DCC28CFFDBC08AFFDBC08AFFDBC08AFFDBC08AFFDBC08AFFDCC18BFFBFA4
        70E3382C164A0000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfOffice11
      TabOrder = 3
      OnClick = btnMenuClick
    end
  end
  inherited PainelBotoes: TPanel
    Top = 343
    Width = 534
    ExplicitTop = 343
    ExplicitWidth = 534
    inherited btnSair: TcxButton
      Left = 443
      OnClick = btnSairClick
      ExplicitLeft = 443
    end
  end
  inherited ds: TDataSource
    OnDataChange = dsDataChange
  end
  inherited cds: TClientDataSet
    AfterOpen = cdsAfterOpen
    AfterClose = cdsAfterClose
  end
  object sdsItens: TSQLDataSet
    CommandText = 'SELECT * FROM GRUPOS_ACESSOS_ITENS'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 305
    Top = 192
  end
  object dspItens: TDataSetProvider
    DataSet = sdsItens
    Options = [poFetchBlobsOnDemand, poAllowCommandText, poUseQuoteChar]
    Left = 336
    Top = 192
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'COD_ACESSO'
    MasterFields = 'COD_ACESSO'
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspItens'
    Left = 366
    Top = 192
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 396
    Top = 191
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OwnerDraw = True
    Left = 273
    Top = 224
    object MarcarTodos1: TMenuItem
      Caption = 'Marcar Todos'
      ImageIndex = 53
      OnClick = MarcarTodos1Click
    end
    object MarcarTodososFilhosdoItem1: TMenuItem
      Caption = 'Marcar Todos os Filhos do Item'
      ImageIndex = 53
      OnClick = MarcarTodososFilhosdoItem1Click
    end
  end
  object sdsModulos: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 305
    Top = 224
  end
  object dspModulos: TDataSetProvider
    DataSet = sdsModulos
    Options = [poFetchBlobsOnDemand, poAllowCommandText, poUseQuoteChar]
    Left = 336
    Top = 224
  end
  object cdsModulos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModulos'
    Left = 366
    Top = 224
  end
  object dsModulos: TDataSource
    DataSet = cdsModulos
    Left = 396
    Top = 224
  end
end
