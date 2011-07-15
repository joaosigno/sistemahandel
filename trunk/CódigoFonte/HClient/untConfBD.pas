{Pedro L Saraiva}
unit untConfBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, ExtCtrls, inifiles;

type
  TfrmConfBD = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label3: TLabel;
    edtservidor: TEdit;
    opConfigBD: TOpenDialog;
    btconectar: TBitBtn;
    btcancelar: TBitBtn;
    Label1: TLabel;
    lblmsg: TLabel;
    procedure btconectarClick(Sender: TObject);
    procedure cmbedtpathbancoButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rblocalClick(Sender: TObject);
    procedure btcancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfBD: TfrmConfBD;

implementation

uses untDM, untDeclaracoes;

{$R *.dfm}

procedure TfrmConfBD.btconectarClick(Sender: TObject);
var
  inifile: Tinifile;
  bd: integer;
  f: tFuncoes;
begin
  lblmsg.Caption := 'Aguarde! Tentando conectar...';
  Application.ProcessMessages;
  bd := 1;
  //inifile := Tinifile.create(extractfilepath(application.exename) + 'config.ini');
  inifile := Tinifile.create('C:\handel\config.ini');
  inifile.WriteString('BD','server',edtservidor.text);
  //inifile.WriteString('BDClient','path',cmbedtpathbanco.Text);
    inifile.WriteBool('BD','local',true);
    //inifile.WriteString('BD','server','localhost');
//p  dm.con.Params.Delete(1);
    dm.scHC.Host := inifile.ReadString('BD','server',edtservidor.Text);
//p  dm.con.Params.insert(1,'Database=' + inifile.readstring('BD','server','') + ':' + inifile.readstring('BD','path',''));

  //ShowMessage('Database=' + inifile.readstring('BD','server','') + ':' + inifile.readstring('BD','path',''));

  inifile.Free;
  try
    dm.scHC.Connected := true;
  //    dm.con.Connected := true;
    close;
  except
    lblmsg.Caption := 'Não foi possível conectar!';
    Application.ProcessMessages;
{
  if MessageDlg('Não foi possível conectar com o banco de dados. Verifique o caminho do banco. O banco usado no ' +
                  frmprincipal.Configuracao.NomeSoftware + ' é o Firebird. Se esse for o servidor' +
                  ' talvez o Firebird não esteja instalado. Deseja instalá-lo agora?', mtConfirmation, mbyesno, 0) = mryes then
   begin
      if fileexists(ExtractFilePath(Application.ExeName) + 'Firebird-2.0.3.12981-1-Win32.exe') then
        WinExec(PAnsiChar(ExtractFilePath(Application.ExeName) + 'Firebird-2.0.3.12981-1-Win32.exe'), SW_SHOW)
      else MessageDlg('O arquivo de instalação do Firebird não foi encontrado!', mtError, [mbOK], 0);
    end;
}
  end;

end;

procedure TfrmConfBD.cmbedtpathbancoButtonClick(Sender: TObject);
begin
  opConfigBD.InitialDir := extractfilepath(Application.ExeName);
  opConfigBD.Execute;
end;

procedure TfrmConfBD.FormCreate(Sender: TObject);
var
  inifile: Tinifile;
begin
  inifile := Tinifile.create('C:\handel\config.ini');
  edtservidor.Text := inifile.ReadString('BD','server','');
 // cmbedtpathbanco.Text := inifile.ReadString('BD','path','');
  inifile.Free;
end;

procedure TfrmConfBD.rblocalClick(Sender: TObject);
begin
  edtservidor.enabled := false;
end;

procedure TfrmConfBD.btcancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
