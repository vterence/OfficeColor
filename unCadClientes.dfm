inherited frmCadClientes: TfrmCadClientes
  Caption = 'Cadastro de Clientes'
  ClientHeight = 321
  ClientWidth = 468
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  ExplicitWidth = 474
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 468
    ExplicitWidth = 468
  end
  inherited PainelDados: TPanel
    Width = 468
    Height = 239
    TabOrder = 2
    ExplicitWidth = 468
    ExplicitHeight = 239
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 466
      Height = 237
      ActivePage = TabSheet1
      Align = alClient
      Style = tsButtons
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados'
        DesignSize = (
          458
          206)
        object grpEndereco: TGroupBox
          Left = 10
          Top = 63
          Width = 432
          Height = 125
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Endere'#231'o '
          Color = clGradientInactiveCaption
          ParentBackground = False
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            432
            125)
          object edtCidade: TLabeledDBEdit
            Left = 73
            Top = 16
            Width = 54
            Height = 21
            AutoSize = False
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DataField = 'COD_CIDADE'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'courier new'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = edtCidadeEnter
            OnExit = edtCidadeExit
            EditLabel.Left = 37
            EditLabel.Top = 20
            EditLabel.Width = 33
            EditLabel.Height = 13
            EditLabel.Caption = 'Cidade'
            CadastroButton.Left = 152
            CadastroButton.Top = 16
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
            PesquisaButton.Left = 130
            PesquisaButton.Top = 16
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
            PesquisaButton.OnClick = edtCidadeSubButtonPesquisaClick
            IsForeignKey = True
            LabelPosition = lpLeft
            ModalPesquisa = True
            ModalCadastro = False
            DescrEdit.Left = 174
            DescrEdit.Top = 16
            DescrEdit.Width = 270
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
            OnFrmPesquisaClose = edtCidadeFrmPesquisaClose
            showFrmPesquisaOnEnter = True
          end
          object edtEndereco: TLabeledDBEdit
            Left = 73
            Top = 38
            Width = 266
            Height = 20
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DataField = 'ENDERECO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'courier new'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            EditLabel.Left = 25
            EditLabel.Top = 41
            EditLabel.Width = 45
            EditLabel.Height = 13
            EditLabel.Caption = 'Endere'#231'o'
            CadastroButton.Left = 342
            CadastroButton.Top = 38
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
            PesquisaButton.Left = 342
            PesquisaButton.Top = 38
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
            DescrEdit.Left = 342
            DescrEdit.Top = 38
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
          object edtBairro: TLabeledDBEdit
            Left = 73
            Top = 60
            Width = 224
            Height = 20
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DataField = 'BAIRRO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'courier new'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            EditLabel.Left = 42
            EditLabel.Top = 63
            EditLabel.Width = 28
            EditLabel.Height = 13
            EditLabel.Caption = 'Bairro'
            CadastroButton.Left = 300
            CadastroButton.Top = 60
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
            PesquisaButton.Left = 300
            PesquisaButton.Top = 60
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
            DescrEdit.Left = 300
            DescrEdit.Top = 60
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
          object edtTelefone1: TLabeledDBEdit
            Left = 73
            Top = 82
            Width = 112
            Height = 20
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DataField = 'TEL1'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'courier new'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            EditLabel.Left = 28
            EditLabel.Top = 85
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Telefone'
            CadastroButton.Left = 188
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
            CadastroButton.Visible = False
            PesquisaButton.Left = 188
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
            PesquisaButton.Visible = False
            LabelPosition = lpLeft
            ModalPesquisa = True
            ModalCadastro = False
            DescrEdit.Left = 188
            DescrEdit.Top = 82
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
          object edtNumero: TLabeledDBEdit
            Left = 362
            Top = 38
            Width = 63
            Height = 20
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DataField = 'NUMERO'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'courier new'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            EditLabel.Left = 347
            EditLabel.Top = 41
            EditLabel.Width = 12
            EditLabel.Height = 13
            EditLabel.Caption = 'N'#186
            CadastroButton.Left = 428
            CadastroButton.Top = 38
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
            PesquisaButton.Left = 428
            PesquisaButton.Top = 38
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
            DescrEdit.Left = 428
            DescrEdit.Top = 38
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
          object edtCep: TLabeledDBEdit
            Left = 328
            Top = 60
            Width = 97
            Height = 20
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            BorderStyle = bsNone
            CharCase = ecUpperCase
            DataField = 'CEP'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'courier new'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            EditLabel.Left = 306
            EditLabel.Top = 63
            EditLabel.Width = 19
            EditLabel.Height = 13
            EditLabel.Caption = 'Cep'
            CadastroButton.Left = 428
            CadastroButton.Top = 60
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
            PesquisaButton.Left = 428
            PesquisaButton.Top = 60
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
            DescrEdit.Left = 428
            DescrEdit.Top = 60
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
        end
        object edtNome: TLabeledDBEdit
          Left = 65
          Top = 9
          Width = 273
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'NOME'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'courier new'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          EditLabel.Left = 35
          EditLabel.Top = 12
          EditLabel.Width = 27
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          CadastroButton.Left = 341
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
          PesquisaButton.Left = 341
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
          DescrEdit.Left = 341
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
        object edtCnpjCpf: TLabeledDBEdit
          Left = 65
          Top = 32
          Width = 103
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'CNPJ_CPF'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'courier new'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          EditLabel.Left = 13
          EditLabel.Top = 35
          EditLabel.Width = 49
          EditLabel.Height = 13
          EditLabel.Caption = 'Cnpj / Cpf'
          CadastroButton.Left = 171
          CadastroButton.Top = 32
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
          PesquisaButton.Left = 171
          PesquisaButton.Top = 32
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
          DescrEdit.Left = 171
          DescrEdit.Top = 32
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
        object edtRGIE: TLabeledDBEdit
          Left = 211
          Top = 32
          Width = 127
          Height = 20
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          DataField = 'RG_IE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'courier new'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          EditLabel.Left = 174
          EditLabel.Top = 35
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'IE / RG'
          CadastroButton.Left = 341
          CadastroButton.Top = 32
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
          PesquisaButton.Left = 341
          PesquisaButton.Top = 32
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
          DescrEdit.Left = 341
          DescrEdit.Top = 32
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
      end
    end
  end
  inherited PainelBotoes: TPanel
    Top = 280
    Width = 468
    TabOrder = 3
    ExplicitTop = 280
    ExplicitWidth = 468
    inherited btnSair: TcxButton
      Left = 377
      OnClick = btnSairClick
      ExplicitLeft = 377
    end
  end
  object rdgTipo: TDBRadioGroup [3]
    Left = 349
    Top = 74
    Width = 98
    Height = 47
    Caption = '  Tipo  '
    Color = clGradientInactiveCaption
    DataField = 'TIPO'
    DataSource = ds
    Items.Strings = (
      'Jur'#237'dica'
      'F'#237'sica')
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    Values.Strings = (
      '0'
      '1')
    OnClick = rdgTipoClick
  end
  inherited ds: TDataSource
    Left = 416
    Top = 0
  end
  inherited cds: TClientDataSet
    AfterOpen = cdsAfterOpen
    OnNewRecord = cdsNewRecord
    Left = 384
    Top = 0
  end
  inherited dsp: TDataSetProvider
    Left = 352
    Top = 0
  end
  inherited sds: TSQLDataSet
    CommandText = 'SELECT * FROM CLIENTES WHERE ID_CLIENTE IS NULL'
    Left = 320
    Top = 0
  end
  inherited dsDet: TDataSource
    Top = 24
  end
  inherited cdsDet: TClientDataSet
    IndexFieldNames = 'ID_CLIENTE'
    MasterFields = 'ID_CLIENTE'
    MasterSource = ds
    PacketRecords = 0
    Top = 24
  end
  inherited dspDet: TDataSetProvider
    Top = 24
  end
  inherited sdsDet: TSQLDataSet
    CommandText = 'SELECT * FROM CLIENTES_ENDERECO WHERE ID_ENDERECO IS NULL'
    Top = 24
  end
  inherited XPManifest1: TXPManifest
    Left = 288
    Top = 0
  end
end
