unit untRDS;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, HS_TLB, StdVcl, ExtCtrls, DB, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZConnection;

type
  Trds = class(TRemoteDataModule, Irds)
    con: TZConnection;
    qryUsuario: TZQuery;
    qryUsuariocdusuario: TIntegerField;
    qryUsuariocdempresa: TIntegerField;
    qryUsuariocdfuncionario: TIntegerField;
    qryUsuariousunome: TStringField;
    qryUsuariooperaqualquerempresa: TStringField;
    qryUsuarioadministrador: TStringField;
    qryUsuariosenha: TStringField;
    dspUsuario: TDataSetProvider;
    qryEmpresa: TZQuery;
    qryEmpresacdempresa: TIntegerField;
    qryEmpresanomefantasia: TStringField;
    qryEmpresarazaosocial: TStringField;
    qryEmpresacgc: TStringField;
    qryEmpresainscricaoestudal: TStringField;
    qryEmpresaendereco: TStringField;
    qryEmpresacomplemento: TStringField;
    qryEmpresanumero: TStringField;
    qryEmpresabairro: TStringField;
    qryEmpresacep: TStringField;
    qryEmpresacidade: TStringField;
    qryEmpresauf: TStringField;
    qryEmpresaresponsavel: TStringField;
    qryEmpresatelefone: TStringField;
    qryEmpresafax: TStringField;
    qryEmpresaemail: TStringField;
    dspEmpresa: TDataSetProvider;
    dspFuncionario: TDataSetProvider;
    dspBanco: TDataSetProvider;
    dspFornecedor: TDataSetProvider;
    qryBanco: TZQuery;
    qryFornecedor: TZQuery;
    qryFornecedorcdfor: TIntegerField;
    qryFornecedorcdemp: TIntegerField;
    qryFornecedorcdbancario: TIntegerField;
    qryFornecedordatacadastro: TDateField;
    qryFornecedorpessoafisica: TStringField;
    qryFornecedornomefantasia: TStringField;
    qryFornecedorrazaosocial: TStringField;
    qryFornecedorinscricaoestadual: TStringField;
    qryFornecedorcgc: TStringField;
    qryFornecedorcep: TStringField;
    qryFornecedorendereco: TStringField;
    qryFornecedorbairro: TStringField;
    qryFornecedorcidade: TStringField;
    qryFornecedornumero: TStringField;
    qryFornecedoruf: TStringField;
    qryFornecedortelefone: TStringField;
    qryFornecedorfax: TStringField;
    qryFornecedordatafundacao: TDateField;
    qryFornecedorramoatividade: TStringField;
    qryFornecedoragencia: TStringField;
    qryFornecedorcontacorrente: TStringField;
    qryFornecedoremail: TStringField;
    qryFornecedorhomepage: TStringField;
    qryFornecedorobservacao: TStringField;
    qryFornecedorrepresentante1: TStringField;
    qryFornecedorrepcontato1: TStringField;
    qryFornecedorreptelefone1: TStringField;
    qryFornecedorrepfax1: TStringField;
    qryFornecedorrepemail1: TStringField;
    qryFornecedorrepresentante2: TStringField;
    qryFornecedorrepcontato2: TStringField;
    qryFornecedorreptelefone2: TStringField;
    qryFornecedorrepfax2: TStringField;
    qryFornecedorrepemail2: TStringField;
    qryFornecedorrepresentante3: TStringField;
    qryFornecedorrepcontato3: TStringField;
    qryFornecedorreptelefone3: TStringField;
    qryFornecedorrepfax3: TStringField;
    qryFornecedorrepemail3: TStringField;
    qryFuncionario: TZQuery;
    qryFuncionariocdfuncionario: TIntegerField;
    qryFuncionariocdempresa: TIntegerField;
    qryFuncionarioprofissao: TIntegerField;
    qryFuncionariosexo: TStringField;
    qryFuncionarionome: TStringField;
    qryFuncionariorg: TStringField;
    qryFuncionariocpf: TStringField;
    qryFuncionariocep: TStringField;
    qryFuncionarioendereco: TStringField;
    qryFuncionariobairro: TStringField;
    qryFuncionariocidade: TStringField;
    qryFuncionariouf: TStringField;
    qryFuncionariotelefone: TStringField;
    qryFuncionariodatanascimento: TDateField;
    qryFuncionarioemail: TStringField;
    qryFuncionariodataadmissao: TDateField;
    qryFuncionariodatasaida: TDateField;
    qryFuncionariocargahoraria: TIntegerField;
    qryFuncionariosenhaponto: TStringField;
    qryFuncionariosalariofixo: TFloatField;
    qryFuncionariocomissao: TFloatField;
    qryFuncionarioprevisaoferias: TDateField;
    qryFuncionarioobservacoes: TStringField;
    tmHS: TTimer;
    qryVerificaAcessos: TZQuery;
    qryVerificaAcessoscdusuario: TIntegerField;
    qryVerificaAcessosusunome: TStringField;
    qryVerificaAcessosnomefantasia: TStringField;
    dspVerificaAcessos: TDataSetProvider;
    procedure abrirQry(qry:TZQuery);
    procedure fecharQry(qry:TZQuery);
    procedure tmHSTimer(Sender: TObject);
    procedure RemoteDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure Trds.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure Trds.abrirQry(qry: TZQuery);
begin
  qry.Open;
end;

procedure Trds.fecharQry(qry: TZQuery);
begin
  qry.Close;
end;

procedure Trds.tmHSTimer(Sender: TObject);
begin
  abrirQry(qryVerificaAcessos);
  fecharQry(qryVerificaAcessos);
end;

procedure Trds.RemoteDataModuleCreate(Sender: TObject);
begin
  con.Connected := true;
  qryVerificaAcessos.Active := true;
  tmHS.Enabled:= true;
end;

initialization
  TComponentFactory.Create(ComServer, Trds,
    Class_rds, ciMultiInstance, tmApartment);
end.
