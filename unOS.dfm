﻿inherited frmOS: TfrmOS
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 491
  ClientWidth = 544
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 550
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 544
    ExplicitWidth = 544
    object lblStatus: TLabel [1]
      Left = 383
      Top = 9
      Width = 142
      Height = 26
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 10768896
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ExplicitLeft = 341
    end
  end
  inherited PainelDados: TPanel
    Width = 544
    Height = 409
    ExplicitWidth = 544
    ExplicitHeight = 409
    object Label2: TLabel
      Left = 17
      Top = 5
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object Label7: TLabel
      Left = 18
      Top = 151
      Width = 63
      Height = 13
      Caption = 'Observa'#231#245'es'
    end
    object edtData: TAdvDBDateTimePicker
      Left = 16
      Top = 21
      Width = 94
      Height = 20
      Date = 41222.058206018520000000
      Time = 41222.058206018520000000
      DoubleBuffered = True
      Kind = dkDate
      ParentDoubleBuffered = False
      TabOrder = 0
      BorderStyle = bsNone
      Ctl3D = True
      DateTime = 41222.058206018520000000
      Version = '1.1.0.2'
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      DataField = 'DATA'
      DataSource = ds
    end
    object MemoObservações: TDBMemo
      Left = 17
      Top = 165
      Width = 318
      Height = 67
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      DataField = 'OBSERVACAO'
      DataSource = ds
      MaxLength = 200
      TabOrder = 7
    end
    object edtUsuario: TLabeledDBEdit
      Left = 114
      Top = 21
      Width = 152
      Height = 20
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
      TabOrder = 1
      OnEnter = edtUsuarioEnter
      OnExit = edtUsuarioExit
      EditLabel.Left = 114
      EditLabel.Top = 5
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Usu'#225'rio'
      CadastroButton.Left = 291
      CadastroButton.Top = 21
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
      PesquisaButton.Left = 269
      PesquisaButton.Top = 21
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
      DescrEdit.Left = 313
      DescrEdit.Top = 21
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
      DescrEdit.TabOrder = 10
      OnFrmPesquisaClose = edtUsuarioFrmPesquisaClose
      showFrmPesquisaOnEnter = True
    end
    object edtCliente: TLabeledDBEdit
      Left = 17
      Top = 58
      Width = 54
      Height = 20
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
      TabOrder = 4
      OnEnter = edtUsuarioEnter
      OnExit = edtClienteExit
      EditLabel.Left = 17
      EditLabel.Top = 42
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cliente'
      CadastroButton.Left = 96
      CadastroButton.Top = 58
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
      PesquisaButton.Left = 74
      PesquisaButton.Top = 58
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
      PesquisaButton.OnClick = edtClienteSubButtonPesquisaClick
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      DescrEdit.Left = 118
      DescrEdit.Top = 58
      DescrEdit.Width = 432
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
      DescrEdit.TabOrder = 11
      OnFrmPesquisaClose = edtUsuarioFrmPesquisaClose
      showFrmPesquisaOnEnter = True
    end
    object LabeledDBEdit1: TLabeledDBEdit
      Left = 17
      Top = 130
      Width = 511
      Height = 20
      Anchors = [akLeft, akTop, akRight]
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
      TabOrder = 6
      OnEnter = edtUsuarioEnter
      OnExit = edtUsuarioExit
      EditLabel.Left = 17
      EditLabel.Top = 114
      EditLabel.Width = 82
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome do Arquivo'
      CadastroButton.Left = 531
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
      CadastroButton.Visible = False
      PesquisaButton.Left = 531
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
      PesquisaButton.Visible = False
      ModalPesquisa = True
      ModalCadastro = False
      DescrEdit.Left = 531
      DescrEdit.Top = 130
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
      OnFrmPesquisaClose = edtUsuarioFrmPesquisaClose
      showFrmPesquisaOnEnter = True
    end
    object edtQtdPaginas: TLabeledDBEdit
      Left = 297
      Top = 21
      Width = 88
      Height = 20
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
      TabOrder = 2
      OnEnter = edtUsuarioEnter
      OnExit = edtUsuarioExit
      EditLabel.Left = 297
      EditLabel.Top = 5
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'Qtd P'#225'ginas'
      CadastroButton.Left = 388
      CadastroButton.Top = 21
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
      PesquisaButton.Left = 388
      PesquisaButton.Top = 21
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
      ModalPesquisa = True
      ModalCadastro = False
      DescrEdit.Left = 388
      DescrEdit.Top = 21
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
      OnFrmPesquisaClose = edtUsuarioFrmPesquisaClose
      showFrmPesquisaOnEnter = True
    end
    object edtQtd: TLabeledDBEdit
      Left = 391
      Top = 21
      Width = 92
      Height = 20
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
      TabOrder = 3
      OnEnter = edtUsuarioEnter
      OnExit = edtUsuarioExit
      EditLabel.Left = 391
      EditLabel.Top = 5
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = 'Qtd Imprimir'
      CadastroButton.Left = 486
      CadastroButton.Top = 21
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
      PesquisaButton.Left = 486
      PesquisaButton.Top = 21
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
      ModalPesquisa = False
      ModalCadastro = False
      DescrEdit.Left = 486
      DescrEdit.Top = 21
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
      OnFrmPesquisaClose = edtUsuarioFrmPesquisaClose
      showFrmPesquisaOnEnter = True
    end
    object edtImpressora: TLabeledDBEdit
      Left = 17
      Top = 93
      Width = 54
      Height = 20
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
      TabOrder = 5
      OnEnter = edtUsuarioEnter
      OnExit = edtImpressoraExit
      EditLabel.Left = 17
      EditLabel.Top = 77
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Impressora'
      CadastroButton.Left = 96
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
      PesquisaButton.Left = 74
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
      PesquisaButton.OnClick = edtImpressoraSubButtonPesquisaClick
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      DescrEdit.Left = 118
      DescrEdit.Top = 93
      DescrEdit.Width = 432
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
      DescrEdit.TabOrder = 12
      OnFrmPesquisaClose = edtUsuarioFrmPesquisaClose
      showFrmPesquisaOnEnter = True
    end
    object Panel1: TPanel
      Left = 16
      Top = 236
      Width = 512
      Height = 168
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 13
      DesignSize = (
        512
        168)
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 510
        Height = 22
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Itens da Ordem de Servi'#231'o'
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10768896
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 470
      end
      object btnItens: TcxButton
        Left = 447
        Top = 26
        Width = 62
        Height = 20
        Anchors = [akTop, akRight]
        Caption = 'Incluir'
        LookAndFeel.Kind = lfFlat
        TabOrder = 2
        OnClick = btnItensClick
      end
      object gridItens: TDBGrid
        Left = 1
        Top = 50
        Width = 510
        Height = 117
        TabStop = False
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BorderStyle = bsNone
        DataSource = dsItens
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupMenu1
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = gridItensDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object edtItem: TGigatronLblEdit
        Tag = 101
        Left = 45
        Top = 26
        Width = 37
        Height = 20
        AutoSize = False
        BorderStyle = bsNone
        DragCursor = crHandPoint
        EditLabel.Left = 39
        EditLabel.Top = 29
        EditLabel.Width = 3
        EditLabel.Height = 13
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        CadastroButton.Left = 107
        CadastroButton.Top = 26
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
        PesquisaButton.Left = 85
        PesquisaButton.Top = 26
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
        PesquisaButton.OnClick = edtItemSubButtonPesquisaClick
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'courier new'
        Font.Style = []
        IsForeignKey = True
        LabelPosition = lpLeft
        ModalPesquisa = True
        ModalCadastro = False
        ParentFont = False
        TabOrder = 1
        OnExit = edtItemExit
        PesquisaSQL.Strings = (
          'SELECT * FROM CADASTROS.EMPRESAS')
        DescrEdit.Left = 129
        DescrEdit.Top = 26
        DescrEdit.Width = 312
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
        DescrEdit.TabOrder = 4
        OnFrmPesquisaClose = edtItemFrmPesquisaClose
        showFrmPesquisaOnEnter = True
      end
      object edtTipo: TGigatronLblEdit
        Tag = 101
        Left = 1
        Top = 26
        Width = 41
        Height = 20
        AutoDate = False
        AutoSize = False
        BorderStyle = bsNone
        EditLabel.Left = -71
        EditLabel.Top = 29
        EditLabel.Width = 68
        EditLabel.Height = 13
        EditLabel.Caption = 'Tabela Item'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = 10768896
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        CadastroButton.Left = 45
        CadastroButton.Top = 26
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
        PesquisaButton.Left = 45
        PesquisaButton.Top = 26
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
        LabelSpacing = 4
        ModalPesquisa = False
        ModalCadastro = False
        ParentFont = False
        TabOrder = 0
        DescrEdit.Left = 45
        DescrEdit.Top = 26
        DescrEdit.Width = 625
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
        DescrEdit.Text = '1234567890123456789012345678901234567890'
        DescrEdit.Visible = False
        showFrmPesquisaOnEnter = True
      end
    end
    object cxDBRadioGroup1: TcxDBRadioGroup
      Left = 341
      Top = 160
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
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 8
      Height = 73
      Width = 61
    end
    object grpFinalidade: TcxDBRadioGroup
      Left = 408
      Top = 160
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
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 9
      Height = 73
      Width = 120
    end
  end
  inherited PainelBotoes: TPanel
    Top = 450
    Width = 544
    ExplicitTop = 450
    ExplicitWidth = 544
    inherited btnSair: TcxButton
      Left = 453
      OnClick = btnSairClick
      ExplicitLeft = 453
    end
    inherited btnConfirmar: TcxButton
      Left = 15
      ExplicitLeft = 15
    end
  end
  inherited ds: TDataSource
    Left = 120
    Top = 376
  end
  inherited cds: TClientDataSet
    AfterOpen = cdsAfterOpen
    AfterClose = cdsAfterClose
    OnNewRecord = cdsNewRecord
    Left = 88
    Top = 376
  end
  inherited dsp: TDataSetProvider
    Left = 56
    Top = 376
  end
  inherited sds: TSQLDataSet
    CommandText = 'SELECT * FROM OS WHERE COD_OS IS NULL'
    Left = 24
    Top = 376
  end
  inherited dsDet: TDataSource
    Left = 272
    Top = 376
  end
  inherited cdsDet: TClientDataSet
    IndexFieldNames = 'COD_OS'
    MasterFields = 'COD_OS'
    MasterSource = ds
    PacketRecords = 0
    BeforeInsert = cdsDetBeforeInsert
    AfterInsert = cdsDetAfterInsert
    Left = 240
    Top = 376
  end
  inherited dspDet: TDataSetProvider
    Left = 208
    Top = 376
  end
  inherited sdsDet: TSQLDataSet
    CommandText = 'SELECT * FROM OS_ITENS'
    Left = 176
    Top = 376
  end
  inherited XPManifest1: TXPManifest
    Left = 216
    Top = 8
  end
  object sdsItens: TSQLDataSet
    SchemaName = 'sysdba'
    CommandText = 
      'SELECT TIPO.DESC_TIPO || '#39' '#39' || ITEM.DESC_ITEM AS ITEM'#13#10' FROM OS' +
      '_ITENS ITEM_OS                               '#13#10'   INNER JOIN ITE' +
      'M ON                                '#13#10'     ITEM_OS.ID_TIPO = ITE' +
      'M.ID_TIPO AND              '#13#10'     ITEM_OS.ID_ITEM = ITEM.ID_ITEM' +
      '                  '#13#10'   INNER JOIN ITEM_TIPO TIPO ON             ' +
      '         '#13#10'     ITEM.ID_TIPO       = TIPO.ID_TIPO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 320
    Top = 376
  end
  object dspItens: TDataSetProvider
    DataSet = sdsItens
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 352
    Top = 376
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspItens'
    Left = 384
    Top = 376
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 416
    Top = 376
  end
  object PopupMenu1: TPopupMenu
    Left = 432
    Top = 408
    object mExcluirItem: TMenuItem
      Caption = 'Excluir Item'
      OnClick = mExcluirItemClick
    end
    object mExcluirTodos: TMenuItem
      Caption = 'Excluir Todos'
      OnClick = mExcluirTodosClick
    end
  end
end
