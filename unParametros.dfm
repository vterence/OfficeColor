inherited frmParametros: TfrmParametros
  Caption = 'Par'#226'metros do Sistema'
  ClientHeight = 355
  ClientWidth = 334
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 340
  ExplicitHeight = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 334
    Visible = False
    ExplicitWidth = 334
    inherited Código: TLabel
      Visible = False
    end
    inherited edtCodigo: TEdit
      Visible = False
    end
    inherited btnNovo: TcxButton
      Visible = False
    end
    inherited btnBusca: TcxButton
      Visible = False
    end
  end
  inherited PainelDados: TPanel
    Width = 334
    Height = 273
    ExplicitWidth = 334
    ExplicitHeight = 273
    object edtCaminhoRelOS: TLabeledDBEdit
      Tag = 101
      Left = 16
      Top = 37
      Width = 290
      Height = 20
      Hint = 'Caminho do relat'#243'rio de OS Resumido'
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'CAMINHO_REL_OS'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      EditLabel.Left = 16
      EditLabel.Top = 21
      EditLabel.Width = 140
      EditLabel.Height = 13
      EditLabel.Hint = 'Ima'
      EditLabel.Caption = 'Caminho do Relat'#243'rio de O.S.'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 331
      CadastroButton.Top = 37
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
      PesquisaButton.Left = 309
      PesquisaButton.Top = 37
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
      PesquisaButton.OnClick = edtCaminhoRelOSSubButtonPesquisaClick
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      Text = 'edtCaminhoRelOS'
      DescrEdit.Left = 353
      DescrEdit.Top = 37
      DescrEdit.Width = 0
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Ctl3D = False
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentCtl3D = False
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 2
      DescrEdit.Visible = False
      showFrmPesquisaOnEnter = True
    end
    object edtCaminhoRelOSResumido: TLabeledDBEdit
      Tag = 101
      Left = 16
      Top = 82
      Width = 290
      Height = 20
      Hint = 'Caminho do relat'#243'rio de OS Resumido'
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'CAMINHO_REL_OS_RESUMIDO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      EditLabel.Left = 16
      EditLabel.Top = 66
      EditLabel.Width = 190
      EditLabel.Height = 13
      EditLabel.Hint = 'Ima'
      EditLabel.Caption = 'Caminho do Relat'#243'rio de O.S. Resumido'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 331
      CadastroButton.Top = 82
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
      PesquisaButton.Left = 309
      PesquisaButton.Top = 82
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
      PesquisaButton.OnClick = edtCaminhoRelOSResumidoSubButtonPesquisaClick
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      Text = 'edtCaminhoRelOSResumido'
      DescrEdit.Left = 353
      DescrEdit.Top = 82
      DescrEdit.Width = 0
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Ctl3D = False
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentCtl3D = False
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 4
      DescrEdit.Visible = False
      showFrmPesquisaOnEnter = True
    end
    object edtCaminhoRelOsErro: TLabeledDBEdit
      Tag = 101
      Left = 16
      Top = 127
      Width = 290
      Height = 20
      Hint = 'Caminho do relat'#243'rio de OS com Erro'
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'CAMINHO_REL_OS_ERRO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      EditLabel.Left = 16
      EditLabel.Top = 111
      EditLabel.Width = 185
      EditLabel.Height = 13
      EditLabel.Hint = 'Ima'
      EditLabel.Caption = 'Caminho do Relat'#243'rio de O.S. com Erro'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 331
      CadastroButton.Top = 127
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
      PesquisaButton.Left = 309
      PesquisaButton.Top = 127
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
      PesquisaButton.OnClick = edtCaminhoRelOsErroSubButtonPesquisaClick
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      Text = 'edtCaminhoRelOsErro'
      DescrEdit.Left = 353
      DescrEdit.Top = 127
      DescrEdit.Width = 0
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Ctl3D = False
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentCtl3D = False
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 6
      DescrEdit.Visible = False
      showFrmPesquisaOnEnter = True
    end
    object edtCaminhoRelContador: TLabeledDBEdit
      Tag = 101
      Left = 16
      Top = 171
      Width = 290
      Height = 20
      Hint = 'Caminho do relat'#243'rio de Contador'
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'CAMINHO_REL_CONTADOR'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      EditLabel.Left = 16
      EditLabel.Top = 155
      EditLabel.Width = 162
      EditLabel.Height = 13
      EditLabel.Hint = 'Ima'
      EditLabel.Caption = 'Caminho do Relat'#243'rio de Contador'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 331
      CadastroButton.Top = 171
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
      PesquisaButton.Left = 309
      PesquisaButton.Top = 171
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
      PesquisaButton.OnClick = LabeledDBEdit1SubButtonPesquisaClick
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      Text = 'edtCaminhoRelContador'
      DescrEdit.Left = 353
      DescrEdit.Top = 171
      DescrEdit.Width = 0
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Ctl3D = False
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentCtl3D = False
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 5
      DescrEdit.Visible = False
      showFrmPesquisaOnEnter = True
    end
    object edtCaminhoRelConsumiveis: TLabeledDBEdit
      Tag = 101
      Left = 16
      Top = 211
      Width = 290
      Height = 20
      Hint = 'Caminho do relat'#243'rio de Contador'
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'CAMINHO_REL_CONSUMIVEIS'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
      EditLabel.Left = 16
      EditLabel.Top = 195
      EditLabel.Width = 180
      EditLabel.Height = 13
      EditLabel.Hint = 'Ima'
      EditLabel.Caption = 'Caminho do Relat'#243'rio de Consum'#237'veis'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      CadastroButton.Left = 331
      CadastroButton.Top = 211
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
      PesquisaButton.Left = 309
      PesquisaButton.Top = 211
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
      PesquisaButton.OnClick = edtCaminhoRelConsumiveisSubButtonPesquisaClick
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      Text = 'edtCaminhoRelConsumiveis'
      DescrEdit.Left = 353
      DescrEdit.Top = 211
      DescrEdit.Width = 0
      DescrEdit.Height = 20
      DescrEdit.TabStop = False
      DescrEdit.Anchors = [akLeft, akTop, akRight]
      DescrEdit.AutoSize = False
      DescrEdit.BorderStyle = bsNone
      DescrEdit.Color = clScrollBar
      DescrEdit.Ctl3D = False
      DescrEdit.Font.Charset = DEFAULT_CHARSET
      DescrEdit.Font.Color = clWindowText
      DescrEdit.Font.Height = -11
      DescrEdit.Font.Name = 'courier new'
      DescrEdit.Font.Style = []
      DescrEdit.ParentCtl3D = False
      DescrEdit.ParentFont = False
      DescrEdit.ReadOnly = True
      DescrEdit.TabOrder = 3
      DescrEdit.Visible = False
      showFrmPesquisaOnEnter = True
    end
  end
  inherited PainelBotoes: TPanel
    Top = 314
    Width = 334
    ExplicitTop = 314
    ExplicitWidth = 334
    inherited btnSair: TcxButton
      Left = 243
      ExplicitLeft = 243
    end
    inherited btnRetornar: TcxButton
      Visible = False
    end
    inherited btnExcluir: TcxButton
      Visible = False
    end
  end
  inherited ds: TDataSource
    Left = 104
    Top = 184
  end
  inherited cds: TClientDataSet
    Left = 72
    Top = 184
  end
  inherited dsp: TDataSetProvider
    Left = 40
    Top = 184
  end
  inherited sds: TSQLDataSet
    CommandText = 'SELECT * FROM PARAMETROS'
    Left = 8
    Top = 184
  end
  inherited dsDet: TDataSource
    Left = 104
    Top = 216
  end
  inherited cdsDet: TClientDataSet
    Left = 72
    Top = 216
  end
  inherited dspDet: TDataSetProvider
    Left = 40
    Top = 216
  end
  inherited sdsDet: TSQLDataSet
    Left = 8
    Top = 216
  end
  inherited XPManifest1: TXPManifest
    Left = 216
    Top = 0
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 264
  end
end
