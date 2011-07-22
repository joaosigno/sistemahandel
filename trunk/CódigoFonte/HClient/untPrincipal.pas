unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPStyleActnCtrls, ActnList, ActnMan, ToolWin, ActnCtrls,
  ActnMenus, ComCtrls, ExtCtrls, jpeg, StdCtrls, ImgList, RxGIF, UCBase,
  UCDataConnector, UCMidasConn, DB, DBClient, UCIdle, UCSettings, HkHints,
  XpMan, Menus, untDeclaracoes, DAO, Formulario, UCMail, RXShell, AppEvnts,
  Buttons;

type
   TConfiguracao = record  //Configurações do software
    EmpresaNome: String;
    EmpresaCodigo: integer;
    UsuarioNome: String;
    UsuarioCodigo: integer;
    NomeSoftware: string;
    SloganSoftware: string;
    Versao: string;
    Registrado: boolean;
    RazaoSocial: String;
    Telefone: String;
    Responsavel: String;
    Licencas: integer;
  End;

  TfrmPrincipal = class(TForm)
    amPrincipal: TActionManager;
    imgPrincipal: TImage;
    sbPrincipal: TStatusBar;
    lblData: TLabel;
    imgtoolbar: TImageList;
    AcFornecedores: TAction;
    tmSbPrincipal: TTimer;
    imgsbPrincipal: TImageList;
    UserControl: TUserControl;
    acSair: TAction;
    acCadastroUsuario: TAction;
    acPerfilUsuario: TAction;
    acAlterarSenhaUsuario: TAction;
    acTrocarUsuario: TAction;
    acCalendario: TAction;
    pnlPrincipal: TPanel;
    tbPrincipal: TToolBar;
    tbClientes: TToolButton;
    tbFornecedores: TToolButton;
    tbProdutos: TToolButton;
    tbCompras: TToolButton;
    tbCheques: TToolButton;
    tbContasReceber: TToolButton;
    tbContasaPagar: TToolButton;
    tbVendas: TToolButton;
    tbConfiguracoes: TToolButton;
    ToolButton21: TToolButton;
    tbSair: TToolButton;
    ToolButton1: TToolButton;
    Label1: TLabel;
    acEmpresa: TAction;
    acGrupos: TAction;
    acmmbPrincipal: TActionMainMenuBar;
    acHChat: TAction;
    tmOcioso: TTimer;
    acProfissoes: TAction;
    acTrocaUsuario: TAction;
    acModoEspera: TAction;
    acDepartamentos: TAction;
    acFuncionarios: TAction;
    acClientes: TAction;
    acBanco: TAction;
    acCadCartoaFidelidade: TAction;
    acCheques: TAction;
    acVendedores: TAction;
    acMarca: TAction;
    acDefineEmpresaUsuario: TAction;
    acProduto: TAction;
    aePrincipal: TApplicationEvents;
    acAcertoEstoque: TAction;
    procedure AcFornecedoresExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tmSbPrincipalTimer(Sender: TObject);
    procedure sbPrincipalDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure config();
    procedure acBloquearExecute(Sender: TObject);
    procedure mSairClick(Sender: TObject);
    procedure sbPrincipalClick(Sender: TObject);
    procedure acCalendarioExecute(Sender: TObject);
    procedure acEmpresaExecute(Sender: TObject);
    procedure acGruposExecute(Sender: TObject);
    procedure acSairExecute(Sender: TObject);
    procedure acHChatExecute(Sender: TObject);
    procedure tmOciosoTimer(Sender: TObject);
    procedure acProfissoesExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acModoEsperaExecute(Sender: TObject);
    procedure acTrocaUsuarioExecute(Sender: TObject);
    procedure acDepartamentosExecute(Sender: TObject);
    procedure acFuncionariosExecute(Sender: TObject);
    procedure acClientesExecute(Sender: TObject);
    procedure acBancoExecute(Sender: TObject);
    procedure acCadCartoaFidelidadeExecute(Sender: TObject);
    procedure acVendedoresExecute(Sender: TObject);
    procedure acChequesExecute(Sender: TObject);
    procedure acMarcaExecute(Sender: TObject);
    procedure acDefineEmpresaUsuarioExecute(Sender: TObject);
    procedure acProdutoExecute(Sender: TObject);
    procedure aePrincipalException(Sender: TObject; E: Exception);
    procedure acAcertoEstoqueExecute(Sender: TObject);
  private
    F : TFuncoes;
    { Private declarations }
  public
    Configuracao: TConfiguracao;
    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untDM, untMensagem, untConfBD,
  untInicial, untAutenticacao, untManutencao, untVisualizaDados, Untfrmcalendario,
  untManuFornecedores, untfrmManuEmpresas, untGruposProdutos,
  untManuProfissoes, untManuDepartamento, untManuFuncionarios,
  untManuClientes, untManuBanco, untManuCartaoFidelidade, untManuCheques,
  untManuVendedores, untManuMarcaProdutos, untDefineEmpresaUsuario,
  untManuProdutos, untManuAcertoEstoque;

