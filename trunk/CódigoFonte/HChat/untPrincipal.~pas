unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdComponent, IdTCPConnection, IdTCPClient,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, StdCtrls, Buttons,
  ExtCtrls, ShellApi, IdIntercept, jpeg, Client_Tools, Chat_Tools, UCBase,
  Menus, ActnList, XPStyleActnCtrls, untDeclaracoes, ActnMan, RxCombos,
  ColorGrd, UCDataConnector, UCMidasConn, inifiles;

type
  TfrmPrincipal = class(TForm)
    pgHChat: TPageControl;
    tbinicio: TTabSheet;
    tbconfiguracoes: TTabSheet;
    Label1: TLabel;
    cmbUsuario: TComboBox;
    cboxReservado: TCheckBox;
    btnEnviar: TBitBtn;
    IdAntiFreeze1: TIdAntiFreeze;
    IdTCPClient1: TIdTCPClient;
    lbEdtServidor: TLabeledEdit;
    lbEdtNick: TLabeledEdit;
    lbEdtPorta: TLabeledEdit;
    btnConecta: TBitBtn;
    Label2: TLabel;
    lblConectadoServidor: TLabel;
    Image1: TImage;
    Label3: TLabel;
    UserControl1: TUserControl;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    memoEdtMsg: TEdit;
    Label4: TLabel;
    SaveDialog1: TSaveDialog;
    Memo1: TRichEdit;
    ColorGrid1: TColorGrid;
    Label5: TLabel;
    Button1: TButton;
    ucMCon: TUCMidasConn;
    procedure btnConectaClick(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnEnviarClick(Sender: TObject);
    procedure lbEdtNickChange(Sender: TObject);
    procedure cmbUsuarioSelect(Sender: TObject);
    procedure memoEdtMsgKeyPress(Sender: TObject; var Key: Char);
    procedure Label4Click(Sender: TObject);
    procedure ColorGrid1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure ShowReceiveMsg;
    procedure ListUsers;
    procedure UnknowCmd;
    procedure NickExistente;
    procedure ShowServerError;
    procedure SetCaptionAndAppTitle(Text: String);
    { Private declarations }
  public
    F: TFuncoes;
    { Public declarations }
  end;

  TClientThread = class(TThread)
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses StrUtils, untAutenticacao, untDM, untConfBD;

{$R *.dfm}

procedure TfrmPrincipal.btnConectaClick(Sender: TObject);
begin
  if IdTCPClient1.Connected then
     IdTCPClient1.Disconnect
  else
  begin
    IdTCPClient1.Host := lbEdtServidor.Text;
    IdTCPClient1.Port := StrToInt(lbEdtPorta.Text);
    IdTCPClient1.Connect(5000);
  end;
end;  

procedure TfrmPrincipal.IdTCPClient1Connected(Sender: TObject);
begin
  IdTCPClient1.WriteLn('nick='+lbEdtNick.Text);
  btnConecta.Caption := 'Dis&conectar';
  lblConectadoServidor.Caption:= 'Conectado ao Servidor Remoto!';
  TClientThread.Create(false);
  SetCaptionAndAppTitle('HChat - ' + lbEdtNick.Text);
  Memo1.Lines.Clear;
end;

procedure TfrmPrincipal.IdTCPClient1Disconnected(Sender: TObject);
begin
  SetCaptionAndAppTitle('HChat');
  lblConectadoServidor.Caption:= 'Desconectado do Servidor!';
  btnConecta.Caption := '&Conectar'
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
     key:= #0;
     if btnConecta.Enabled then
        btnConecta.Click;
  end;
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
  with Memo1.SelAttributes do
  begin
    Color := ColorGrid1.ForegroundColor; // Cor da Fonte
  end;
  IdTCPClient1.WriteLn(FormatChatMessage(memoEdtMsg.Text,lbEdtNick.Text,cmbUsuario.Text,cboxReservado.Checked));
  memoEdtMsg.Text := '';
  memoEdtMsg.SetFocus;
  memoEdtMsg.SelectAll;
end;

procedure TfrmPrincipal.ShowReceiveMsg;
begin
  Memo1.lines.add(ReceiveMsg(cmd.text));
end;

procedure TfrmPrincipal.lbEdtNickChange(Sender: TObject);
begin
  btnConecta.Enabled :=
    (trim(lbEdtServidor.Text) <> '') and
    (trim(lbEdtPorta.Text) <> '') and
    (trim(lbEdtNick.Text) <> '');
end;

procedure TfrmPrincipal.cmbUsuarioSelect(Sender: TObject);
begin
  memoEdtMsg.Font.Color := ColorGrid1.ForegroundColor;
  btnEnviar.Enabled := (cmbUsuario.ItemIndex <> -1) and (trim(memoEdtMsg.Text) <> '');
end;

{ TClientThread }

constructor TClientThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  Priority := tpIdle;
  FreeOnTerminate:= true;
end;

procedure TClientThread.Execute;
begin
  inherited;
  with frmPrincipal do
  begin
    if not IdTCPClient1.Connected then
       exit;
    repeat
      cmd.text:= IdTCPClient1.ReadLn;
      if trim(cmd.text) <> '' then
      begin
        if VerificaComando(cmd.text,'msg=',true) then
           Synchronize(ShowReceiveMsg)
        else if VerificaComando(cmd.text,'list_user=',true) then
           Synchronize(ListUsers)
        else if VerificaComando(cmd.text,'nick_existente=',true) then
           Synchronize(NickExistente)
        else if VerificaComando(cmd.text,'server_error=',true) then
           Synchronize(ShowServerError)
        else Synchronize(UnknowCmd);
      end;
    until not IdTCPClient1.Connected;
  end;
  {if not Terminated then
     Terminate;}
end;

procedure TfrmPrincipal.ListUsers;
begin
  cmbUsuario.Items.Text := cmd.Values['list_user'];
  cmbUsuario.Items.Text:= AnsiReplaceText(cmbUsuario.Items.Text,';',#13);
  if cmbUsuario.Items.Count > 0 then
  begin
     //deleta o nome do próprio usuário da lista para que ele não mande msg para ele mesmo
     cmbUsuario.Items.Delete(cmbUsuario.Items.IndexOf(lbEdtNick.Text));
     cmbUsuario.ItemIndex := 0;
  end;
end;

procedure TfrmPrincipal.UnknowCmd;
begin
  Memo1.Lines.add(cmd.text)
end;

procedure TfrmPrincipal.NickExistente;
var msg: String;
begin
  msg:= copy(cmd.text,16,length(cmd.text));
  Application.messageBox(pchar(msg),'Informação',mb_iconInformation);
  IdTCPClient1.Disconnect;
end;

procedure TfrmPrincipal.ShowServerError;
var msg: String;
begin
  msg:= copy(cmd.text,14,length(cmd.text));
  Memo1.lines.Add('Erro no Servidor: ' + msg);
end;

procedure TfrmPrincipal.SetCaptionAndAppTitle(Text: String);
begin
  Caption:= Text;
  Application.Title := Caption;
end;


procedure TfrmPrincipal.memoEdtMsgKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '#' then
     abort;
end;

procedure TfrmPrincipal.Label4Click(Sender: TObject);
var
  sl: TStringList;
begin
  if Memo1.Lines[0] = '' then
  begin
    ShowMessage('Não existe Conversa Para Gravar!');
  end
  else
  begin
    sl := TStringList.Create;

    sl.Add(Memo1.Lines.Text);

    savedialog1.filename := 'HChat '+DateToStr(date)+'.txt';
    if savedialog1.execute then
      sl.SavetoFile(savedialog1.filename);
    sl.Free;
  end;
end;

procedure TfrmPrincipal.ColorGrid1Click(Sender: TObject);
begin
  ColorGrid1.Visible:= false;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  ColorGrid1.Visible := true;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    application.icon.loadfromfile('C:\handel\Imagens\hchat.ico');
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
    if dm.verificaBD then
      begin
        try
          IdTCPClient1.Host := dm.scHC.Host;
          IdTCPClient1Disconnected(IdTCPClient1);
        except

        end;
        frmAutenticacao := TfrmAutenticacao.create(Application);
        frmAutenticacao.showmodal;
      end else
      begin
        frmConfBD := TfrmConfBD.Create(Application);
        frmConfBD.ShowModal;
        frmConfBD.Free;
      end;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
    IdTCPClient1.Disconnect;
    Application.Terminate;
end;

end.
