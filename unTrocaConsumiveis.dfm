inherited frmTrocaConsumiveis: TfrmTrocaConsumiveis
  Caption = 'Troca de Consum'#237'veis'
  ClientHeight = 247
  ClientWidth = 351
  Position = poScreenCenter
  ExplicitWidth = 367
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  object PainelDados: TPanel
    Left = 0
    Top = 0
    Width = 351
    Height = 247
    Align = alClient
    BevelOuter = bvLowered
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -8
    DesignSize = (
      351
      247)
    object Label1: TLabel
      Left = 10
      Top = 110
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object edtNome: TLabeledDBEdit
      Left = 71
      Top = 9
      Width = 266
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DESC_CONSUMIVEL'
      DataSource = frmCadConsumiveis.ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      EditLabel.Left = 41
      EditLabel.Top = 12
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      CadastroButton.Left = 340
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
      PesquisaButton.Left = 340
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
      Text = 'EDTNOME'
      DescrEdit.Left = 340
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
    object edtContador: TGigatronLblEdit
      Left = 71
      Top = 84
      Width = 101
      Height = 20
      AutoSize = False
      BorderStyle = bsNone
      EditLabel.Left = 23
      EditLabel.Top = 87
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = 'Contador'
      CadastroButton.Left = 175
      CadastroButton.Top = 84
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
      PesquisaButton.Left = 175
      PesquisaButton.Top = 84
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
      TabOrder = 2
      DescrEdit.Left = 175
      DescrEdit.Top = 84
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
    object btnConfirmar: TcxButton
      Left = 97
      Top = 213
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Confirmar'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        000000000000000000000101020711051A3C3608568F55078DC66606A8DA6505
        A8DB580690C839085B9514051E42020102090000000000000000000000000000
        000000000000050208173408538C7105BCEA8801E5FE8C00ECFF8C00ECFF8C00
        ECFF8C00ECFF8901E7FF7504C1EE39085C9707030A1D00000000000000000000
        00000502071743086BA88302DCFB8C00ECFF8B00EAFF8003D8FA7404C1ED7304
        C0ED8003D6F98B00E9FF8C00ECFF8103D8FB2B09438500000004000000000101
        0106320851898302DCFB8C00ECFF8102DAFA4F0782BD1F06315F0E0416340E04
        15321D062E594B0879B57B04CDF64F0780BC0A030E2600000000000000001004
        18376F05B9E88C00ECFF8202DBFA39085A950502071600000001010102090102
        020A00000001040205111D072D630A030E250000000000000000000000023207
        4F878701E3FE8B00EBFF510785C005020717010202080631345F087D83B60880
        88B907383C690103040C0000000100000000000000000000000001010108370A
        579D6306A3D75E079BD51D062D5D00000001062E315A04C9D5F000F1FEFF00F1
        FEFF04D1DEF5073A3D6B00000001000000000000000000000000000000020402
        051305030719050307180101020801010106077279AC00F1FEFF00F2FFFF00F2
        FFFF00F2FFFF07858DBD0102020B000000000000000000000000000000020706
        03190A0803200A0803200202010A01010106087077AA00F0FDFF00F2FFFF00F2
        FFFF00F1FEFF07838BBB0102020B000000000000000000000000010101085B45
        0BA2B08105DFA87C07DD3226076300000001062B2D5505C5CFEE00F0FDFF00F1
        FEFF04CED9F30736396600000001000000000000000000000000000000014C39
        0883E5A701FEEEAD00FF8D6907C60907031B01020207062B2E57077379AD0877
        7EB0073235600103030A00000001000000000000000000000000000000001510
        0533B58605E5EFAE00FFE0A302FB644B079F0907031B00000001010101060101
        010700000001070602163528096F110D042C0000000000000000000000000101
        01054A380881DB9F03F9EFAE00FFE0A302FB8D6907C63B2C076C1C16053E1B15
        053D37290766856307BFD79C03F98A6708C4110E042C00000000000000000000
        000006050213634A079EDB9F03F9EFAE00FFEEAD00FFDFA202FCCD9604F3CB95
        04F2DDA102FBEDAD00FFEFAE00FFD99F03FA42320A8300000004000000000000
        0000000000000605021349370880B58405E4E5A601FEEFAE00FFEFAE00FFEFAE
        00FFEFAE00FFE6A701FEBB8905E8523E088B0806021700000000000000000000
        0000000000000000000001010105151004324B380881825F07BB9D7406D19F75
        06D2856307BD503C088718120538010101060000000000000000}
      LookAndFeel.Kind = lfFlat
      TabOrder = 4
      OnClick = btnConfirmarClick
    end
    object btnSair: TcxButton
      Left = 178
      Top = 213
      Width = 75
      Height = 25
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
      LookAndFeel.Kind = lfFlat
      TabOrder = 5
      OnClick = btnSairClick
    end
    object MemoObs: TMemo
      Left = 71
      Top = 111
      Width = 266
      Height = 89
      BorderStyle = bsNone
      TabOrder = 3
    end
    object LabeledDBEdit1: TLabeledDBEdit
      Left = 71
      Top = 35
      Width = 266
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = frmCadConsumiveis.dsDet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'courier new'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      EditLabel.Left = 14
      EditLabel.Top = 38
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Impressora'
      CadastroButton.Left = 340
      CadastroButton.Top = 35
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
      PesquisaButton.Left = 340
      PesquisaButton.Top = 35
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
      DescrEdit.Left = 340
      DescrEdit.Top = 35
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
