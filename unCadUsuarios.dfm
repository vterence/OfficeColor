inherited frmCadUsuarios: TfrmCadUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 176
  ClientWidth = 346
  FormStyle = fsMDIChild
  Position = poMainFormCenter
  Visible = True
  ExplicitWidth = 352
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited PainelCodigo: TPanel
    Width = 346
    ExplicitWidth = 346
    inherited Código: TLabel
      Left = 42
      Width = 25
      Caption = 'Login'
      ExplicitLeft = 42
      ExplicitWidth = 25
    end
    inherited edtCodigo: TEdit
      CharCase = ecUpperCase
    end
    inherited btnNovo: TcxButton
      Visible = False
    end
  end
  inherited PainelDados: TPanel
    Width = 346
    Height = 94
    ExplicitWidth = 346
    ExplicitHeight = 94
    object label1: TLabel
      Left = 38
      Top = 25
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object Label2: TLabel
      Left = 38
      Top = 52
      Width = 29
      Height = 13
      Caption = 'Grupo'
    end
    object edtSenha: TDBEdit
      Left = 71
      Top = 22
      Width = 242
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      DataField = 'SENHA'
      DataSource = ds
      PasswordChar = '*'
      TabOrder = 0
    end
    object cmbGrupo: TcxDBLookupComboBox
      Left = 71
      Top = 49
      DataBinding.DataField = 'COD_GRUPO'
      DataBinding.DataSource = ds
      Properties.KeyFieldNames = 'COD_GRUPO'
      Properties.ListColumns = <
        item
          FieldName = 'DESC_USR_GRUPO'
        end>
      Properties.ListSource = dsDet
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 242
    end
  end
  inherited PainelBotoes: TPanel
    Top = 135
    Width = 346
    ExplicitTop = 135
    ExplicitWidth = 346
    inherited btnSair: TcxButton
      Left = 255
      ExplicitLeft = 255
    end
  end
  inherited ds: TDataSource
    Left = 296
    Top = 8
  end
  inherited cds: TClientDataSet
    AfterOpen = cdsAfterOpen
    Left = 264
    Top = 8
  end
  inherited dsp: TDataSetProvider
    Left = 232
    Top = 8
  end
  inherited sds: TSQLDataSet
    Left = 200
    Top = 8
  end
  inherited dsDet: TDataSource
    Left = 112
    Top = 112
  end
  inherited cdsDet: TClientDataSet
    Left = 80
    Top = 112
  end
  inherited dspDet: TDataSetProvider
    Left = 48
    Top = 112
  end
  inherited sdsDet: TSQLDataSet
    CommandText = 'SELECT * FROM USUARIOS_GRUPOS'
    Left = 16
    Top = 112
  end
  inherited XPManifest1: TXPManifest
    Left = 152
    Top = 112
  end
end
