inherited frmRelTrocaConsumiveis: TfrmRelTrocaConsumiveis
  Caption = 'Relat'#243'rio de Troca de Consum'#237'veis'
  ClientHeight = 211
  FormStyle = fsMDIChild
  Position = poScreenCenter
  Visible = True
  ExplicitHeight = 239
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Height = 165
    ExplicitHeight = 165
    object edtImpressora: TGigatronLblEdit
      Left = 9
      Top = 91
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 9
      EditLabel.Top = 75
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Impressora'
      CadastroButton.Left = 69
      CadastroButton.Top = 91
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
      PesquisaButton.Left = 47
      PesquisaButton.Top = 91
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
      TabOrder = 1
      OnEnter = edtImpressoraEnter
      OnExit = edtImpressoraExit
      DescrEdit.Left = 91
      DescrEdit.Top = 91
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
    object edtConsumivel: TGigatronLblEdit
      Left = 9
      Top = 135
      Width = 35
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 9
      EditLabel.Top = 119
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Consum'#237'vel'
      CadastroButton.Left = 69
      CadastroButton.Top = 135
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
      PesquisaButton.Left = 47
      PesquisaButton.Top = 135
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
      PesquisaButton.OnClick = edtConsumivelSubButtonPesquisaClick
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
      OnExit = edtConsumivelExit
      DescrEdit.Left = 91
      DescrEdit.Top = 135
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
      DescrEdit.TabOrder = 4
      OnFrmPesquisaClose = edtConsumivelFrmPesquisaClose
    end
  end
  inherited Panel1: TPanel
    Top = 165
    ExplicitTop = 165
  end
  inherited sds: TSQLDataSet
    CommandText = 
      'SELECT                                  '#13#10'    TROCA.ID_TROCA,   ' +
      '                  '#13#10'    TROCA.ID_CONSUMIVEL,                '#13#10'  ' +
      '  TROCA.DATA,                          '#13#10'    TROCA.CONTADOR,'#13#10'  ' +
      '  TROCA.OBSERVACAO,                      '#13#10'    IMP.NOME,'#13#10'    CO' +
      'NS.DESC_CONSUMIVEL'#13#10'FROM CONSUMIVEIS_TROCA TROCA            '#13#10'  ' +
      '  INNER JOIN CONSUMIVEIS CONS ON      '#13#10'        TROCA.ID_CONSUMI' +
      'VEL = CONS.ID   '#13#10'    INNER JOIN IMPRESSORAS IMP ON       '#13#10'    ' +
      '    IMP.ID = CONS.ID_IMPRESSORA'
  end
  object RvProject1: TRvProject
    Engine = RvSystem
    LoadDesigner = True
    ProjectFile = 'C:\Users\kgb\workspace\OfficeColor\relatorios\relOS.rav'
    Left = 119
    Top = 79
  end
  object rvdsConsumiveis: TRvDataSetConnection
    LocalFilter = False
    RuntimeVisibility = rtDeveloper
    DisableDataSource = False
    RestoreDataSet = False
    DataSet = cds
    Left = 159
    Top = 79
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
    Left = 199
    Top = 79
  end
end
