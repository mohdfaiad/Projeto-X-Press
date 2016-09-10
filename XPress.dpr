program XPress;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmEsqueciSenha in 'uFrmEsqueciSenha.pas' {frmRedefinirSenha},
  uFrmLogin in 'uFrmLogin.pas' {frmLogin},
  uFrmCadastro in 'uFrmCadastro.pas' {frmCadastro},
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmMain},
  uFrmCarregando in 'uFrmCarregando.pas' {frmCarregando},
  uFrmTelaToolBar in 'uFrmTelaToolBar.pas' {frmTelaToolBar},
  ufrmMapa in 'ufrmMapa.pas' {frmMapa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
