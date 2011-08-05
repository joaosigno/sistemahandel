unit untManuContasBancarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, untDeclaracoes,
  RXDBCtrl, CurrEdit, ToolEdit, DBCtrls, StdCtrls, Mask;

type
  TfrmManuContasBancarias = class(TfrmManutencao)
    pgCTBanco: TPageControl;
    tsInicio: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeDesccri: TDBEdit;
    Label5: TLabel;
    dbeAgencia: TDBEdit;
    Label6: TLabel;
    dbeConta: TDBEdit;
    Label7: TLabel;
    dbeCodBanco: TDBEdit;
    dblcbBanco: TDBLookupComboBox;
    dbdateedtdatacadastro: TDBDateEdit;
    dbeCod: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    dbdeDtAbert: TDBDateEdit;
    Label8: TLabel;
    dbeTelefone: TDBEdit;
    Label9: TLabel;
    dbeFax: TDBEdit;
    Label10: TLabel;
    dbeGerente: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    dbdeDtVenc: TDBDateEdit;
    dbeLimite: TRxDBCalcEdit;
    Label13: TLabel;
    Label14: TLabel;
    dbcdedtemail: TRxDBComboEdit;
    dbcdedthomepage: TRxDBComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeDesccriExit(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeCodBancoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbeFaxKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLimiteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodBancoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  F : TFuncoes;
    { Private declarations }
  public
   procedure verificaInsercao();
   function verificaDadosAntesGravar():Boolean;
    { Public declarations }
  end;

var
  frmManuContasBancarias: TfrmManuContasBancarias;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuContasBancarias.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsCTBan);
  inherited;
  DataSource.DataSet := DM.cdsCTBan;
end;

procedure TfrmManuContasBancarias.tbGravarClick(Sender: TObject);
begin
    if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsCTBancdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdcont','ctban');
  end;
   inherited; 
end;

procedure TfrmManuContasBancarias.dbeDesccriExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeDesccri.Text <> '' then
      begin
        ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','ctban',' and descri='+
        QuotedStr(dbeDesccri.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsCTBandescri.AsString:= '';
            f.Mensagem(false,'Descrição Ja esta Gravado!');
        end;
      end;  
  end;
end;

function TfrmManuContasBancarias.verificaDadosAntesGravar: Boolean;
begin
  if dbeDesccri.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição!');
      result:= false;
   end else result:=true;
   if dbeAgencia.Text = '' then
   begin
      f.Mensagem(false,'Preencha Agência!');
      result:= false;
   end else result:=true;
   if dbeConta.Text = '' then
   begin
      f.Mensagem(false,'Preencha Conta!');
      result:= false;
   end else result:=true;
   if dbeCodBanco.Text = '' then
   begin
      f.Mensagem(false,'Preencha Banco!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuContasBancarias.verificaInsercao;
begin
    if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgCTBanco,0);
     dbeDesccri.SetFocus;
  end;
end;

procedure TfrmManuContasBancarias.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuContasBancarias.FormShow(Sender: TObject);
begin
  verificaInsercao;
end;

procedure TfrmManuContasBancarias.dbeCodBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuContasBancarias.dbeTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
   If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuContasBancarias.dbeFaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuContasBancarias.dbeLimiteKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuContasBancarias.dbeCodBancoExit(Sender: TObject);
begin
    if dbeCodBanco.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'SELECT * FROM banco WHERE cdban='+
      QuotedStr(dbeCodBanco.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsCTBancdbanc.AsString:= '';
          f.Mensagem(false,'Banco Não Existe!');
      end;
    end;

end;

procedure TfrmManuContasBancarias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

end.
