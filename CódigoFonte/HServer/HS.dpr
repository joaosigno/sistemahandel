program HS;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  HS_TLB in 'HS_TLB.pas',
  untRDM in 'untRDM.pas' {RDM: TRemoteDataModule} {RDM: CoClass},
  untAcessos in 'untAcessos.pas' {frmAcessos},
  Chat_Tools in 'Chat_Tools.pas',
  Client_Tools in 'Client_Tools.pas';

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
