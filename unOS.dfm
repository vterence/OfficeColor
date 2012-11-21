﻿inherited frmOS: TfrmOS
  Caption = 'Ordem de Servi'#231'o'
  ClientHeight = 499
  ClientWidth = 544
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitWidth = 550
  ExplicitHeight = 527
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
    Height = 417
    ExplicitWidth = 544
    ExplicitHeight = 417
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
      Width = 272
      Height = 71
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      DataField = 'OBSERVACAO'
      DataSource = ds
      MaxLength = 200
      TabOrder = 8
    end
    object edtUsuario: TLabeledDBEdit
      Left = 114
      Top = 21
      Width = 152
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Ctl3D = True
      DataField = 'USUARIO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      ParentCtl3D = False
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
      Text = 'EDTUSUARIO'
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
      DescrEdit.TabOrder = 11
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
      TabOrder = 5
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
      Text = 'EDTCLIENTE'
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
      DescrEdit.TabOrder = 12
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
      TabOrder = 7
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
      Text = 'LABELEDDBEDIT1'
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
      Width = 56
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
      CadastroButton.Left = 356
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
      PesquisaButton.Left = 356
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
      Text = 'EDTQTDPAGINAS'
      DescrEdit.Left = 356
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
      Left = 367
      Top = 21
      Width = 66
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
      EditLabel.Left = 367
      EditLabel.Top = 5
      EditLabel.Width = 59
      EditLabel.Height = 13
      EditLabel.Caption = 'Qtd Imprimir'
      CadastroButton.Left = 436
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
      PesquisaButton.Left = 436
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
      Text = 'EDTQTD'
      DescrEdit.Left = 436
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
      TabOrder = 6
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
      Text = 'EDTIMPRESSORA'
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
      DescrEdit.TabOrder = 13
      OnFrmPesquisaClose = edtUsuarioFrmPesquisaClose
      showFrmPesquisaOnEnter = True
    end
    object Panel1: TPanel
      Left = 16
      Top = 239
      Width = 512
      Height = 176
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 14
      DesignSize = (
        512
        176)
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
        Height = 125
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
      Left = 295
      Top = 160
      Caption = '  Tipo  '
      DataBinding.DataField = 'FLAG_FRENTE_VERSO'
      DataBinding.DataSource = ds
      Properties.Columns = 2
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
          Caption = '1 x 4'
          Value = '2'
        end
        item
          Caption = '4 x 0'
          Value = '3'
        end
        item
          Caption = '4 x 4'
          Value = '4'
        end
        item
          Caption = '4 x 1'
          Value = '5'
        end>
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 9
      Height = 77
      Width = 107
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
        end
        item
          Caption = 'Cortesia'
          Value = '4'
        end>
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 10
      Height = 77
      Width = 120
    end
    object edtValor: TLabeledDBEdit
      Left = 444
      Top = 21
      Width = 81
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'VALOR'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = edtUsuarioEnter
      OnExit = edtUsuarioExit
      EditLabel.Left = 444
      EditLabel.Top = 5
      EditLabel.Width = 24
      EditLabel.Height = 13
      EditLabel.Caption = 'Valor'
      CadastroButton.Left = 528
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
      PesquisaButton.Left = 528
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
      Text = 'LABELEDDBEDIT2'
      DescrEdit.Left = 528
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
  end
  inherited PainelBotoes: TPanel
    Top = 458
    Width = 544
    ExplicitTop = 458
    ExplicitWidth = 544
    inherited btnSair: TcxButton
      Left = 453
      ExplicitLeft = 453
    end
    inherited btnConfirmar: TcxButton
      Left = 15
      ExplicitLeft = 15
    end
    object btnFaturar: TcxButton
      Left = 369
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Faturar'
      Enabled = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF04510D045D0E04610D03610D055F0E04530CFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034F0D045E0E04631204661404
        671404661504631404651205670F04540CFF00FFFF00FFFF00FFFF00FFFF00FF
        04540D087417077D1900870F0090005ABB657EC687008500006F0D0460150468
        1204570CFF00FFFF00FFFF00FF13842814972C15AD3107AF2037C44797E19CDF
        F8E1EDFCEEA1E5A63CC049008D0D04691505681204530DFF00FFFF00FF138428
        23C44E15BA393EC557F3FCF5C7EECCA6E3ACBBEABFA9E5B0F7FEF843C84F019C
        10046D1505630FFF00FF10812124B04F28C35816B941B3E8BFF7FDF811B62B6C
        D27A97DF9E00AB03DBF4DDC6EECA01B310068C1705691303520D10812130C369
        2DC26226BF5643C7684AC96806B32979D68A99DFA200AC08D6F2D8D0F1D302B2
        1208A818067C16055E0E15942E31C66D30C3692EC26423BE5511B84119BA418E
        DDA0D4F2D8C2ECC8FDFFFD58CB6301AF1009B31907961805660F209E393AC873
        2EC26830C36928C06171D592DFF6E5F7FDF9EFFAF2B7E9C24AC85D03B11809B2
        1A09B31909AF19056F0F55B66371D5973DC77324C06166D290FFFFFF9AE1B294
        E0ADA5E4B504B32C03B2250EB5290FB5240AB31B09B619066A0C55B6638CD7A2
        8EE0B022BF5FA1E4BBFDFFFE23BF5E7FDAA0A6E5B918BA4569D2813CC45710B6
        2C10B8260AA61A045307FF00FF41BA58CCF2DE75D89B60D18BFFFFFF86DCA890
        DFAFAFE8C287DBA3FFFFFF5DCF7911B73417BF350B8319FF00FFFF00FF41BA58
        71D18BD5F5E48FDFAE9BE2B7D8F4E3ECFAF1F6FDF9DAF4E481DA9F1CBC4B22C3
        4C17A533055308FF00FFFF00FFFF00FF10A6216ACF87CDF2DFC2EED493E0B1AD
        E8C4B0E9C65ED18B5CD2894BD07B20AD4608620FFF00FFFF00FFFF00FFFF00FF
        FF00FF35B95135B95180D79BB3E9C9B7ECCEAFEAC8A5E7BF80D39C38A551086C
        10FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0AA2191AAB322A
        AF432CAC451E9E330B8516FF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfFlat
      TabOrder = 4
      OnClick = btnFaturarClick
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
