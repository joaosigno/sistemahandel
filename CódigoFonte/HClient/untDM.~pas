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
    cdsAutoridtcada: TDateField;
    cdsAutoricdempr: TIntegerField;
    cdsDepen: TClientDataSet;
    cdsDepennome: TStringField;
    cdsDependocume: TStringField;
    cdsDepencompra: TStringField;
    cdsDependtnasc: TDateField;
    cdsDepentelefo: TStringField;
    cdsDepencdclien: TIntegerField;
    cdsDependtcada: TDateField;
    cdsDepencdempr: TIntegerField;
    cdsCartFid: TClientDataSet;
    cdsCartFiddtcada: TDateField;
    cdsCartFidativo: TStringField;
    cdsCartFidemail: TStringField;
    cdsDepentipo: TStringField;
    cdsAutoritipo: TStringField;
    cdsCheque: TClientDataSet;
    cdsChequecodBan: TIntegerField;
    cdsChequecodAge: TIntegerField;
    cdsChequenumChq: TIntegerField;
    cdsChequenumCCo: TStringField;
    cdsChequenumC3: TIntegerField;
    cdsChequeemtChq: TStringField;
    cdsChequevalor: TFloatField;
    cdsChequedtVenc: TDateField;
    cdsChequeobs: TStringField;
    cdsChequestatus: TStringField;
    cdsChequerecebi: TStringField;
    cdsChequedtcada: TDateField;
    cdsChequecdempr: TIntegerField;
    cdsChequecmc7: TStringField;
    cdsChequecdchq: TIntegerField;
    cdsChequecodcli: TIntegerField;
    cdsChequeprocuraCLiente: TStringField;
    cdsCartFidcdempr: TIntegerField;
    cdsVende: TClientDataSet;
    cdsVendecdvend: TIntegerField;
    cdsVendecdempr: TIntegerField;
    cdsVendecdfunc: TIntegerField;
    cdsVendedtcada: TDateField;
    cdsVendenome: TStringField;
    cdsVendereccom: TStringField;
    cdsVendecomiss: TFloatField;
    cdsVendevenvis: TStringField;
    cdsVendevenpra: TStringField;
    cdsVendevencar: TStringField;
    cdsVendevenche: TStringField;
    cdsVendeprocuraFuncionario: TStringField;
    cdsMcPro: TClientDataSet;
    cdsMcProcdmarc: TIntegerField;
    cdsMcProcdempr: TIntegerField;
    cdsMcProdtcada: TDateField;
    cdsMcProdescri: TStringField;
    cdsCartFidnmcart: TStringField;
    cdsCartFidnrcart: TStringField;
    cdsClicdcrfi: TStringField;
    cdsCliprocuraCartaoFidelidade: TStringField;
    cdsUsucdempr: TIntegerField;
    cdsUsucdfunc: TIntegerField;
    cdsUsuprocuraEmpresa: TStringField;
    cdsUsuprocuraFuncioanrio: TStringField;
    cdsProd: TClientDataSet;
    cdsProdcdprod: TIntegerField;
    cdsProdcdempr: TIntegerField;
    cdsProdtipopr: TStringField;
    cdsProddtcada: TDateField;
    cdsProdativo: TStringField;
    cdsProddescri: TStringField;
    cdsProdcdmarc: TIntegerField;
    cdsProdcdgrup: TIntegerField;
    cdsProdtipcon: TStringField;
    cdsProdunidad: TStringField;
    cdsProdestatu: TFloatField;
    cdsProdcodfab: TStringField;
    cdsProdrefere: TStringField;
    cdsProdpreven: TFloatField;
    cdsProdestmin: TFloatField;
    cdsProdcusrea: TFloatField;
    cdsProdpesliq: TFloatField;
    cdsProdpesbru: TFloatField;
    cdsProdcodncm: TStringField;
    cdsProdprzgar: TStringField;
    cdsProdmarluc: TFloatField;
    cdsProdcusmed: TFloatField;
    cdsProdultcom: TDateField;
    cdsProdultven: TDateField;
    cdsProdclaori: TStringField;
    cdsProdsittri: TStringField;
    cdsProdicms: TFloatField;
    cdsProdipi: TFloatField;
    cdsProdclfisc: TStringField;
    cdsProdobserv: TStringField;
    cdsProdprocuraMarca: TStringField;
    cdsProdprocuraGrupo: TStringField;
    cdsProdprecus: TFloatField;
    cdsHMPro: TClientDataSet;
    cdsHMProcdhist: TIntegerField;
    cdsHMProcdempr: TIntegerField;
    cdsHMProhistor: TStringField;
    cdsHMProquaalt: TFloatField;
    cdsHMProestatu: TFloatField;
    cdsHMProCDPROD: TIntegerField;
    cdsNtOpe: TClientDataSet;
    cdsNtOpecdntop: TStringField;
    cdsNtOpedescri: TStringField;
    cdsNtOpebxesto: TStringField;
    cdsNtOpeefelan: TStringField;
    cdsNtOpeincipi: TStringField;
    function verificaBD():Boolean;
    function Autenticacao(cdemp:integer;login:String;senha:string): boolean;
    procedure cdsProdclaoriGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsProdsittriGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsClisexoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsFuncsexoGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsProdtipoprGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure HistPro(cdempr:integer;cdprod:integer;historico:string;quaalt:real;estatu:real);
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

     else if cdsUsucdempr.AsInteger = cdemp then
     begin
        result:= true
     end
     else result:= false;
  end else
  begin
       result:=false;
  end;
