inherited frmCadImpressoras: TfrmCadImpressoras
  Caption = 'Cadastro de Impressoras'
  ClientHeight = 176
  ClientWidth = 429
  FormStyle = fsMDIChild
  KeyPreview = True
  Position = poMainFormCenter
  Visible = True
  OnKeyPress = FormKeyPress
  ExplicitWidth = 445
  ExplicitHeight = 214
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 429
    Height = 48
    ExplicitWidth = 429
    ExplicitHeight = 48
    inherited edtCodigo: TEdit
      Top = 12
      TextHint = ''
      ExplicitTop = 12
    end
    inherited btnNovo: TcxButton
      Left = 166
      ExplicitLeft = 166
    end
  end
  inherited PainelDados: TPanel
    Top = 48
    Width = 429
    Height = 87
    ExplicitTop = 48
    ExplicitWidth = 429
    ExplicitHeight = 87
    object Label1: TLabel
      Left = 38
      Top = 20
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 38
      Top = 53
      Width = 29
      Height = 13
      Caption = 'Marca'
    end
    object EdtNome: TDBEdit
      Left = 71
      Top = 17
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object edtMarca: TDBEdit
      Left = 71
      Top = 50
      Width = 342
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'MARCA'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited PainelBotoes: TPanel
    Top = 135
    Width = 429
    ExplicitTop = 135
    ExplicitWidth = 429
    DesignSize = (
      429
      41)
    inherited btnSair: TcxButton
      Left = 338
      OnClick = btnSairClick
      ExplicitLeft = 338
    end
    inherited btnConfirmar: TcxButton
      Left = 10
      ExplicitLeft = 10
    end
    inherited btnRetornar: TcxButton
      Left = 87
      ExplicitLeft = 87
    end
    inherited btnExcluir: TcxButton
      Left = 164
      ExplicitLeft = 164
    end
  end
  inherited ds: TDataSource
    Left = 336
    Top = 8
  end
  inherited cds: TClientDataSet
    Left = 304
    Top = 8
  end
  inherited dsp: TDataSetProvider
    Left = 272
    Top = 8
  end
  inherited sds: TSQLDataSet
    CommandText = 'SELECT * FROM IMPRESSORAS WHERE ID IS NULL'
    Left = 240
    Top = 8
  end
  inherited dsDet: TDataSource
    Left = 336
    Top = 48
  end
  inherited cdsDet: TClientDataSet
    Left = 304
    Top = 48
  end
  inherited dspDet: TDataSetProvider
    Left = 272
    Top = 48
  end
  inherited sdsDet: TSQLDataSet
    Left = 240
    Top = 48
  end
end