{$R *.dfm}

procedure TfrmPrincipal.AcFornecedoresExecute(Sender: TObject);
{
  abre Frmfornecedores
}
begin
   RegisterClass (TfrmManuFornecedores);
   VD.showForm('Fornecedores',dm.cdsFor,'TfrmManuFornecedores',
                         '*','forne',' order by cdforn');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
{
  Abre o form Inicial, depois o form de Autenticação,
  coloca a data por extenso, atualiza as configurações,
  e passa os parametros do hint
}
var f:TFuncoes;
begin
  f.AbreForm(TfrmInicial,frmInicial,1);
  frmInicial.Free;
  f.AbreForm(TfrmAutenticacao,frmAutenticacao,1);
  frmAutenticacao.Free;
  lblData.Caption := f.DataExtenso(date,1);

  config;
  SetHintParams(Configuracao.NomeSoftware,'Versão '+Configuracao.Versao,True, htNone);

   Application.OnMessage := AppMessage;
   Application.OnIdle := AppIdle;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
{
  muda o hint do sistema, e verifica a conexão com o banco de dados,
  caso não haja conexão ele abre a tela de confg do banco de dados
}
var f:TFuncoes;
begin
  application.icon.loadfromfile('C:\handel\Imagens\hclient.ico');
  SetHkHintStyle(htPrateado);
  Application.HintHidePause:= 100000;
  UserControl.DataConnector := dm.UCCon;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
{
  ajeita o tamanho da statusbar
}
begin
  sbPrincipal.Panels.Items[0].Width := sbPrincipal.Width - 410;
  sbPrincipal.Panels.Items[1].Width := 130;
  sbPrincipal.Panels.Items[2].Width := 180;
  sbPrincipal.Panels.Items[3].Width := 70;
end;

procedure TfrmPrincipal.tmSbPrincipalTimer(Sender: TObject);
{
  verifica se o sistema e registrado
}
begin
  if not Configuracao.Registrado then
  begin
     sbPrincipal.Panels.Items[0].Text := Configuracao.NomeSoftware + ' - ' + Configuracao.Versao + ' [Demo Teste]';
     frmPrincipal.Caption := Configuracao.NomeSoftware + ' - ' + Configuracao.Versao + ' [Demo Teste]';
    sbPrincipal.Panels.Items[3].Text := TimeToStr(Time);
  end else
  begin
    sbPrincipal.Panels.Items[0].Text := Configuracao.NomeSoftware + ' - ' + Configuracao.Versao;
    sbPrincipal.Panels.Items[3].Text := TimeToStr(Time);
  end;
end;

procedure TfrmPrincipal.sbPrincipalDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
{
  coloca a simagens na status bar, na posicao 1 e 2
}
begin
  with sbPrincipal.Canvas do
  begin
    FillRect(Rect);
    imgsbPrincipal.Draw(sbPrincipal.Canvas,Rect.Left+5,Rect.Top+0,Panel.Index-1);
    Font.Name := 'Courier New';
    if Panel.Index = 1 then TextOut(Rect.Left + 20, Rect.Top + 0,' '+Configuracao.UsuarioNome);
    if Panel.Index = 2 then TextOut(Rect.Left + 20, Rect.Top + 0,' '+inttostr(Configuracao.EmpresaCodigo) + ' - ' + Configuracao.EmpresaNome);
    if Panel.Index = 3 then TextOut(Rect.Left + 20, Rect.Top + 0,' '+datetostr(date));
  end;
end;

procedure TfrmPrincipal.config;
{
  atualiza as configurações
}
begin
  Configuracao.NomeSoftware:= 'Handel';
  Configuracao.SloganSoftware:= '';
  Configuracao.Versao:= '1.0';
  Configuracao.Registrado:= false;
  Configuracao.RazaoSocial:= dm.cdsEmprzsoci.AsString;
  Configuracao.Telefone:= dm.cdsEmptelefo.AsString;
  Configuracao.Responsavel:= dm.cdsEmprespon.AsString;