end;

procedure Tdm.cdsProdclaoriGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  If Sender.Value ='0' then Text:='0 - Nacional' else
  If Sender.Value ='1' then Text:='1 - Importado' else
  If Sender.Value ='2' then Text:='2 - Importado adquirido mercado interno' else
    Text := '';
end;

procedure Tdm.cdsProdsittriGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  If Sender.Value ='00' then Text:='00 - Tributado integralmente' else
  If Sender.Value ='10' then Text:='10 - Tributado com substitução tributária' else
  If Sender.Value ='20' then Text:='20 - Com redução de base de cálculo' else
  If Sender.Value ='30' then Text:='30 - Isento c/ substituição tributária' else
  If Sender.Value ='40' then Text:='40 - Isento' else
  If Sender.Value ='41' then Text:='41 - Não Tributado' else
  If Sender.Value ='50' then Text:='50 - Com suspensão' else
  If Sender.Value ='51' then Text:='51 - Com Diferimento' else
  If Sender.Value ='60' then Text:='60 - ICMS cobrado anteriormente' else
  If Sender.Value ='70' then Text:='70 - Não Incidente' else
  If Sender.Value ='90' then Text:='90 - Outras' else
    Text := '';
end;

procedure Tdm.cdsClisexoGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  If Sender.Value ='M' then Text:='Masculino' else
  If Sender.Value ='F' then Text:='Feminino' else
end;

procedure Tdm.cdsFuncsexoGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  If Sender.Value ='M' then Text:='Masculino' else
  If Sender.Value ='F' then Text:='Feminino' else
end;

procedure Tdm.cdsProdtipoprGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  If Sender.Value ='P' then Text:='Produto' else
  If Sender.Value ='S' then Text:='Serviço' else
end;

procedure Tdm.HistPro(cdempr:integer;cdprod:integer;historico:string;quaalt:real;estatu:real);
begin
  cdsHMPro.Open;
  cdsHMPro.Append;
  cdsHMProcdempr.AsInteger := cdempr;
  cdsHMProCDPROD.AsInteger := cdprod;
  cdsHMProquaalt.AsFloat := quaalt;
  cdsHMProestatu.AsFloat := estatu;
  cdsHMProhistor.AsString := historico;

  executaSql(cdsAux,'select max(cdhist) as cod from hmpro where cdempr='+
        IntToStr(frmPrincipal.Configuracao.EmpresaCodigo));
  cdsHMProcdhist.AsInteger := cdsAux.FieldByName('cod').AsInteger + 1;

  cdsHMPro.ApplyUpdates(0);
  cdsHMPro.Refresh;
  cdsHMPro.Close;
end;

end.



