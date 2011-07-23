program HC;

uses
  Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untDM in 'untDM.pas' {dm: TDataModule},
  untDeclaracoes in 'untDeclaracoes.pas',
  untMensagem in 'untMensagem.pas' {frmMensagem},
  untConfBD in 'untConfBD.pas' {frmConfBD},
  untPesquisaRapida in 'untPesquisaRapida.pas' {frmPesquisaRapida},
  untInicial in 'untInicial.pas' {frmInicial},
  untAutenticacao in 'untAutenticacao.pas' {frmAutenticacao},
  untManutencao in 'untManutencao.pas' {frmManutencao},
  untManuFornecedores in 'untManuFornecedores.pas' {frmManuFornecedores},
  DAO in 'DAO.pas',
  untVisualizaDados in 'untVisualizaDados.pas' {frmVizualizaDados},
  Untfrmcalendario in 'Untfrmcalendario.pas' {frmCalendario},
  SQL in 'SQL.pas',
  untfrmManuEmpresas in 'untfrmManuEmpresas.pas' {frmManuEmpresas},
  untGruposProdutos in 'untGruposProdutos.pas' {frmManuGrupoProdutos},
  untManuProfissoes in 'untManuProfissoes.pas' {frmManuProfissoes},
  untManuFuncionarios in 'untManuFuncionarios.pas' {frmManuFuncionario},
  untManuDepartamento in 'untManuDepartamento.pas' {frmManuDepartamento},
  untManuClientes in 'untManuClientes.pas' {frmManuClientes},
  untManuBanco in 'untManuBanco.pas' {frmManuBanco},
  untManuDepAut in 'untManuDepAut.pas' {frmManuDepAut},
  untManuCartaoFidelidade in 'untManuCartaoFidelidade.pas' {frmManuCartaoFidelidade},
  untManuCheques in 'untManuCheques.pas' {frmManuCheques},
  untManuVendedores in 'untManuVendedores.pas' {frmManuVendedores},
  untManuMarcaProdutos in 'untManuMarcaProdutos.pas' {frmManuMarcaProdutos},
  untDefineEmpresaUsuario in 'untDefineEmpresaUsuario.pas' {frmManuDefineEmpresaUsuario},
  untManuProdutos in 'untManuProdutos.pas' {frmManuProdutos},
  untManuAcertoEstoque in 'untManuAcertoEstoque.pas' {frmManuAcertosEstoque},
  untManuGrades in 'untManuGrades.pas' {frmManuGrades},
  untManuNaturezaOperacao in 'untManuNaturezaOperacao.pas' {frmManuNaturezaOperacao},
  untManuContasPagar in 'untManuContasPagar.pas' {frmManuContasPagar};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HClient';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
