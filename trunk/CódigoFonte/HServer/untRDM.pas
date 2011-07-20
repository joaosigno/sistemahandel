unit untRDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, HS_TLB, StdVcl, ExtCtrls, DB, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZConnection;

type
  TRDM = class(TRemoteDataModule, IRDM)
    con: TZConnection;
    dspUsu: TDataSetProvider;
    dspFun: TDataSetProvider;
    dspBanco: TDataSetProvider;
    dspForn: TDataSetProvider;
    dspVerificaAcessos: TDataSetProvider;
    dspPesq: TDataSetProvider;
    dspAux: TDataSetProvider;
    qryEmp: TZReadOnlyQuery;
    dspEmp: TDataSetProvider;
    qryAux: TZReadOnlyQuery;
    qryUsu: TZReadOnlyQuery;
    qryFun: TZReadOnlyQuery;
    qryUsuuciduser: TIntegerField;
    qryUsuucusername: TStringField;
    qryUsuuclogin: TStringField;
    qryUsuucpassword: TStringField;
    qryUsuucpassexpired: TStringField;
    qryUsuucuserexpired: TIntegerField;
    qryUsuucuserdayssun: TIntegerField;
    qryUsuucemail: TStringField;
    qryUsuucprivileged: TIntegerField;
    qryUsuuctyperec: TStringField;
    qryUsuucprofile: TIntegerField;
    qryUsuuckey: TStringField;
    qryUsuucinative: TIntegerField;
    qryUsutodasEmpresas: TStringField;
    qryPesq: TZReadOnlyQuery;
    qryBanco: TZReadOnlyQuery;
    qryForn: TZReadOnlyQuery;
    dspCUsu: TDataSetProvider;
    qryCUsu: TZQuery;
    qryGRPro: TZReadOnlyQuery;
    dspGRPro: TDataSetProvider;
    qryProf: TZReadOnlyQuery;
    dspProf: TDataSetProvider;
    qryEmpcdempr: TIntegerField;
    qryEmpnmfant: TStringField;
    qryEmprzsoci: TStringField;
    qryEmpcgc: TStringField;
    qryEmpinsest: TStringField;
    qryEmpendere: TStringField;
    qryEmpcomple: TStringField;
    qryEmpnumero: TStringField;
    qryEmpbairro: TStringField;
    qryEmpcidade: TStringField;
    qryEmpuf: TStringField;
    qryEmprespon: TStringField;
    qryEmptelefo: TStringField;
    qryEmpfax: TStringField;
    qryEmpemail: TStringField;
    qryEmptpempr: TStringField;
    qryFuncdfunc: TIntegerField;
    qryFuncdempr: TIntegerField;
    qryFuncdprof: TIntegerField;
    qryFunnome: TStringField;
    qryFunsexo: TStringField;
    qryFunrg: TStringField;
    qryFuncpf: TStringField;
    qryFunendere: TStringField;
    qryFunbairro: TStringField;
    qryFunnumero: TStringField;
    qryFuncidade: TStringField;
    qryFunuf: TStringField;
    qryFuntelefo: TStringField;
    qryFundtnasc: TDateField;
    qryFunemail: TStringField;
    qryFundtadmi: TDateField;
    qryFundtsaid: TDateField;
    qryFunchorar: TIntegerField;
    qryFunsalari: TFloatField;
    qryFunprferi: TDateField;
    qryFunobserv: TStringField;
    qryProfcdprof: TIntegerField;
    qryProfcdempr: TIntegerField;
    qryProfdescri: TStringField;
    qryBancocdban: TIntegerField;
    qryBancodescri: TStringField;
    qryForncdforn: TIntegerField;
    qryForncdbanco: TIntegerField;
    qryForndtcada: TDateField;
    qryFornpesfis: TStringField;
    qryFornnmfant: TStringField;
    qryFornrzsoci: TStringField;
    qryForninsest: TStringField;
    qryForncgc: TStringField;
    qryFornendere: TStringField;
    qryFornbairro: TStringField;
    qryForncidade: TStringField;
    qryFornnumero: TStringField;
    qryFornuf: TStringField;
    qryForntelefo: TStringField;
    qryFornfax: TStringField;
    qryForndtfund: TDateField;
    qryFornrmativ: TStringField;
    qryFornagenci: TStringField;
    qryFornconta: TStringField;
    qryFornemail: TStringField;
    qryFornhomepa: TStringField;
    qryFornobserv: TStringField;
    qryFornrepre1: TStringField;
    qryFornrpcon1: TStringField;
    qryFornrptel1: TStringField;
    qryFornrpfax1: TStringField;
    qryFornrpema1: TStringField;
    qryFornrepre2: TStringField;
    qryFornrpcon2: TStringField;
    qryFornrptel2: TStringField;
    qryFornrpfax2: TStringField;
    qryFornrpema2: TStringField;
    qryFornrepre3: TStringField;
    qryFornrpcon3: TStringField;
    qryFornrptel3: TStringField;
    qryFornrpfax3: TStringField;
    qryFornrpema3: TStringField;
    qryGRProcdgrup: TIntegerField;
    qryGRProcdempr: TIntegerField;
    qryGRProdescri: TStringField;
    qryGRProacdesc: TStringField;
    qryGRProvldesc: TFloatField;
    qryForncdempr: TIntegerField;
    qryFundtcada: TDateField;
    qryFuncartpr: TStringField;
    dspDepar: TDataSetProvider;
    qryDepa: TZReadOnlyQuery;
    qryDepacddepa: TIntegerField;
    qryDepacdempr: TIntegerField;
    qryDepadescri: TStringField;
    qryFuncddepa: TIntegerField;
    qryFunativo: TStringField;
    qryCli: TZReadOnlyQuery;
    dspCli: TDataSetProvider;
    qryGRCli: TZReadOnlyQuery;
    dspGRCli: TDataSetProvider;
    qryGRClicdgrup: TIntegerField;
    qryGRClidescri: TStringField;
    qryClicdclie: TIntegerField;
    qryClicdbanc: TIntegerField;
    qryClicdgrup: TIntegerField;
    qryClipesjur: TStringField;
    qryCliativo: TStringField;
    qryClinome: TStringField;
    qryClisexo: TStringField;
    qryClidtnasc: TDateField;
    qryClicldesd: TDateField;
    qryClidtcada: TDateField;
    qryClinatura: TStringField;
    qryClirg: TStringField;
    qryClicpf: TStringField;
    qryCliendere: TStringField;
    qryClinumero: TStringField;
    qryClicidade: TStringField;
    qryClibairro: TStringField;
    qryCliuf: TStringField;
    qryClitelefo: TStringField;
    qryClicelula: TStringField;
    qryClifax: TStringField;
    qryClinmpai: TStringField;
    qryClinmmae: TStringField;
    qryCliemptra: TStringField;
    qryCliempcar: TStringField;
    qryClicdprof: TIntegerField;
    qryCliemptel: TStringField;
    qryCliempend: TStringField;
    qryCliempbai: TStringField;
    qryCliempcid: TStringField;
    qryCliempuf: TStringField;
    qryClirfcom1: TStringField;
    qryClirfcom2: TStringField;
    qryClirfcom3: TStringField;
    qryClirfpes1: TStringField;
    qryClirfpes2: TStringField;
    qryClirfpes3: TStringField;
    qryCliemail: TStringField;
    qryClihomepa: TStringField;
    qryCliobserv: TStringField;
    qryClicdempr: TIntegerField;
    qryGRClicdempr: TIntegerField;
    qryBancodtcada: TDateField;
    qryEmpcdbanc: TIntegerField;
    qryEmpconta: TStringField;
    qryEmpdtcada: TDateField;
    qryFuncdbanc: TIntegerField;
    qryFunconta: TStringField;
    qryFunagenci: TStringField;
    qryGRProdtcada: TDateField;
    qryProfdtcada: TDateField;
    qryDepadtcada: TDateField;
    qryCliconta: TStringField;
    qryCliagenci: TStringField;
    qryGRClidtcada: TDateField;
    qryEmpagenci: TStringField;
    qryCliestciv: TStringField;
    qryCliconjug: TStringField;
    qryClicjtele: TStringField;
    qryClicep: TStringField;
    qryCliempcep: TStringField;
    qryFuncep: TStringField;
    qryEmpcep: TStringField;
    qryForncep: TStringField;
    qryClilimite: TFloatField;
    dspDepAut: TDataSetProvider;
    qryDepAut: TZReadOnlyQuery;
    qryDepAutcdclien: TIntegerField;
    qryDepAutnome: TStringField;
    qryDepAutdocume: TStringField;
    qryDepAutdtnasc: TDateField;
    qryDepAuttelefo: TStringField;
    qryDepAutcompra: TStringField;
    qryDepAutdtcada: TDateField;
    qryDepAutcdempr: TIntegerField;
    qryCartFid: TZReadOnlyQuery;
    dspCartFid: TDataSetProvider;
    qryCartFiddtcada: TDateField;
    qryCartFidativo: TStringField;
    qryCartFidemail: TStringField;
    qryDepAuttipo: TStringField;
    dspChq: TDataSetProvider;
    qryChq: TZReadOnlyQuery;
    qryCartFidcdempr: TIntegerField;
    qryVende: TZReadOnlyQuery;
    dspVende: TDataSetProvider;
    qryVendecdvend: TIntegerField;
    qryVendecdempr: TIntegerField;
    qryVendecdfunc: TIntegerField;
    qryVendedtcada: TDateField;
    qryVendenome: TStringField;
    qryVendereccom: TStringField;
    qryVendecomiss: TFloatField;
    qryVendevenvis: TStringField;
    qryVendevenpra: TStringField;
    qryVendevencar: TStringField;
    qryVendevenche: TStringField;
    dspMcPro: TDataSetProvider;
    qryMcPro: TZReadOnlyQuery;
    qryMcProcdmarc: TIntegerField;
    qryMcProcdempr: TIntegerField;
    qryMcProdtcada: TDateField;
    qryMcProdescri: TStringField;
    qryCartFidnmcart: TStringField;
    qryClicdcrfi: TStringField;
    qryCartFidnrcart: TStringField;
    qryUsucdempr: TIntegerField;
    qryUsucdfunc: TIntegerField;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TRDM.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRDM.RemoteDataModuleCreate(Sender: TObject);
begin
  con.Connected := true;
end;

procedure TRDM.RemoteDataModuleDestroy(Sender: TObject);
begin
  con.Connected := false;
end;

initialization
  TComponentFactory.Create(ComServer, TRDM,
    Class_RDM, ciMultiInstance, tmApartment);
end.
