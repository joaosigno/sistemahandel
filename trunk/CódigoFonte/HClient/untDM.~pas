unit untDM;

interface

uses
  SysUtils, Classes, ZConnection, ZSqlUpdate, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DBXpress, SqlExpr, FMTBcd, Provider, DBClient,
  MConnect, SConnect, UCDataConnector, UCMidasConn, UCBase, inifiles, Forms,
  untDeclaracoes;

type

  Tdm = class(TDataModule)
    cdsUsu: TClientDataSet;
    scHC: TSocketConnection;
    cdsAux: TClientDataSet;
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
    cdsFor: TClientDataSet;
    cdsEmp: TClientDataSet;
    cdsGRPro: TClientDataSet;
    cdsProfi: TClientDataSet;
    cdsGRProcdgrup: TIntegerField;
    cdsGRProcdempr: TIntegerField;
    cdsGRProdescri: TStringField;
    cdsGRProacdesc: TStringField;
    cdsGRProvldesc: TFloatField;
    cdsForcdforn: TIntegerField;
    cdsForcdbanco: TIntegerField;
    cdsFordtcada: TDateField;
    cdsForpesfis: TStringField;
    cdsFornmfant: TStringField;
    cdsForrzsoci: TStringField;
    cdsForinsest: TStringField;
    cdsForcgc: TStringField;
    cdsForendere: TStringField;
    cdsForbairro: TStringField;
    cdsForcidade: TStringField;
    cdsFornumero: TStringField;
    cdsForuf: TStringField;
    cdsFortelefo: TStringField;
    cdsForfax: TStringField;
    cdsFordtfund: TDateField;
    cdsForrmativ: TStringField;
    cdsForagenci: TStringField;
    cdsForconta: TStringField;
    cdsForemail: TStringField;
    cdsForhomepa: TStringField;
    cdsForobserv: TStringField;
    cdsForrepre1: TStringField;
    cdsForrpcon1: TStringField;
    cdsForrptel1: TStringField;
    cdsForrpfax1: TStringField;
    cdsForrpema1: TStringField;
    cdsForrepre2: TStringField;
    cdsForrpcon2: TStringField;
    cdsForrptel2: TStringField;
    cdsForrpfax2: TStringField;
    cdsForrpema2: TStringField;
    cdsForrepre3: TStringField;
    cdsForrpcon3: TStringField;
    cdsForrptel3: TStringField;
    cdsForrpfax3: TStringField;
    cdsForrpema3: TStringField;
    cdsEmpcdempr: TIntegerField;
    cdsEmpnmfant: TStringField;
    cdsEmprzsoci: TStringField;
    cdsEmpcgc: TStringField;
    cdsEmpinsest: TStringField;
    cdsEmpendere: TStringField;
    cdsEmpcomple: TStringField;
    cdsEmpnumero: TStringField;
    cdsEmpbairro: TStringField;
    cdsEmpcidade: TStringField;
    cdsEmpuf: TStringField;
    cdsEmprespon: TStringField;
    cdsEmptelefo: TStringField;
    cdsEmpfax: TStringField;
    cdsEmpemail: TStringField;
    cdsEmptpempr: TStringField;
    cdsProficdprof: TIntegerField;
    cdsProficdempr: TIntegerField;
    cdsProfidescri: TStringField;
    cdsForcdempr: TIntegerField;
    cdsForprocurabanco: TStringField;
    cdsFunc: TClientDataSet;
    cdsFunccdfunc: TIntegerField;
    cdsFunccdempr: TIntegerField;
    cdsFunccdprof: TIntegerField;
    cdsFuncnome: TStringField;
    cdsFuncsexo: TStringField;
    cdsFuncrg: TStringField;
    cdsFunccpf: TStringField;
    cdsFuncendere: TStringField;
    cdsFuncbairro: TStringField;
    cdsFuncnumero: TStringField;
    cdsFunccidade: TStringField;
    cdsFuncuf: TStringField;
    cdsFunctelefo: TStringField;
    cdsFuncdtnasc: TDateField;
    cdsFuncemail: TStringField;
    cdsFuncdtadmi: TDateField;
    cdsFuncdtsaid: TDateField;
    cdsFuncchorar: TIntegerField;
    cdsFuncsalari: TFloatField;
    cdsFunccomisa: TFloatField;
    cdsFuncprferi: TDateField;
    cdsFuncobserv: TStringField;
    cdsFuncdtcada: TDateField;
    cdsFuncprocuraProfissao: TStringField;
    cdsFunccartpr: TStringField;
    UCCon: TUCMidasConn;
    cdsDepa: TClientDataSet;
    cdsDepacddepa: TIntegerField;
    cdsDepacdempr: TIntegerField;
    cdsDepadescri: TStringField;
    cdsFunccddepa: TIntegerField;
    cdsFuncprocuraDepartamento: TStringField;
    cdsFuncativo: TStringField;
    cdsCli: TClientDataSet;
    cdsGRCli: TClientDataSet;
    cdsGRClicdgrup: TIntegerField;
    cdsGRClidescri: TStringField;
    cdsClicdclie: TIntegerField;
    cdsClicdbanc: TIntegerField;
    cdsClicdgrup: TIntegerField;
    cdsClipesjur: TStringField;
    cdsCliativo: TStringField;
    cdsClinome: TStringField;
    cdsClisexo: TStringField;
    cdsClidtnasc: TDateField;
    cdsClicldesd: TDateField;
    cdsClidtcada: TDateField;
    cdsClinatura: TStringField;
    cdsClirg: TStringField;
    cdsClicpf: TStringField;
    cdsCliendere: TStringField;
    cdsClinumero: TStringField;
    cdsClicidade: TStringField;
    cdsClibairro: TStringField;
    cdsCliuf: TStringField;
    cdsClitelefo: TStringField;
    cdsClicelula: TStringField;
    cdsClifax: TStringField;
    cdsClinmpai: TStringField;
    cdsClinmmae: TStringField;
    cdsCliemptra: TStringField;
    cdsCliempcar: TStringField;
    cdsClicdprof: TIntegerField;
    cdsCliemptel: TStringField;
    cdsCliempend: TStringField;
    cdsCliempbai: TStringField;
    cdsCliempcid: TStringField;
    cdsCliempuf: TStringField;
    cdsClirfcom1: TStringField;
    cdsClirfcom2: TStringField;
    cdsClirfcom3: TStringField;
    cdsClirfpes1: TStringField;
    cdsClirfpes2: TStringField;
    cdsClirfpes3: TStringField;
    cdsCliemail: TStringField;
    cdsClihomepa: TStringField;
    cdsCliobserv: TStringField;
    cdsClicdempr: TIntegerField;
    cdsGRClicdempr: TIntegerField;
    cdsCliprocuraProfissao: TStringField;
    cdsCliprocuraGrupo: TStringField;
    cdsCliprocuraBanco: TStringField;
    cdsBanc: TClientDataSet;
    cdsBanccdban: TIntegerField;
    cdsBancdescri: TStringField;
    cdsBancdtcada: TDateField;
    cdsEmpcdbanc: TIntegerField;
    cdsEmpconta: TStringField;
    cdsEmpdtcada: TDateField;
    cdsEmpprocuraBanco: TStringField;
    cdsEmpagenci: TStringField;
    cdsProfidtcada: TDateField;
    cdsGRProdtcada: TDateField;
    cdsFunccdbanc: TIntegerField;
    cdsFuncconta: TStringField;
    cdsFuncagenci: TStringField;
    cdsFuncprocuraBanco: TStringField;
    cdsDepadtcada: TDateField;
    cdsGRClidtcada: TDateField;
    cdsCliconta: TStringField;
    cdsCliagenci: TStringField;
    cdsCliestciv: TStringField;
    cdsCliconjug: TStringField;
    cdsClicjtele: TStringField;
    cdsClicep: TStringField;
    cdsCliempcep: TStringField;
    cdsEmpcep: TStringField;
    cdsFunccep: TStringField;
    cdsForcep: TStringField;
    cdsClilimite: TFloatField;
    cdsAutori: TClientDataSet;
    cdsAutorinome: TStringField;
    cdsAutoridocume: TStringField;
    cdsAutoricompra: TStringField;
    cdsAutoridtnasc: TDateField;
    cdsAutoritelefo: TStringField;
    cdsAutoricdclien: TIntegerField;
    cdsAutoridepend: TStringField;
    cdsAutoridtcada: TDateField;
    cdsAutoricdempr: TIntegerField;
    cdsDepen: TClientDataSet;
    cdsDepennome: TStringField;
    cdsDependocume: TStringField;
    cdsDepencompra: TStringField;
    cdsDependtnasc: TDateField;
    cdsDepentelefo: TStringField;
    cdsDepencdclien: TIntegerField;
    cdsDependepend: TStringField;
    cdsDependtcada: TDateField;
    cdsDepencdempr: TIntegerField;
    cdsCartFid: TClientDataSet;
    cdsCartFiddtcada: TDateField;
    cdsCartFidnmcart: TStringField;
    cdsCartFidativo: TStringField;
    cdsCartFidemail: TStringField;
    cdsCartFidnrcart: TIntegerField;
    cdsClicdcrfi: TIntegerField;
    cdsCliprocuraCartaoFidelidade: TStringField;
    function verificaBD():Boolean;
    function Autenticacao(cdemp:integer;login:String;senha:string): boolean;
  private
    F: TFuncoes;
    { Private declarations }
  public
    procedure executaSql(cds:TClientDataSet;sql:String);
    procedure executaSqlPorEmpresa(cds:TClientDataSet;campos:String;Tabela:String;sqlComplementar:string);
    { Public declarations }
  end;

var
  dm: Tdm;
  
implementation

uses untPrincipal, untInicial, untConfBD;

{$R *.dfm}

procedure Tdm.executaSqlPorEmpresa(cds:TClientDataSet;campos:String;Tabela:String;sqlComplementar:string);
{
  Sql geral, caso a empresa funcione como matriz e filiais(cdemp<>0),
  ou separadamente(cdemp=), so mexer aqui
}
var
    f : TFuncoes;
begin
    try
      cds.Close;
      cds.CommandText := 'select '+campos+' from '+tabela+' where cdempr='+
            IntToStr(frmPrincipal.Configuracao.EmpresaCodigo)+' '+sqlComplementar;
      cds.Open;
    except
      on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
    end;
end;

function Tdm.verificaBD():Boolean;
{
 verifica conexao com o banco de dados
}
var inifile: Tinifile;
begin
  try
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

  end; 
end;

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
      on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
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
  
  if frmPrincipal.userControl.VerificaLogin(login,senha) = 0 then
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

end.



