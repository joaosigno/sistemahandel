program HChat;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  Chat_Tools in 'Chat_Tools.pas',
  Client_Tools in 'Client_Tools.pas',
  untAutenticacao in 'untAutenticacao.pas' {frmAutenticacao},
  untDeclaracoes in 'untDeclaracoes.pas',
  untMensagem in 'untMensagem.pas' {frmMensagem},
  untDM in 'untDM.pas' {dm: TDataModule},
  untConfBD in 'untConfBD.pas' {frmConfBD};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
