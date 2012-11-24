inherited frmPesquisasGeral: TfrmPesquisasGeral
  Left = 89
  Top = 150
  HelpType = htKeyword
  HelpKeyword = 'manuais\sisco_regras_de_negocio\pesquisas.htm#'
  ClientWidth = 631
  ExplicitWidth = 647
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 631
    ExplicitWidth = 766
    inherited btnBuscarPesquisa: TcxButton
      OnClick = btnBuscarPesquisaClick
    end
  end
  inherited PainelDados: TPanel
    Width = 631
    ExplicitWidth = 766
    inherited grade: TcxGrid
      Width = 629
      ExplicitWidth = 764
    end
  end
end
