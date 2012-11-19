object frmInformation: TfrmInformation
  Tag = 100
  Left = 293
  Top = 286
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  ClientHeight = 266
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo01: TPanel
    Left = 86
    Top = 77
    Width = 291
    Height = 145
    TabOrder = 0
    Visible = False
  end
  object pnlBottom: TPanel
    Tag = 100
    Left = 0
    Top = 217
    Width = 444
    Height = 49
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object shpBottom: TShape
      AlignWithMargins = True
      Left = 10
      Top = 1
      Width = 424
      Height = 2
      Margins.Left = 10
      Margins.Top = 1
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Brush.Color = 10768896
      Pen.Style = psClear
      ExplicitTop = 75
      ExplicitWidth = 620
    end
    object btnOK: TcxButton
      Left = 184
      Top = 12
      Width = 75
      Height = 25
      Caption = 'OK'
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
      LookAndFeel.Kind = lfOffice11
      TabOrder = 0
      OnClick = btnOKClick
    end
  end
  object pnlTop: TPanel
    Tag = 100
    Left = 0
    Top = 0
    Width = 444
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object imgIcon: TImage
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 48
      Height = 48
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alLeft
      Transparent = True
    end
    object shpTop: TShape
      AlignWithMargins = True
      Left = 10
      Top = 68
      Width = 424
      Height = 2
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 1
      Align = alBottom
      Brush.Color = 10768896
      Pen.Style = psClear
      ExplicitTop = 75
      ExplicitWidth = 620
    end
    object pnlTitle: TPanel
      Tag = 100
      AlignWithMargins = True
      Left = 68
      Top = 10
      Width = 366
      Height = 48
      Margins.Left = 0
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblCaption: TLabel
        Left = 0
        Top = 0
        Width = 366
        Height = 19
        Align = alTop
        Caption = 'Informa'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 86
      end
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 0
        Top = 24
        Width = 366
        Height = 13
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Caption = 'lblTitle'
        ExplicitWidth = 30
      end
    end
  end
  object pnlClient: TPanel
    Tag = 100
    Left = 0
    Top = 71
    Width = 444
    Height = 146
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object mText: TMemo
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 424
      Height = 126
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      TabStop = False
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'mText')
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
end
