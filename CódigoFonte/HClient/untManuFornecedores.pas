unit untManuFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, ExtCtrls,
  DBCtrls, StdCtrls, RXDBCtrl, ToolEdit, Mask, ShellApi, untDeclaracoes
  , DAO;

type
  TfrmManuFornecedores = class(TfrmManutencao)
    pgFornecedor: TPageControl;
    tsFornecedor: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    lblnomefantasia: TLabel;
    lblrazaosocial: TLabel;
    lblRgeIe: TLabel;
    lblCGCeCPF: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    dbeCod: TDBEdit;
    dbeNomEFantasia: TDBEdit;
    dbeRazaoSocial: TDBEdit;
    dbeInscEstadual: TDBEdit;
    dbeCep: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCidade: TDBEdit;
    dbeNum: TDBEdit;
    dbeTelefone: TDBEdit;
    dbeFax: TDBEdit;
    dbdateedtdatacadastro: TDBDateEdit;
    dbcbxPessoafisica: TDBCheckBox;
    dbcbuf: TDBComboBox;
    dbeCNPJ: TRxDBComboEdit;
    tsoutrosdados: TTabSheet;
    Label3: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dbeRamoatividade: TDBEdit;
    dbeagencia: TDBEdit;
    dbecontacorrente: TDBEdit;
    dbeObs: TDBMemo;
    dbdateedtdatafundacao: TDBDateEdit;
    dbcdedtemailfornecedor: TRxDBComboEdit;
    dbcdedthomepagefornecedor: TRxDBComboEdit;
    dblcbBanco: TDBLookupComboBox;
    tsRepresentante: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Bevel2: TBevel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Bevel1: TBevel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    debRep1: TDBEdit;
    dbeCont1: TDBEdit;
    dbeTelefon1: TDBEdit;
    dbefax1: TDBEdit;
    dbcdedtemailrepresentante1: TRxDBComboEdit;
    dbcdedtemailrepresentante2: TRxDBComboEdit;
    dbeTelefone2: TDBEdit;
    dbeCont2: TDBEdit;
    dbeRep2: TDBEdit;
    dbeFax2: TDBEdit;
    dbcdedtemailrepresentante3: TRxDBComboEdit;
    dbeTelefone3: TDBEdit;
    dbeFax3: TDBEdit;
    dbeCont3: TDBEdit;
    dbeRep3: TDBEdit;
    dbeCodBanco: TDBEdit;
    Label4: TLabel;
    procedure dbcbxPessoafisicaExit(Sender: TObject);
    procedure dbeCNPJExit(Sender: TObject);
    procedure dbcdedthomepagefornecedorButtonClick(Sender: TObject);
    procedure dbeCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure tbAdicionarClick(Sender: TObject);
    procedure dbeCNPJButtonClick(Sender: TObject);
    procedure dbeCodKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeNomEFantasiaExit(Sender: TObject);
    procedure dbeRazaoSocialExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeCodBancoExit(Sender: TObject);
  private
    f: TFuncoes;
    procedure verificaTipoFornecedor();
    procedure verificaInsercao();
    function verificaDadosAntesGravar():Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuFornecedores: TfrmManuFornecedores;
  
implementation

uses untDM, untPrincipal, StdConvs;

{$R *.dfm}

{ TfrmManuFornecedores }

procedure TfrmManuFornecedores.verificaTipoFornecedor;
begin
  if dbcbxPessoafisica.Checked = true then
  begin
    dm.cdsForCGC.EditMask := '999.999.999-99;1; ';
  end else
  begin
    dm.cdsForCGC.EditMask := '99.999.999/9999-99;1; ';
  end;
end;

procedure TfrmManuFornecedores.dbcbxPessoafisicaExit(Sender: TObject);
begin
    verificaTipoFornecedor;
end;

procedure TfrmManuFornecedores.dbeCNPJExit(Sender: TObject);
begin
  if DataSource.State in [dsInsert] then
  begin
      if dbeCNPJ.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','Forne',' and cgc='+
        QuotedStr(dbeCNPJ.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsForCGC.AsString := '';
            f.Mensagem(false,'CPF/CNPJ Ja está Gravado!');
        end;
       end; 
  end;

   if dbcbxpessoafisica.Checked = True then
    begin
      if not F.VerificaCPF(dbeCNPJ.Text) then dm.cdsForCGC.AsString := '';
    end else
    begin
      if not F.VerificaCGC(dbeCNPJ.Text) then dm.cdsForCGC.AsString := '';
    end;
end;

procedure TfrmManuFornecedores.dbcdedthomepagefornecedorButtonClick(
  Sender: TObject);
begin
  ShellExecute(Application.Handle,nil,PChar(dbcdedthomepagefornecedor.Text),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmManuFornecedores.dbeCNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;

  if dbcbxpessoafisica.Checked = True then
  begin
    if not F.VerificaCPF(dbeCNPJ.Text) then dbeCNPJ.Color := $004D61EE else dbeCNPJ.Color := clLime;
  end else
  begin
    if not F.VerificaCGC(dbeCNPJ.Text) then dbeCNPJ.Color := $004D61EE else dbeCNPJ.Color := clLime;
  end;
end;

procedure TfrmManuFornecedores.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuFornecedores.dbeCNPJButtonClick(Sender: TObject);
begin
  if dm.cdsForpesfis.AsString = 'S' then
  begin
    ShellExecute(Application.Handle,nil,PChar('http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/ConsultaPublica.asp'),nil,nil,SW_SHOWNORMAL);
  end else
  begin
    ShellExecute(Application.Handle,nil,PChar('http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao.asp'),nil,nil,SW_SHOWNORMAL);
  end;
end;

function TfrmManuFornecedores.verificaDadosAntesGravar:Boolean;
begin
   if dbeNomeFantasia.Text = '' then
   begin
      f.Mensagem(false,'Preencha nome fantasia!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuFornecedores.dbeCodKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuFornecedores.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgFornecedor,0);
     dm.cdsForpesfis.AsString := 'N';
     verificaTipoFornecedor;
     dbeNomeFantasia.SetFocus;
  end;
end;

procedure TfrmManuFornecedores.FormShow(Sender: TObject);
begin
   verificaInsercao;
end;

procedure TfrmManuFornecedores.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsFor);
  inherited;
  DataSource.DataSet := dm.cdsFor;
end;

procedure TfrmManuFornecedores.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsForcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdforn','forne');
  end;
  inherited;
end;

procedure TfrmManuFornecedores.dbeNomEFantasiaExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
    if dbeNomEFantasia.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','Forne',' and nmfant='+
        QuotedStr(dbeNomeFantasia.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsFornmfant.AsString:= '';
            f.Mensagem(false,'Nome Fantasia Ja esta Gravado!');
        end;
     end;   
  end;
end;

procedure TfrmManuFornecedores.dbeRazaoSocialExit(Sender: TObject);
begin
  if DataSource.State in [dsInsert] then
  begin
      if dbeRazaoSocial.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','Forne',' and rzsoci='+
        QuotedStr(dbeRazaoSocial.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsForrzsoci.AsString := '';
            f.Mensagem(false,'Razão Social Já Esta Gravado!');
        end;
        end;
  end;

end;

procedure TfrmManuFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuFornecedores.dbeCodBancoExit(Sender: TObject);
begin
    if dbeCodBanco.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from banco where cdban='+
      QuotedStr(dbeCodBanco.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsForcdbanco.AsString:= '';
          f.Mensagem(false,'Banco Não Existe!');
      end;
    end;  
end;

end.
