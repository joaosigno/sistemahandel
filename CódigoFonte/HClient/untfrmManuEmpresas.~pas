unit untfrmManuEmpresas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, ToolEdit, RXDBCtrl, untDeclaracoes, ShellApi;

type
  TfrmManuEmpresas = class(TfrmManutencao)
    pgEmpresas: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    Label2: TLabel;
    dbeNomeFantasia: TDBEdit;
    Label3: TLabel;
    dbeRazaoSocial: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbeIE: TDBEdit;
    Label6: TLabel;
    DBEEndereco: TDBEdit;
    Label7: TLabel;
    dbeCOmplemento: TDBEdit;
    Label8: TLabel;
    dbeNum: TDBEdit;
    Label9: TLabel;
    dbeBairro: TDBEdit;
    Label10: TLabel;
    dbeCEP: TDBEdit;
    Label11: TLabel;
    dbeCidade: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbeResponsavel: TDBEdit;
    Label14: TLabel;
    dbeTelefone: TDBEdit;
    Label15: TLabel;
    dbeFax: TDBEdit;
    Label16: TLabel;
    dbeCNPJ: TRxDBComboEdit;
    dbcbuf: TDBComboBox;
    dbcdedtemail: TRxDBComboEdit;
    Label17: TLabel;
    dbcbtipoempresa: TDBComboBox;
    dbdateedtdatacadastro: TDBDateEdit;
    Label18: TLabel;
    dblcbBanco: TDBLookupComboBox;
    Label19: TLabel;
    dbeCodBanco: TDBEdit;
    Label20: TLabel;
    dbeConta: TDBEdit;
    Label21: TLabel;
    dbeAgencia: TDBEdit;
    procedure dbeCNPJExit(Sender: TObject);
    procedure dbeCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCEPKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbeFaxKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCNPJButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeNomeFantasiaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure dbeCodBancoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodBancoExit(Sender: TObject);
    procedure dbeRazaoSocialExit(Sender: TObject);
  private
    F : TFuncoes;
    procedure verificaInsersao();
    function verificaDadosAntesGravar:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuEmpresas: TfrmManuEmpresas;

implementation

uses untDM, untPrincipal, untMensagem;

{$R *.dfm}

procedure TfrmManuEmpresas.dbeCNPJExit(Sender: TObject);
begin
  if DataSource.State in [dsInsert] then
  begin
      if dbeCNPJ.Text <> '' then
      begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from empr where cgc='+
        QuotedStr(dbeCNPJ.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsForCGC.AsString := '';
            f.Mensagem(false,'CNPJ Ja está Gravado!');
        end;
      end;
  end;

  if not F.VerificaCPF(dbeCNPJ.Text) then dm.cdsEmpcgc.AsString := '';
end;

procedure TfrmManuEmpresas.dbeCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuEmpresas.dbeCEPKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuEmpresas.dbeTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuEmpresas.dbeFaxKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuEmpresas.dbeCNPJButtonClick(Sender: TObject);
begin
  ShellExecute(Application.Handle,nil,PChar('http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao.asp'),nil,nil,SW_SHOWNORMAL);
end;

function TfrmManuEmpresas.verificaDadosAntesGravar:Boolean;
begin
  if dbeNomeFantasia.Text = '' then
   begin
      f.Mensagem(false,'Preencha nome fantasia!');
      result:= false;
   end else result:=true;
  if dbcbtipoempresa.Text = '' then
   begin
      f.Mensagem(false,'Preencha Tipo de Empresa!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuEmpresas.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsEmp);
  inherited;
  DataSource.DataSet := dm.cdsEmp;
end;

procedure TfrmManuEmpresas.tbGravarClick(Sender: TObject);
var cod:integer;
begin
  if verificaDadosAntesGravar = false then
  abort else
  begin
    if DataSource.State in [dsInsert] then
    begin
       ManuDAO.SQL.executaSql(dm.cdsAux,'select max(cdempr) as Cod from empre');
       cod := dm.cdsAux.fieldByName('Cod').AsInteger;
       cod := cod + 1;
       dbeCod.Text := Format('%6.6d',[(cod)]);
    end;
  inherited;
  end;
end;

procedure TfrmManuEmpresas.dbeNomeFantasiaExit(Sender: TObject);
begin
 if DataSource.State IN [dsInsert] then
  begin
      if dbeNomeFantasia.Text <> '' then
      begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from empre where nmfant='+
        QuotedStr(dbeNomeFantasia.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsFornmfant.AsString:= '';
            f.Mensagem(false,'Nome Fantasia Ja esta Gravado!');
        end;
        end;
  end;

end;

procedure TfrmManuEmpresas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuEmpresas.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsersao;
end;

procedure TfrmManuEmpresas.verificaInsersao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgEmpresas,0);
     dbeNomeFantasia.SetFocus;
  end;
end;

procedure TfrmManuEmpresas.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsersao;
end;

procedure TfrmManuEmpresas.dbeCodBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuEmpresas.dbeCodBancoExit(Sender: TObject);
begin
    if dbeCodBanco.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from banco where cdban='+
      QuotedStr(dbeCodBanco.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsEmpcdbanc.AsString:= '';
          f.Mensagem(false,'Banco Não Existe!');
      end;
    end;
end;

procedure TfrmManuEmpresas.dbeRazaoSocialExit(Sender: TObject);
begin
  if DataSource.State in [dsInsert] then
  begin
      if dbeRazaoSocial.Text <> '' then
      begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from empr where crzsoci='+
        QuotedStr(dbeRazaoSocial.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsForCGC.AsString := '';
            f.Mensagem(false,'Razão Social Ja está Gravado!');
        end;
      end;  
  end;

end;

end.
