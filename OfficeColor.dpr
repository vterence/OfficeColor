program OfficeColor;



uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unPadraoCadastro in 'unPadraoCadastro.pas' {frmPadraoCadastro},
  unCadImpressoras in 'unCadImpressoras.pas' {frmCadImpressoras},
  unDM in 'unDM.pas' {DM: TDataModule},
  unPadrao in 'unPadrao.pas' {FrmPadrao},
  unMenu in 'unMenu.pas' {frmMenu},
  unRegrasForm in 'unRegrasForm.pas',
  unConfirmation in 'unConfirmation.pas' {frmConfirmation},
  unWarning in 'unWarning.pas' {frmWarning},
  unInformation in 'unInformation.pas' {frmInformation},
  unError in 'unError.pas' {frmError},
  unCadClientes in 'unCadClientes.pas' {frmCadClientes},
  unLogin in 'unLogin.pas' {FrmLogin},
  unCadUsuarios in 'unCadUsuarios.pas' {frmCadUsuarios},
  unPadraoPesquisas in 'unPadraoPesquisas.pas' {frmPadraoPesquisas},
  unCadItens in 'unCadItens.pas' {frmCadItens},
  unRelClientes in 'unRelClientes.pas' {frmRelClientes},
  unRotinasCEP in 'unRotinasCEP.pas',
  unOS in 'unOS.pas' {frmOS},
  unPesquisaOSAberto in 'unPesquisaOSAberto.pas' {frmPesquisaOSAberto},
  unDatas in 'unDatas.pas',
  unExecOS in 'unExecOS.pas' {frmExecOS},
  unAberturaContador in 'unAberturaContador.pas' {frmAberturaContador},
  unRelOS in 'unRelOS.pas' {frmRelOS},
  unRelOSResumido in 'unRelOSResumido.pas' {frmRelOsResumido},
  unParametros in 'unParametros.pas' {frmParametros},
  unPadraoRelatorios in 'unPadraoRelatorios.pas' {frmPadraoRelatorios},
  unRelOSErro in 'unRelOSErro.pas' {frmRelOSErro},
  unPesquisaOS in 'unPesquisaOS.pas' {frmPesquisaOS},
  unCadGruposAcesso in 'unCadGruposAcesso.pas' {frmCadGruposAcesso},
  unCadGruposUsuarios in 'unCadGruposUsuarios.pas' {frmCadGruposUsuarios},
  unRelContador in 'unRelContador.pas' {frmRelContador},
  unCadConsumiveis in 'unCadConsumiveis.pas' {frmCadConsumiveis},
  unTrocaConsumiveis in 'unTrocaConsumiveis.pas' {frmTrocaConsumiveis},
  unRelTrocaConsumiveis in 'unRelTrocaConsumiveis.pas' {frmRelTrocaConsumiveis};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Office Color';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin.ShowModal;

  if not frmPrincipal.confirmou_login then
    Application.Terminate;

  frmLogin.Hide;

  Application.Run;
end.
