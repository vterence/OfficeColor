inherited frmRelContador: TfrmRelContador
  Caption = 'Relat'#243'rio de Contador'
  ClientHeight = 207
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitHeight = 235
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Height = 161
    ExplicitHeight = 161
    inherited grpData: TGroupBox
      Anchors = [akLeft, akTop, akRight]
      inherited Label1: TLabel
        Anchors = [akTop, akRight]
      end
      inherited edtDataFinal: TcxDateEdit
        Anchors = [akTop, akRight]
      end
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
      TabOrder = 2
      OnEnter = edtImpressoraEnter
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
      DescrEdit.TabOrder = 3
      OnFrmPesquisaClose = edtImpressoraFrmPesquisaClose
    end
    object grpStatus: TcxRadioGroup
      Left = 6
      Top = 71
      Anchors = [akLeft, akTop, akRight]
      Caption = '  Contador  '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Fechado'
          Value = '0'
        end
        item
          Caption = 'Todos'
          Value = '1'
        end>
      ItemIndex = 1
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Height = 39
      Width = 252
    end
  end
  inherited Panel1: TPanel
    Top = 161
    ExplicitTop = 161
  end
  inherited RvRenderPDF1: TRvRenderPDF
    Left = 191
    Top = 207
  end
  inherited RvRenderHTML1: TRvRenderHTML
    Left = 151
    Top = 207
  end
  inherited sds: TSQLDataSet
    Left = 111
    Top = 59
  end
  inherited dsp: TDataSetProvider
    Left = 143
    Top = 59
  end
  inherited cds: TClientDataSet
    Left = 175
    Top = 59
  end
  inherited ds: TDataSource
    Left = 207
    Top = 59
  end
  object rvdsContador: TRvDataSetConnection
    LocalFilter = False
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = cds
    Left = 151
    Top = 135
  end
  object RvProject1: TRvProject
    Engine = RvSystem
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 111
    Top = 135
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
end