//  Configuracao.Licencas: ;
end;

procedure TfrmPrincipal.acBloquearExecute(Sender: TObject);
var f: TFuncoes;
begin
    Application.CreateForm(TfrmAutenticacao,frmAutenticacao);
    frmAutenticacao.edtEmpresa.Text := IntToStr(Configuracao.EmpresaCodigo);
    frmAutenticacao.lblempresa.Caption := Configuracao.EmpresaNome;
    frmAutenticacao.edtEmpresa.Enabled := false;
    frmAutenticacao.edtUsuario.Text := IntToStr(Configuracao.UsuarioCodigo);
    frmAutenticacao.lblusuario.Caption := Configuracao.UsuarioNome;
    frmAutenticacao.edtUsuario.Enabled := false;
    frmAutenticacao.btnAutenticar.Caption := 'Desbloq.';
    frmAutenticacao.ShowModal;
    frmAutenticacao.Free;
end;

procedure TfrmPrincipal.mSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.sbPrincipalClick(Sender: TObject);
var
  pt: TPoint;
  posicaoy,posicaox:integer;
  Msg: String;
begin
  GetCursorPos(pt);
  posicaoy := pt.y - frmprincipal.top;
  posicaox := pt.X - frmprincipal.Left;
  if (posicaoy > height-30) and (posicaoy < height-5) and (posicaox > width-95) and (posicaox < width - 20) then
  begin
    acCalendario.Execute;
  end;
end;

procedure TfrmPrincipal.acCalendarioExecute(Sender: TObject);
begin
  frmCalendario := TfrmCalendario.Create(Application);
  frmCalendario.Show;
end;

procedure TfrmPrincipal.acEmpresaExecute(Sender: TObject);
begin
  RegisterClass (TfrmManuEmpresas);
  VD.showForm('Empresas',dm.cdsEmp,'TfrmManuEmpresas',
                         '*','empre',' order by cdempr');
end;

procedure TfrmPrincipal.acGruposExecute(Sender: TObject);
begin
  RegisterClass (TfrmManuGrupoProdutos);
  VD.showForm('Grupos de Produtos',dm.cdsGRPro,'TfrmManuGrupoProdutos',
                         '*','grpro',' order by cdgrup');
end;

procedure TfrmPrincipal.acSairExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.acHChatExecute(Sender: TObject);
begin
  WinExec('C:\handel\CódigoFonte\HChat\hchat.exe', SW_SHOW);
end;

procedure TfrmPrincipal.AppIdle(Sender: TObject; var Done: Boolean);
begin
  tmOcioso.Enabled := True;
end;

procedure TfrmPrincipal.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
   Case Msg.message of WM_LBUTTONDOWN,WM_RBUTTONDOWN,WM_KEYDOWN:
          tmOcioso.Enabled := False;end;
end;

procedure TfrmPrincipal.tmOciosoTimer(Sender: TObject);
begin
  acModoEspera.Execute;
end;

procedure TfrmPrincipal.acProfissoesExecute(Sender: TObject);
begin
  RegisterClass (TfrmManuProfissoes);
  VD.showForm('Profissões',dm.cdsProfi,'TfrmManuProfissoes',
                         '*','profi',' order by cdprof');
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tmSbPrincipal.Enabled:= false;
end;

procedure TfrmPrincipal.acModoEsperaExecute(Sender: TObject);
begin
  if f.checaForm(frmAutenticacao) then
  begin
    {se ele ja estiver aberto não faz nada}
  end else
  begin
    frmAutenticacao := TfrmAutenticacao.Create(Application);
    frmAutenticacao.btnAutenticar.Caption := 'Desboq.';
    frmAutenticacao.edtEmpresa.Text := IntToSTR(frmPrincipal.Configuracao.EmpresaCodigo);
    frmAutenticacao.edtEmpresa.OnExit(Sender);
    frmAutenticacao.edtEmpresa.Enabled := false;
    frmAutenticacao.edtUsuario.Text := IntToSTR(frmPrincipal.Configuracao.UsuarioCodigo);
    frmAutenticacao.edtUsuario.OnExit(Sender);
    frmAutenticacao.edtUsuario.Enabled := false;
    frmAutenticacao.ShowModal;
    frmAutenticacao.Free;
  end;  
