inherited frmRelOSErro: TfrmRelOSErro
  Caption = 'Relat'#243'rio de OS com Erro'
  ClientHeight = 323
  Position = poScreenCenter
  ExplicitHeight = 351
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Height = 277
    ExplicitHeight = 277
    inherited grpData: TGroupBox
      Anchors = [akLeft, akTop, akRight]
      inherited Label1: TLabel
        Anchors = [akTop, akRight]
      end
      inherited edtDataFinal: TcxDateEdit
        Anchors = [akTop, akRight]
      end
    end
    object edtCliente: TGigatronLblEdit
      Left = 12
      Top = 90
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 12
      EditLabel.Top = 74
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cliente'
      CadastroButton.Left = 72
      CadastroButton.Top = 90
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
      PesquisaButton.Left = 50
      PesquisaButton.Top = 90
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      ParentFont = False
      TabOrder = 1
      OnEnter = edtClienteEnter
      OnExit = edtClienteExit
      DescrEdit.Left = 94
      DescrEdit.Top = 90
      DescrEdit.Width = 170
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
      DescrEdit.TabOrder = 2
      OnFrmPesquisaClose = edtClienteFrmPesquisaClose
    end
    object edtImpressora: TGigatronLblEdit
      Left = 12
      Top = 130
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 12
      EditLabel.Top = 114
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Impressora'
      CadastroButton.Left = 72
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
      PesquisaButton.Left = 50
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
      PesquisaButton.OnClick = edtImpressoraSubButtonPesquisaClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      ParentFont = False
      TabOrder = 3
      OnEnter = edtClienteEnter
      OnExit = edtImpressoraExit
      DescrEdit.Left = 94
      DescrEdit.Top = 130
      DescrEdit.Width = 170
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
      DescrEdit.TabOrder = 5
    end
    object grpOrdenar: TcxRadioGroup
      Left = 6
      Top = 196
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Ordenar Por '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'C'#243'digo'
          Value = '0'
        end
        item
          Caption = 'Cliente'
          Value = '1'
        end
        item
          Caption = 'Data'
          Value = '2'
        end
        item
          Caption = 'Qtd Paginas'
          Value = '3'
        end>
      ItemIndex = 0
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 6
      Height = 55
      Width = 252
    end
    object edtUsuario: TGigatronLblEdit
      Left = 12
      Top = 170
      Width = 80
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      EditLabel.Left = 12
      EditLabel.Top = 154
      EditLabel.Width = 36
      EditLabel.Height = 13
      EditLabel.Caption = 'Usuario'
      CadastroButton.Left = 117
      CadastroButton.Top = 170
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
      PesquisaButton.Left = 95
      PesquisaButton.Top = 170
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
      PesquisaButton.OnClick = edtUsuarioSubButtonPesquisaClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      IsForeignKey = True
      ModalPesquisa = True
      ModalCadastro = False
      ParentFont = False
      TabOrder = 4
      OnEnter = edtClienteEnter
      OnExit = edtUsuarioExit
      DescrEdit.Left = 139
      DescrEdit.Top = 170
      DescrEdit.Width = 125
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
      DescrEdit.TabOrder = 7
      OnFrmPesquisaClose = edtClienteFrmPesquisaClose
    end
  end
  inherited Panel1: TPanel
    Top = 277
    ExplicitTop = 277
  end
  inherited sds: TSQLDataSet
    Left = 95
    Top = 67
  end
  inherited dsp: TDataSetProvider
    Left = 127
    Top = 67
  end
  inherited cds: TClientDataSet
    Left = 159
    Top = 67
  end
  inherited ds: TDataSource
    Left = 191
    Top = 67
  end
  object rvdsOS: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    DataSet = cds
    Left = 191
    Top = 143
  end
  object rvdsDetalhe: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    Left = 111
    Top = 143
  end
  object RvSystem: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 191
    Top = 135
  end
  object RvProject1: TRvProject
    Engine = RvSystem
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 111
    Top = 135
  end
end
