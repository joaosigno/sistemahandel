unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Grids, DBGrids, RxGIF, ExtCtrls,
  RXShell, AppEvnts, DB, DBClient, MConnect, SConnect, ComCtrls,
  IdThreadMgr, IdThreadMgrDefault, IdAntiFreezeBase, IdAntiFreeze,
  IdBaseComponent, IdComponent, IdTCPServer, StrUtils, ShellApi, Contnrs,
  jpeg;

type
  PConexao = ^TConexao;
  TConexao = record
    IP: ShortString;
    ThreadID: Cardinal;
    Connection: TidTCPServerConnection;
    Usuario: ShortString;
  end;

  TfrmPrincipal = class(TForm)
    HSPopup: TPopupMenu;
    tiHS: TRxTrayIcon;
    Abrir1: TMenuItem;
    Fechar1: TMenuItem;
    pgHServer: TPageControl;
    tbInicio: TTabSheet;
    pnlHS: TPanel;
    btnFechar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    lbldataini: TLabel;
    lblhoraini: TLabel;
    lbldata: TLabel;
    lblhora: TLabel;
    tbChatServer: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbUsuario: TComboBox;
    btnEnviar: TBitBtn;
    btnDerrubar: TBitBtn;
    mmoIPs: TMemo;
    Label4: TLabel;
    IdTCPServer1: TIdTCPServer;
    IdAntiFreeze1: TIdAntiFreeze;
    IdThreadMgrDefault1: TIdThreadMgrDefault;
    lblTotalCOnexoes: TLabel;
    memoMsg: TEdit;
    Label5: TLabel;
    SaveDialog1: TSaveDialog;
    Memo1: TRichEdit;
    Image1: TImage;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure mostrarDataHora();
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure IdTCPServer1Disconnect(AThread: TIdPeerThread);
    procedure btnDerrubarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure memoMsgChange(Sender: TObject);
    procedure cmbUsuarioChange(Sender: TObject);
    procedure memoMsgKeyPress(Sender: TObject; var Key: Char);
    procedure Label5Click(Sender: TObject);
  private
    cmd: TStrings;
    xUniqueUser: Boolean;
    procedure ShowConnections;
    procedure ListUsers;
    procedure ListIPs;
    procedure SendMsg;
    procedure UsuarioEntrou;
    procedure SendMsgToAll(msg: String);
    function UniqueUser(User: ShortString): Boolean;
    function IndexOfUserConnection(User: ShortString): Integer;
    { Private declarations }
  public
      { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  H : THandle;
  conn: TList;
 
implementation

uses untRDM, untAcessos, Chat_Tools, Client_Tools;

{$R *.dfm}

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  Application.Minimize;
  hide;
end;

procedure TfrmPrincipal.Fechar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.Abrir1Click(Sender: TObject);
begin
    show;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if CanClose then
    CanClose := false;
    h := FindWindow(nil,'TrayIcon');
    ShowWindow(h,SW_HIDE);
    tiHS.Active := true;
    hide;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  application.icon.loadfromfile('C:\handel\Imagens\hserver.ico');
  mostrarDataHora;
  IdTCPServer1.Active := true;
  cmd:= TStringList.Create;
  conn:= TList.Create;
end;

procedure TfrmPrincipal.mostrarDataHora;
begin
  lbldataini.Visible := true;
  lblhoraini.Visible := true;
  lbldata.Visible := true;
  lblhora.Visible := true;
  lbldata.Caption := DateToSTR(date);
  lblhora.Caption := TimeToSTR(time);
end;

procedure TfrmPrincipal.ListIPs;
var
  i: integer;
  aux: String;
  ConAux: PConexao;
begin
  aux:= '';
  for i:= 0 to conn.Count -1 do
  begin
     //GetMem(ConAux, SizeOf(TConexao));
     try
       ConAux:= PConexao(conn[i]);
       aux:= aux + 'Usuário: ' + ConAux.Usuario + ' - IP: ' + ConAux.IP + #13;
     finally
       //FreeMem(ConAux);
     end;
  end;

  mmoIPs.Lines.Text := trim(aux);
end;

procedure TfrmPrincipal.ListUsers;
var
  i: integer;
  aux: String;
  ConAux: PConexao;
begin
  aux:= '';
  for i:= 0 to conn.Count -1 do
  begin
     //GetMem(ConAux, SizeOf(TConexao));
     try
       ConAux:= PConexao(conn[i]);
       aux:= aux + ConAux.Usuario + ';';
     finally
       //FreeMem(ConAux);
     end;
  end;
  if aux <> '' then
     delete(aux,length(aux),1);

  cmbUsuario.Items.clear;
  cmbUsuario.Items.text:= AnsiReplaceText(aux,';',#13);
  if cmbUsuario.Items.Count > 2 then
     aux:= 'Todos;' + aux
  else if cmbUsuario.Items.Count <> 2 then
     aux:= '';


  if cmbUsuario.Items.Count > 1 then
     cmbUsuario.items.Insert(0,'Todos');
  if cmbUsuario.Items.Count > 0 then
     cmbUsuario.ItemIndex := 0;

  cmbUsuarioChange(cmbUsuario);
  SendMsgToAll('list_user=' + aux);
  ListIPs;
end;

procedure TfrmPrincipal.SendMsg;
var
  i: integer;
  ConAux: PConexao;
  remetente, dest: ShortString;
begin
  //exemplo de comando de envio de msg: msg=manoel#todos#e aí galera

  //enviar msg pra todos da sala
  if not Chat_Tools.VerificaComando(cmd.text,'#reservado',true) then
     SendMsgToAll(cmd.Text)
  else
  begin
    //se a msg for reservada, então envia a msg pro usuário de destino
    dest:= DestinatarioMsg(cmd.text);
    remetente:= RemetenteMsg(cmd.text);
    for i:= 0 to conn.Count -1 do
    begin
       ConAux:= PConexao(conn[i]);
       if (ConAux.Usuario = dest) or (ConAux.Usuario = remetente) then
          ConAux.Connection.WriteLn(cmd.Text);
       //FreeMem(ConAux);
    end;
  end;
end;

procedure TfrmPrincipal.SendMsgToAll(msg: String);
var
  i: integer;
  ConAux: PConexao;
begin
    if trim(msg) = '' then
       exit;

    for i:= 0 to conn.Count -1 do
    begin
       //GetMem(ConAux, SizeOf(TConexao));
       try
         ConAux:= PConexao(conn[i]);
         ConAux.Connection.WriteLn(msg);
       finally
         //FreeMem(ConAux);
       end;
    end;
end;

procedure TfrmPrincipal.ShowConnections;
begin
   lblTotalCOnexoes.Caption := format('Total de Conexões: %d',[conn.count]);
end;

procedure TfrmPrincipal.UsuarioEntrou;
var msg: string;
begin
   msg:= '# ' + cmd.values['nick'] + ' entrou na sala';
   Memo1.lines.add(msg);
   SendMsgToAll(msg);
   ListUsers;
end;

procedure TfrmPrincipal.IdTCPServer1Connect(AThread: TIdPeerThread);
var ConAux: PConexao;
begin
 cmd.text:= AThread.Connection.ReadLn;
 if AnsiSameText(Admin,cmd.Values['nick']) then
    AThread.Connection.Writeln('nick_existente=O nick utilizado é um nick reservado ao administrador do sistema. Utilize outro nick.')
 else
 begin
   xUniqueUser := UniqueUser(cmd.Values['nick']);
   if xUniqueUser then
   begin
     AThread.Connection.Writeln('Bem vindo ao servidor de chat'#10);
     GetMem(ConAux,SizeOf(TConexao));
     try
       ConAux.ThreadID := AThread.ThreadID;
       ConAux.Connection:= AThread.Connection;
       ConAux.IP := AThread.Connection.Socket.Binding.PeerIP;
       ConAux.Usuario := cmd.Values['nick'];

       AThread.Data := TObject(ConAux);
       conn.Add(ConAux);
       UsuarioEntrou;
     finally
       //FreeMem(ConAux);
       ShowConnections;
     end;
   end
   else AThread.Connection.Writeln('nick_existente=Já há uma pessoa com o Nick escolhido na sala de chat');
 end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tag:= conn.Count;
  if tag > 0 then
  begin
    action:= caNone;
    Application.MessageBox('# Você não pode fechar o servidor pois existem clientes conectados','Informação',mb_iconInformation)
  end
  else
  begin
    cmd.Free;
    Conn.Free;

    IdTCPServer1.Active := false;
  end;
end;

procedure TfrmPrincipal.IdTCPServer1Execute(AThread: TIdPeerThread);
begin
  try
    cmd.Text:= AThread.Connection.ReadLn;
    if VerificaComando(cmd.text,'msg=',true) then
    begin
       SendMsg;
       Memo1.lines.add(ReceiveMsg(cmd.text));
    end;
  except
    on e: Exception do
    begin
      AThread.Connection.WriteLn('server_error='+e.message);
    end;
  end;
end;

procedure TfrmPrincipal.IdTCPServer1Disconnect(AThread: TIdPeerThread);
var
  ConAux: PConexao;
  aux: string;
begin
  if xUniqueUser then
  begin
    ConAux:= PConexao(AThread.Data);
    try
      conn.Remove(ConAux);
      aux:= '# ' + ConAux.Usuario + ' saiu da sala.';
      Memo1.lines.add(aux);
      SendMsgToAll(aux);
      AThread.Data := nil;
    finally
      FreeMem(ConAux);
    end;
    ListUsers;
    ShowConnections;
  end
  else xUniqueUser:= true;
end;

function TfrmPrincipal.IndexOfUserConnection(User: ShortString): Integer;
var i: integer;
begin
  result:= -1;
  for i:= 0 to conn.Count -1 do
  begin
    if PConexao(conn[i]).Usuario = User then
    begin
      result:= i;
      break;
    end;
  end;
end;

function TfrmPrincipal.UniqueUser(User: ShortString): Boolean;
var i: integer;
begin
  result:= true;
  for i:= 0 to conn.Count -1 do
  begin
     if PConexao(Conn[i]).Usuario = User then
     begin
       result:= false;
       break;
     end;
  end;
end;

procedure TfrmPrincipal.btnDerrubarClick(Sender: TObject);
begin
  tag:= IndexOfUserConnection(cmbUsuario.Text);
  if tag <> -1 then
  begin
     PConexao(conn[tag]).Connection.WriteLn(
        FormatChatMessage('# Você será desconectado da sala pelo administrador do sistema','Administrador',cmbUsuario.Text,true));
     PConexao(conn[tag]).Connection.Disconnect;
  end
  else  Application.MessageBox('# Usuário não localizado','Informação',mb_IconInformation);
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
var msg: string;
begin
  msg:= FormatChatMessage(Memo1.Text,Admin,cmbUsuario.Text, not AnsiSameText(cmbUsuario.Text,'todos'));
  if AnsiSameText('todos',cmbUsuario.Text) then
     SendMsgToAll(msg)
  else
  begin
    tag:= IndexOfUserConnection(cmbUsuario.Text);
    if tag <> -1 then
       PConexao(conn[tag]).Connection.WriteLn(msg)
    else  Application.MessageBox('# Usuário não localizado','Informação',mb_IconInformation);
  end;
  memoMsg.Text := '';
  memoMsg.SetFocus;
  memoMsg.SelectAll;
end;

procedure TfrmPrincipal.memoMsgChange(Sender: TObject);
begin
  btnEnviar.Enabled := (trim(memoMsg.Text) <> '') and (cmbUsuario.ItemIndex <> -1);
end;

procedure TfrmPrincipal.cmbUsuarioChange(Sender: TObject);
begin
  memoMsgChange(memoMsg);
  btnDerrubar.Enabled:= (cmbUsuario.ItemIndex <> -1) and (not AnsiSameText('todos',cmbUsuario.Text));
end;

function VerificaComando(Recebido, Comando: String; Parcial: boolean): Boolean;
begin
  recebido:= AnsiLowerCase(trim(recebido));
  comando:= AnsiLowerCase(trim(comando));
  if not Parcial then
     result:= AnsiSameText(recebido, comando)
  else result:= pos(comando, recebido) <> 0;
end;

function ReceiveMsg(Received: String): String;
var
  i: integer;
  de, para, aux: ShortString;
  msg: String;
begin
  i:= pos('=',Received);
  aux:= copy(Received,i+1,length(Received));

  i:= pos('#',aux);
  de:= copy(aux,1,i-1);
  delete(aux,1,i);

  i:= pos('#',aux);
  para:= copy(aux,1,i-1);
  delete(aux,1,i);
  msg:= aux;

  i:= pos('#',msg);
  if i = 0 then
     result:= '# ' + de + ' fala com ' + para + ': ' + msg
  else
  begin
    delete(msg,i,length(msg));
    result:= '# ' + de + ' fala reservadamente com ' + para + ': ' + msg
  end;
end;

function RemetenteMsg(Received: String): ShortString;
var
  i: integer;
begin
  i:= pos('=',Received);
  received:= copy(Received,i+1,length(Received));

  i:= pos('#',received);
  result:= copy(received,1,i-1);
end;

function DestinatarioMsg(Received: String): ShortString;
var
  i: integer;
begin
  i:= pos('=',Received);
  Received:= copy(Received,i+1,length(Received));

  i:= pos('#',Received);
  delete(Received,1,i);

  i:= pos('#',Received);
  result:= copy(Received,1,i-1);
end;

function FormatChatMessage(Msg, UsuarioOrigem, UsuarioDestino: String; Reservado: Boolean = false): String;
begin
  result:= 'msg=' + UsuarioOrigem + '#' + UsuarioDestino + '#' + msg;
  if Reservado then
     result:= result + '#reservado';
end;

procedure TfrmPrincipal.memoMsgKeyPress(Sender: TObject; var Key: Char);
begin
    if key = '#' then
     abort;
end;

procedure TfrmPrincipal.Label5Click(Sender: TObject);
var
  sl: TStringList;
begin
  if Memo1.Lines.Text = '' then
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

end.
