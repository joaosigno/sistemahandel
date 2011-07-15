unit untDM;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect, UCDataConnector,
  UCMidasConn,inifiles;

type
  Tdm = class(TDataModule)
    scHC: TSocketConnection;
    cdsAux: TClientDataSet;
    cdsUsu: TClientDataSet;
    cdsUsuuciduser: TIntegerField;
    cdsUsuucusername: TStringField;
    cdsUsuuclogin: TStringField;
    cdsUsuucpassword: TStringField;
    cdsUsuucpassexpired: TStringField;
    cdsUsuucuserexpired: TIntegerField;
    cdsUsuucuserdayssun: TIntegerField;
    cdsUsuucemail: TStringField;
    cdsUsuucprivileged: TIntegerField;
    cdsUsuuctyperec: TStringField;
    cdsUsuucprofile: TIntegerField;
    cdsUsuuckey: TStringField;
    cdsUsuucinative: TIntegerField;
    cdsUsucdempresa: TIntegerField;
    cdsUsucdfuncionario: TIntegerField;
    cdsUsutodasEmpresas: TStringField;
  private
    { Private declarations }
  public
    procedure executaSql(cds:TClientDataSet;sql:String);
    function Autenticacao(cdemp:integer;login:String;senha:string): boolean;
    function verificaBD():Boolean;
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses untDeclaracoes, untPrincipal, untAutenticacao, untConfBD;

{$R *.dfm}

procedure Tdm.executaSql(cds:TClientDataSet;sql:String);
{
  executa um sql
}
var f:TFuncoes;
begin
    try
      cds.Close;
      cds.CommandText := sql;
      cds.Open;
    except
      
    end;
end;

function Tdm.Autenticacao(cdemp:integer;login:String;senha:string): boolean;
{
  essa function verifica se a senha do usuario esta correta,
  se o usuario é o administrador, se o usuario possui acesso
  a todas as empresas, ou se o usuario realmente pertence
  aquela emrpesa a qual ele digitou.
}
var f:TFuncoes;
begin
  dm.executaSql(cdsUsu,'select * from uctabusers where uclogin='+QuotedStr(login));

  if frmPrincipal.UserControl1.VerificaLogin(LOGIN,SENHA) = 0 then
  begin
     if cdsUsuuciduser.AsInteger = 1 then
     begin
        result:= true;
     end

     else if cdsUsutodasEmpresas.AsString = 'S' then
     begin
        result:=true
     end

     else if cdsUsucdempresa.AsInteger = cdemp then
     begin
        result:= true
     end
     else result:= false;
  end else
  begin
       result:=false;
  end;
end;


function Tdm.verificaBD: Boolean;
var inifile: Tinifile;
begin
 { try
      inifile := Tinifile.create('C:\handel\config.ini');
      dm.scHC.Connected := false;
      dm.scHC.Host := '';
      dm.scHC.Host := inifile.readstring('BD','server','');
      dm.scHC.Connected := true;
      inifile.free;

      if scHC.Connected = true then
      Result:= true
     else Result:= false;
  Except

  end;}
end;

end.