end;

procedure TfrmPrincipal.acTrocaUsuarioExecute(Sender: TObject);
begin
  if f.checaForm(frmAutenticacao) then
  begin
    {se ele ja estiver aberto não faz nada}
  end else
  begin
    frmAutenticacao := TfrmAutenticacao.Create(Application);
    frmAutenticacao.btnAutenticar.Caption := 'Trocar';
    frmAutenticacao.edtEmpresa.Text := IntToSTR(frmPrincipal.Configuracao.EmpresaCodigo);
    frmAutenticacao.edtEmpresa.OnExit(Sender);
    frmAutenticacao.edtEmpresa.Enabled := false;
    frmAutenticacao.ShowModal;
    frmAutenticacao.free;
    sbPrincipal.Panels[1].Text := Configuracao.UsuarioNome;
  end;  
end;

procedure TfrmPrincipal.acDepartamentosExecute(Sender: TObject);
begin
  RegisterClass (TfrmManuDepartamento);
  VD.showForm('Departamentos',dm.cdsDepa,'TfrmManuDepartamento',
                         '*','depar',' order by cddepa');
end;

procedure TfrmPrincipal.acFuncionariosExecute(Sender: TObject);
begin
  RegisterClass (TfrmManuFuncionario);
  VD.showForm('Funcionários',dm.cdsFunc,'TfrmManuFuncionario',
                         '*','funci',' order by cdfunc');
end;

procedure TfrmPrincipal.acClientesExecute(Sender: TObject);
begin
  RegisterClass (TfrmManuClientes);
  VD.showForm('Clientes',dm.cdsCli,'TfrmManuClientes',
                         '*','clien',' order by cdclie');
end;

procedure TfrmPrincipal.acBancoExecute(Sender: TObject);
begin
  RegisterClass (TfrmManuBanco);
  VD.showForm('Bancos',dm.cdsBanc,'TfrmManuBanco',
                         '*','banco',' order by cdban');
end;

procedure TfrmPrincipal.acCadCartoaFidelidadeExecute(
  Sender: TObject);
begin
  RegisterClass (TfrmManuCartaoFidelidade);
  VD.showForm('Bancos',dm.cdsCartFid,'TfrmManuCartaoFidelidade',
                         '*','crfid',' order by nrcart');
end;

procedure TfrmPrincipal.acVendedoresExecute(Sender: TObject);
begin
 RegisterClass(TfrmManuVendedores);
 VD.showForm('Vendedores',dm.cdsVende,'TfrmManuVendedores',
                         '*','vende',' order by cdvend');
end;

procedure TfrmPrincipal.acChequesExecute(Sender: TObject);
begin
  RegisterClass(TfrmManuCheques);
 VD.showForm('Cheques',dm.cdsCheque,'TfrmManuCheques',
                         '*','cheqs',' order by cdchq');
end;

procedure TfrmPrincipal.acMarcaExecute(Sender: TObject);
begin
  RegisterClass(TfrmManuMarcaProdutos);
 VD.showForm('Marcas',dm.cdsMcPro,'TfrmManuMarcaProdutos',
                         '*','mcpro',' order by cdmarc');
end;

procedure TfrmPrincipal.acDefineEmpresaUsuarioExecute(Sender: TObject);
begin
   frmManuDefineEmpresaUsuario := TfrmManuDefineEmpresaUsuario.Create(Application);
   ManuDAO.SQL.executaSQlPorEmp(dm.cdsUsu,'*',' uctabusers',' or' +
              ' cdempr is null and uctyperec=''U''');
   frmManuDefineEmpresaUsuario.ShowModal;
   frmManuDefineEmpresaUsuario.Free;

   //uciduser<>1 and cdempr=1 
end;

procedure TfrmPrincipal.acProdutoExecute(Sender: TObject);
begin
   RegisterClass(TfrmManuProdutos);
 VD.showForm('Produtos',dm.cdsProd,'TfrmManuProdutos',
                         '*','produ',' order by cdprod');
end;

procedure TfrmPrincipal.aePrincipalException(Sender: TObject;
  E: Exception);
begin
  f.Mensagem(true,E.Message);
end;

procedure TfrmPrincipal.acAcertoEstoqueExecute(Sender: TObject);
begin
    frmManuAcertosEstoque := TfrmManuAcertosEstoque.Create(Application);
    frmManuAcertosEstoque.ShowModal;
    frmManuAcertosEstoque.Free;
end;

end.
