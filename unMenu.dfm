object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'Menu Principal do Sistema'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenuPadrao
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenuPadrao: TMainMenu
    Left = 16
    Top = 8
    object Cadastros: TMenuItem
      Caption = 'Cadastros'
      object m001TFrmCadImpressoras: TMenuItem
        Caption = 'Cadastro de Impressoras'
        ImageIndex = 1
      end
      object m002TFrmCadClientes: TMenuItem
        Caption = 'Cadastro de Clientes'
        ImageIndex = 0
      end
      object m003TFrmCadItens: TMenuItem
        Caption = 'Cadastro de Itens'
        ImageIndex = 6
      end
      object m018TFrmCadConsumiveis: TMenuItem
        Caption = 'Cadastro de Consum'#237'veis'
        ImageIndex = 12
      end
    end
    object Configurações: TMenuItem
      Caption = 'Configura'#231#245'es'
      object m004TFrmCadUsuarios: TMenuItem
        Caption = 'Cadastro de Usu'#225'rios'
        ImageIndex = 4
      end
      object m013TFrmParametros: TMenuItem
        Caption = 'Parametros'
        ImageIndex = 8
      end
      object m015TfrmCadGruposAcesso: TMenuItem
        Caption = 'Grupos de Acesso'
        ImageIndex = 11
      end
      object m016TfrmCadGruposUsuarios: TMenuItem
        Caption = 'Grupos de Usu'#225'rio'
        ImageIndex = 10
      end
    end
    object Gerenciamento: TMenuItem
      Caption = 'Gerenciamento'
      object m007TFrmOS: TMenuItem
        Caption = 'Ordem de Servi'#231'o'
        ImageIndex = 2
      end
      object m008TfrmPesquisaOSAberto: TMenuItem
        Caption = 'Execu'#231#227'o de OS'
        ImageIndex = 9
      end
      object m009TfrmAberturaContador: TMenuItem
        Caption = 'Abertura de Contador'
        ImageIndex = 7
      end
      object m010: TMenuItem
        Caption = 'Relat'#243'rios'
        ImageIndex = 3
        object m011TFrmRelOS: TMenuItem
          Caption = 'Relat'#243'rio de O.S.'
          ImageIndex = 3
        end
        object m012TfrmRelOsResumido: TMenuItem
          Caption = 'Relat'#243'rio de O.S. Resumido'
          ImageIndex = 3
        end
        object m014TFrmRelOSErro: TMenuItem
          Caption = 'Relat'#243'rio de OS com Erro'
        end
        object m017TFrmRelContador: TMenuItem
          Caption = 'Relat'#243'rio de Contadores'
        end
        object m019TFrmRelTrocaConsumiveis: TMenuItem
          Caption = 'Relat'#243'rio de Troca de Consum'#237'veis'
        end
      end
    end
  end
  object sds: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DM.Conn
    Left = 328
    Top = 96
  end
  object dsp: TDataSetProvider
    DataSet = sds
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 360
    Top = 96
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 392
    Top = 96
  end
  object ds: TDataSource
    DataSet = cds
    Left = 424
    Top = 96
  end
end
