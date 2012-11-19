inherited frmExecOS: TfrmExecOS
  BorderStyle = bsSingle
  Caption = 'Execu'#231#227'o de Ordem de Servi'#231'o'
  ClientHeight = 334
  ClientWidth = 818
  Position = poScreenCenter
  ExplicitWidth = 824
  ExplicitHeight = 362
  PixelsPerInch = 96
  TextHeight = 13
  object PainelCodigo: TPanel
    Left = 0
    Top = 0
    Width = 818
    Height = 273
    Align = alClient
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 258
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 816
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Dados da Ordem de Servi'#231'o'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 223
    end
    object Panel2: TPanel
      Left = 520
      Top = 20
      Width = 297
      Height = 252
      Align = alRight
      Anchors = [akLeft, akTop, akRight]
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 0
      ExplicitHeight = 237
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 295
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Especifica'#231#245'es'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitWidth = 116
      end
      object gridItens: TDBGrid
        Left = 1
        Top = 20
        Width = 295
        Height = 231
        TabStop = False
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsDet
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            Title.Caption = 'Item'
            Title.Color = clWindowText
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 20
      Width = 519
      Height = 252
      Align = alLeft
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 1
      ExplicitLeft = 19
      ExplicitTop = 22
      ExplicitHeight = 278
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 517
        Height = 19
        Align = alTop
        Alignment = taCenter
        Caption = 'Gerais'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        ExplicitWidth = 52
      end
      object edtCodigo: TLabeledDBEdit
        Left = 65
        Top = 25
        Width = 54
        Height = 20
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'COD_OS'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        EditLabel.Left = 48
        EditLabel.Top = 28
        EditLabel.Width = 14
        EditLabel.Height = 13
        EditLabel.Caption = 'OS'
        CadastroButton.Left = 144
        CadastroButton.Top = 25
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
        PesquisaButton.Left = 122
        PesquisaButton.Top = 25
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
        IsForeignKey = True
        LabelPosition = lpLeft
        ModalPesquisa = True
        ModalCadastro = False
        Text = 'EDTCODIGO'
        DescrEdit.Left = 166
        DescrEdit.Top = 25
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
        DescrEdit.TabOrder = 1
        showFrmPesquisaOnEnter = True
      end
      object edtCliente: TLabeledDBEdit
        Left = 165
        Top = 25
        Width = 54
        Height = 20
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'ID_CLIENTE'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnExit = edtClienteExit
        EditLabel.Left = 129
        EditLabel.Top = 28
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cliente'
        CadastroButton.Left = 244
        CadastroButton.Top = 25
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
        PesquisaButton.Left = 222
        PesquisaButton.Top = 25
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
        IsForeignKey = True
        LabelPosition = lpLeft
        ModalPesquisa = True
        ModalCadastro = False
        Text = 'EDTCLIENTE'
        DescrEdit.Left = 266
        DescrEdit.Top = 25
        DescrEdit.Width = 278
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
        showFrmPesquisaOnEnter = True
      end
      object edtUsuario: TLabeledDBEdit
        Left = 65
        Top = 48
        Width = 154
        Height = 20
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'USUARIO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        EditLabel.Left = 26
        EditLabel.Top = 51
        EditLabel.Width = 36
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio'
        CadastroButton.Left = 244
        CadastroButton.Top = 48
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
        PesquisaButton.Left = 222
        PesquisaButton.Top = 48
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
        IsForeignKey = True
        LabelPosition = lpLeft
        ModalPesquisa = True
        ModalCadastro = False
        Text = 'EDTUSUARIO'
        DescrEdit.Left = 266
        DescrEdit.Top = 48
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
        DescrEdit.TabOrder = 6
        showFrmPesquisaOnEnter = True
      end
      object edtQtdPaginas: TLabeledDBEdit
        Left = 285
        Top = 48
        Width = 78
        Height = 20
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'QTD_PAGINAS'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        EditLabel.Left = 224
        EditLabel.Top = 51
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'Qtd P'#225'ginas'
        CadastroButton.Left = 366
        CadastroButton.Top = 48
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
        PesquisaButton.Top = 48
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
        Text = 'EDTQTDPAGINAS'
        DescrEdit.Left = 366
        DescrEdit.Top = 48
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
      object edtQtd: TLabeledDBEdit
        Left = 431
        Top = 48
        Width = 72
        Height = 20
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'QTD'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        EditLabel.Left = 369
        EditLabel.Top = 51
        EditLabel.Width = 59
        EditLabel.Height = 13
        EditLabel.Caption = 'Qtd Imprimir'
        CadastroButton.Left = 506
        CadastroButton.Top = 48
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
        PesquisaButton.Left = 506
        PesquisaButton.Top = 48
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
        ModalPesquisa = False
        ModalCadastro = False
        Text = 'EDTQTD'
        DescrEdit.Left = 506
        DescrEdit.Top = 48
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
      object LabeledDBEdit1: TLabeledDBEdit
        Left = 65
        Top = 93
        Width = 438
        Height = 20
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'ARQUIVO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        EditLabel.Left = 25
        EditLabel.Top = 96
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'Arquivo'
        CadastroButton.Left = 506
        CadastroButton.Top = 93
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
        PesquisaButton.Left = 506
        PesquisaButton.Top = 93
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
        Text = 'LABELEDDBEDIT1'
        DescrEdit.Left = 506
        DescrEdit.Top = 93
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
      object MemoObservações: TDBMemo
        Left = 65
        Top = 116
        Width = 258
        Height = 99
        TabStop = False
        BorderStyle = bsNone
        DataField = 'OBSERVACAO'
        DataSource = ds
        MaxLength = 200
        ReadOnly = True
        TabOrder = 10
      end
      object edtImpressora: TLabeledDBEdit
        Left = 65
        Top = 70
        Width = 54
        Height = 20
        TabStop = False
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        DataField = 'ID_IMPRESSORA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
        OnExit = edtImpressoraExit
        EditLabel.Left = 8
        EditLabel.Top = 73
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'Impressora'
        CadastroButton.Left = 144
        CadastroButton.Top = 70
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
        PesquisaButton.Left = 122
        PesquisaButton.Top = 70
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
        IsForeignKey = True
        LabelPosition = lpLeft
        ModalPesquisa = True
        ModalCadastro = False
        Text = 'EDTIMPRESSORA'
        DescrEdit.Left = 166
        DescrEdit.Top = 70
        DescrEdit.Width = 278
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
        showFrmPesquisaOnEnter = True
      end
      object edtContadorInicial: TGigatronLblEdit
        Left = 264
        Top = 221
        Width = 77
        Height = 20
        AutoSize = False
        BorderStyle = bsNone
        EditLabel.Left = 186
        EditLabel.Top = 224
        EditLabel.Width = 75
        EditLabel.Height = 13
        EditLabel.Caption = 'Contador Inicial'
        CadastroButton.Left = 344
        CadastroButton.Top = 221
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
        PesquisaButton.Left = 344
        PesquisaButton.Top = 221
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
        LabelPosition = lpLeft
        ModalPesquisa = True
        ModalCadastro = False
        ParentFont = False
        TabOrder = 13
        DescrEdit.Left = 344
        DescrEdit.Top = 221
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
        DescrEdit.Visible = False
      end
      object edtContadorFinal: TGigatronLblEdit
        Left = 426
        Top = 221
        Width = 77
        Height = 20
        AutoSize = False
        BorderStyle = bsNone
        EditLabel.Left = 353
        EditLabel.Top = 224
        EditLabel.Width = 70
        EditLabel.Height = 13
        EditLabel.Caption = 'Contador Final'
        CadastroButton.Left = 506
        CadastroButton.Top = 221
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
        PesquisaButton.Left = 506
        PesquisaButton.Top = 221
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
        LabelPosition = lpLeft
        ModalPesquisa = True
        ModalCadastro = False
        ParentFont = False
        TabOrder = 14
        DescrEdit.Left = 506
        DescrEdit.Top = 221
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
        DescrEdit.Visible = False
      end
      object grpTipo: TcxDBRadioGroup
        Left = 328
        Top = 114
        Caption = '  Tipo  '
        DataBinding.DataField = 'FLAG_FRENTE_VERSO'
        DataBinding.DataSource = ds
        Properties.Items = <
          item
            Caption = '1 x 0'
            Value = '0'
          end
          item
            Caption = '1 x 1'
            Value = '1'
          end
          item
            Caption = '4 x 0'
            Value = '2'
          end
          item
            Caption = '4 x 1'
            Value = '3'
          end>
        Properties.ReadOnly = True
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 11
        Height = 101
        Width = 66
      end
      object grpFinalidade: TcxDBRadioGroup
        Left = 396
        Top = 115
        Caption = '  Finalidade  '
        DataBinding.DataField = 'FLAG_FINALIDADE'
        DataBinding.DataSource = ds
        Properties.Items = <
          item
            Caption = 'OS'
            Value = '0'
          end
          item
            Caption = 'Prova'
            Value = '1'
          end
          item
            Caption = 'Teste de Cor'
            Value = '2'
          end
          item
            Caption = 'Arquivo Interno'
            Value = '3'
          end>
        Properties.ReadOnly = True
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 12
        Height = 100
        Width = 107
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 273
    Width = 818
    Height = 61
    Align = alBottom
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 258
    DesignSize = (
      818
      61)
    object btnExecutar: TcxButton
      Left = 19
      Top = 7
      Width = 93
      Height = 45
      Caption = 'Executar'
      Enabled = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000000008030C021E0C2D042D1345042B11410118
        0924000401060000000000000000000000000000000000000000000000000000
        0000000000000008030C093D1C5B167B3CB71C9649E31D9C4BF01D9B4BEE1B8F
        45DB116B31A2042A113F00030104000000000000000000000000000000000000
        0000010F0617106B349B1CA955F714A64FFF0DA046FF0A9C40FF0A9A3FFF0E9C
        41FF17A048FF1A9847EB084B2072000502080000000000000000000000000007
        030B0F6E359C15B15BFE09AA50FF06A549FF05A145FF029D3EFF039A3CFF0599
        3BFF05983AFF0B9A3FFF159C45F508461E6B000000000000000000000000073E
        1D5811B25DF608B35AFF08AF54FF07AA4FFF11AA52FF55BF81FF40B56DFF069C
        3FFF05993CFF05983AFF09993DFF108D3CDE021C0B2B000000000006020A0A80
        40B00ABD64FF09B85FFF08B45AFF04AF53FF22B564FFE7F7EEFFA9DFBFFF049F
        42FF049C3EFF059A3CFF05983AFF099B3DFF064F207B00000000021A0B260AA5
        55DE0AC26AFF09BD65FF12BC66FF23BD6CFF3FC27CFFEAF8F1FFB4E4C9FF24AE
        5DFF1EA956FF099E42FF069A3DFF06993BFF05702CB3000602090228113A09B3
        5FEB0AC66FFF06C168FF50D192FFDFF5EAFFE6F7EEFFFCFEFDFFF6FCF8FFE5F5
        ECFFBDE6CFFF1AA854FF059D40FF069B3EFF057C30C8010D0514022510350AB2
        60E80ACA73FF08C66EFF27C77BFF60CE99FF75D5A7FFF0FAF6FFCAEEDCFF63CC
        97FF52C488FF0FAA51FF06A245FF069E42FF067A31C2010B04110111071A0DA1
        58D10CCE7CFF0BCF7DFF0ACD7CFF05CA77FF23CE84FFE7F9F1FFA9E8CAFF05BD
        64FF05BA5FFF08B65AFF07AF52FF08A64AFF08692DA10002010300010002126F
        409115D389FF0CD489FF0CD387FF0BD183FF16CE83FF59D19BFF43CD8EFF0AC4
        6FFF09C16AFF09BD64FF08B95EFF16B25CFA093F1E5B00000000000000000623
        123127B575DF16D58DFF0CD488FF0DD387FF0CD183FF08CD7DFF08CA79FF0AC8
        76FF0AC571FF08C16AFF19C16EFF1F894DBA010D051300000000000000000000
        00001046275F34C181EB21D792FF0FD58AFF0BD387FF0BD284FF0ACF80FF0ACC
        7CFF0FCA7AFF26CA7FFF2AA060D2062511350000000000000000000000000000
        0000000100030E3C215136A870CF3ED495FC32D897FF2AD894FF2BD792FF35D4
        92FF3FC98AF72B8C58B406221031000000000000000000000000000000000000
        000000000000000000000314091D134B2B63277C4D9E30925FB72E8E5CB32271
        45910E3A204F010B041000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000100020006010A000501080000
        0001000000000000000000000000000000000000000000000000}
      LookAndFeel.Kind = lfOffice11
      TabOrder = 0
      OnClick = btnExecutarClick
    end
    object btnFechar: TcxButton
      Left = 118
      Top = 7
      Width = 90
      Height = 45
      Caption = 'Fechar'
      Enabled = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B000F9E1C0F9D1E00
        4B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF004B001CB13511A4220C9C1911A021004B00FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B002EC65224BC43139224004B000D
        931A0E9D1D004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00
        35CA5E39D4651CA134004B00FF00FF004B000A86150F991C004B00FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF004B0029B548004B00FF00FFFF00FFFF
        00FFFF00FF004B000C9518004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004B00098611004B
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF004B00004B00FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF004B00004B00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfOffice11
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object btnSair: TcxButton
      Left = 724
      Top = 7
      Width = 86
      Height = 45
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FF00009A174AFD103BF400009AFF00FFFF
        00FFFF00FFFF00FF00009A002CF80030FC00009AFF00FFFF00FFFF00FFFF00FF
        00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A012DF60132FF002A
        F300009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A1C47F61B4DFF143EF400
        009A00009A002DF80134FF032BF200009AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF002CF600009AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A1A48F913
        42FF0C3CFF0733F600009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F600009AFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A2E5BF92C5FFF22
        4DF8204BF82355FF1B46F600009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A3664FA386BFF2D59F400009A00009A224CF42558FF1D49F60000
        9AFF00FFFF00FFFF00FFFF00FFFF00FF00009A4071FA4274FF325DF100009AFF
        00FFFF00FF00009A224DF1275AFF204CF800009AFF00FFFF00FFFF00FFFF00FF
        00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF00009A2550F42655
        FA00009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfOffice11
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
  object sdsDet: TSQLDataSet
    SchemaName = 'sysdba'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 512
    Top = 144
  end
  object dspDet: TDataSetProvider
    DataSet = sdsDet
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 544
    Top = 144
  end
  object cdsDet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDet'
    Left = 576
    Top = 144
  end
  object dsDet: TDataSource
    DataSet = cdsDet
    Left = 608
    Top = 144
  end
  object sds: TSQLDataSet
    CommandText = 'SELECT * FROM OS WHERE COD_OS IS NULL'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 656
    Top = 144
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 688
    Top = 144
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    AfterOpen = cdsAfterOpen
    AfterClose = cdsAfterClose
    Left = 720
    Top = 144
  end
  object ds: TDataSource
    DataSet = cds
    Left = 752
    Top = 144
  end
end
