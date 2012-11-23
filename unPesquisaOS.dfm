inherited frmPesquisaOS: TfrmPesquisaOS
  Caption = 'Pesquisa de OS'
  ClientHeight = 417
  ClientWidth = 759
  ExplicitWidth = 775
  ExplicitHeight = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 759
    Height = 114
    ExplicitWidth = 759
    ExplicitHeight = 114
    inherited Código: TLabel
      Left = 355
      Top = 63
      ExplicitLeft = 355
      ExplicitTop = 63
    end
    inherited edtConteudo: TEdit
      Left = 355
      Top = 85
      Width = 285
      TabOrder = 3
      ExplicitLeft = 355
      ExplicitTop = 85
      ExplicitWidth = 285
    end
    inherited btnBuscarPesquisa: TcxButton
      Left = 656
      Top = 19
      Height = 56
      TabOrder = 4
      ExplicitLeft = 656
      ExplicitTop = 19
      ExplicitHeight = 56
    end
    inherited btnSair: TcxButton
      Left = 656
      Top = 81
      TabOrder = 5
      ExplicitLeft = 656
      ExplicitTop = 81
    end
    object grpData: TGroupBox
      Left = 6
      Top = 0
      Width = 123
      Height = 107
      Caption = '  Data  '
      Color = clGradientInactiveCaption
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 19
        Width = 27
        Height = 13
        Caption = 'Inicial'
      end
      object Label1: TLabel
        Left = 14
        Top = 57
        Width = 22
        Height = 13
        Caption = 'Final'
      end
      object edtDataInicial: TcxDateEdit
        Left = 12
        Top = 33
        Properties.InputKind = ikRegExpr
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonStyle = btsSimple
        Style.ButtonTransparency = ebtAlways
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        Width = 98
      end
      object edtDataFinal: TcxDateEdit
        Left = 12
        Top = 72
        Properties.InputKind = ikRegExpr
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonStyle = btsSimple
        Style.ButtonTransparency = ebtAlways
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        Width = 98
      end
    end
    object grpStatus: TcxRadioGroup
      Left = 135
      Top = 1
      Caption = '  Status  '
      Properties.Items = <
        item
          Caption = 'Aberta'
          Value = '0'
        end
        item
          Caption = 'Execu'#231#227'o'
          Value = '1'
        end
        item
          Caption = 'Encerrada'
          Value = '2'
        end
        item
          Caption = 'Faturada'
          Value = '3'
        end
        item
          Caption = 'Todas'
          Value = '4'
        end>
      ItemIndex = 0
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Height = 106
      Width = 94
    end
    object grpTipo: TcxRadioGroup
      Left = 236
      Top = 1
      Caption = '  Tipo de Pesquisa  '
      Properties.Items = <
        item
          Caption = 'Cliente'
          Value = '0'
        end
        item
          Caption = 'Arquivo'
          Value = '1'
        end
        item
          Caption = 'Impressora'
          Value = '2'
        end
        item
          Caption = 'Usu'#225'rio'
          Value = '3'
        end>
      ItemIndex = 0
      Style.BorderColor = clGradientActiveCaption
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Height = 106
      Width = 109
    end
  end
  inherited PainelDados: TPanel
    Top = 114
    Width = 759
    Height = 303
    ExplicitTop = 114
    ExplicitWidth = 759
    ExplicitHeight = 303
    inherited grade: TcxGrid
      Width = 757
      Height = 301
      ExplicitWidth = 757
      ExplicitHeight = 301
    end
  end
end
