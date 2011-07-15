unit untAutenticacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RxGIF, HkHints,  untDeclaracoes;

type
  TfrmAutenticacao = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    btnAutenticar: TButton;
    btnCancelar: TButton;
    imgVermelha: TImage;
    imgVerde: TImage;
    edtSenha: TEdit;
    Label4: TLabel;
    Label3: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtEmpresa: TEdit;
    lblempresa: TLabel;
    lblusuario: TLabel;
    procedure edtEmpresaExit(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure verificaAcesso();
    procedure btnAutenticarClick(Sender: TObject);
    procedure edtEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaChange(Sender: TObject);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtEmpresaEnter(Sender: TObject);
    procedure edtUsuarioEnter(Sender: TObject);
  private
    f : TFuncoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutenticacao: TfrmAutenticacao;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmAutenticacao.edtEmpresaExit(Sender: TObject);
{
  verificica se a empresa existe no banco de dados, caso ela nao existir
  o edt fica vermelho
}
begin
   if edtEmpresa.Text<>'' then
    begin
       dm.executaSql(dm.cdsAux,'select nmfant as nome from empre where cdempr='+
            QuotedStr(edtEmpresa.Text));

        if dm.cdsAux.IsEmpty then
        begin
            lblempresa.Visible:= true;
            lblEmpresa.Caption := 'Empresa Não Existe!';
            lblEmpresa.Font.Color := clred;
            edtEmpresa.Color := clred;
        end else
        begin
            lblEmpresa.Visible:= true;
            lblEmpresa.Font.Color := clOlive;
            lblEmpresa.Caption := dm.cdsAux.FieldByName('nome').AsString;
            edtEmpresa.Color :=  clWindow;
        end;
    end;
end;

procedure TfrmAutenticacao.edtUsuarioExit(Sender: TObject);
{
  verificica se o usuario existe no banco de dados, caso ele nao existir
  o edt fica vermelho
}
begin
   if edtUsuario.Text <> '' then
    begin
        dm.executaSql(dm.cdsAux,'select uclogin as nome from uctabusers where uciduser='+
            QuotedStr(edtUsuario.Text));

        if dm.cdsAux.IsEmpty then
        begin
            lblusuario.Visible:= true;
            lblusuario.Caption := 'Usuário Não Existe!';
            lblusuario.Font.Color := clred;
            edtUsuario.Color := clred;
        end else
        begin
            lblusuario.Visible:= true;
            lblusuario.Font.Color := clOlive;
            lblusuario.Caption := dm.cdsAux.FieldByName('nome').AsString;
            edtUsuario.Color:= clWindow;
        end;
    end;
end;

procedure TfrmAutenticacao.btnCancelarClick(Sender: TObject);
{
  se clicar no botão cancelar termina a aplicação
}
begin
  Application.Terminate;
end;

procedure TfrmAutenticacao.verificaAcesso;
{
  verifica o acesso do usuario na function no dm,
  caso seja true ele da acesso, dando enabled true
  para o botão autentica
}
begin
   if dm.Autenticacao(StrToInt(edtEmpresa.Text),lblusuario.Caption,edtSenha.Text) then
   begin
       imgVermelha.Visible:= false;
       imgVerde.Visible:= true;
       btnAutenticar.Enabled := true;
   end else
   begin
       imgVermelha.Visible:= true;
       imgVerde.Visible:= false;
       btnAutenticar.Enabled := false;
   end;
end;

procedure TfrmAutenticacao.btnAutenticarClick(Sender: TObject);
{
  atribui as variaveis do form principal, de acordo
  com a autenticação
}
begin
  frmPrincipal.lbEdtNick.Text := 'Emp.: ' + edtEmpresa.Text + ' ' +
                    '" ' + lblusuario.Caption + ' "';
  frmPrincipal.btnConecta.OnClick(Sender);                  
  close;
end;

procedure TfrmAutenticacao.edtEmpresaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmAutenticacao.edtSenhaChange(Sender: TObject);
{
  verifica o acesso a cada letra que o usuario digita
  para asism mostrar o sinal verde ou vermelho
}
begin
    verificaAcesso;
end;

procedure TfrmAutenticacao.edtSenhaEnter(Sender: TObject);
{
  caso o usuario ou empresa estiverem em branco,
  ele não deixa que seja digitada a senha
}
begin
  if edtEmpresa.Text = '' then
  begin
     f.Mensagem(false,'Preencha o código da Empresa!');
     edtEmpresa.SetFocus;
  end
  else if edtUsuario.Text = '' then
  begin
     f.Mensagem(false,'Preencha o código do Usuário!');
     edtUsuario.SetFocus;
  end;
end;

procedure TfrmAutenticacao.edtEmpresaEnter(Sender: TObject);
{
  no onenter de emrpesa ele deixa senha em barnco, para
  que o usuario depois de ter o acesso, não possa mudar a emrpesa
}
begin
  edtSenha.Text := '';
end;

procedure TfrmAutenticacao.edtUsuarioEnter(Sender: TObject);
{
  no onenter de usuario ele deixa senha em barnco, para
  que o usuario depois de ter o acesso, não possa mudar o usuario
}
begin
  edtSenha.Text := '';
end;

end.
