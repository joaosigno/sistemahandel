unit untManuContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, ComCtrls, DB, ImgList, ToolWin, StdCtrls,
  wwdblook, Wwdbdlg, Mask, DBCtrls, ToolEdit, RXDBCtrl, CurrEdit, ExtCtrls,
  untDeclaracoes;

type
  TfrmManuContasPagar = class(TfrmManutencao)
    pgContasPagar: TPageControl;
    tbPrincipal: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeTitulo: TDBEdit;
    Label4: TLabel;
    dbeCodNota: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    dbmmHistorico: TDBMemo;
    dbdeDtEmissao: TDBDateEdit;
    dbdeDtVenc: TDBDateEdit;
    dbeValor: TRxDBCalcEdit;
    dblcbFornecedor: TDBLookupComboBox;
    DBText1: TDBText;
    Label8: TLabel;
    dbcbContaCaixa: TDBLookupComboBox;
    dbeCodCaix: TwwDBLookupComboDlg;
    dbeCodFor: TwwDBLookupComboDlg;
    tmr_verificaconta: TTimer;
    lbl_NomeDia: TLabel;
    btnDadosPgto: TButton;
    pnl_DadosPagamento: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbcalcedt_juros: TRxDBCalcEdit;
    dbcalcedt_Desconto: TRxDBCalcEdit;
    dbcalcedt_valorpago: TRxDBCalcEdit;
    dbdateedt_datapgto: TDBDateEdit;
    MMoBS: TDBMemo;
    dbcbxSemPromissoria: TDBCheckBox;
    rxdbceMulta: TRxDBCalcEdit;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbGravarClick(Sender: TObject);
 //   procedure dbePesquisaTituloExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeTituloExit(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tmr_verificacontaTimer(Sender: TObject);
    procedure dbeCodCaixKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodForKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodCaixExit(Sender: TObject);
    procedure dbeCodForExit(Sender: TObject);
    procedure btnDadosPgtoClick(Sender: TObject);
  private
  F: TFuncoes;
  function verificaDadosAntesGravar():Boolean;
  procedure verificaInsercao();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuContasPagar: TfrmManuContasPagar;

implementation

uses untDM, DAO, untPrincipal;

{$R *.dfm}

procedure TfrmManuContasPagar.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsContas);
  inherited;
  DataSource.DataSet := dm.cdsContas;
  ManuDAO.SQL.executaSQlPorEmp(dm.cdsFor,'*','forne',' order by nmfant');
  dbeCodCaix.LookupTable := dm.cdsPlanContas;
  dbeCodFor.LookupTable := dm.cdsFor;
end;

procedure TfrmManuContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuContasPagar.tbGravarClick(Sender: TObject);
begin
 if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsContastipcon.AsString  := 'P';
     dm.cdsContasstacon.AsString := 'A';
     dm.cdsContascdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'codcon','conta');
  end;
  inherited;
end;

procedure TfrmManuContasPagar.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

function TfrmManuContasPagar.verificaDadosAntesGravar: Boolean;
begin
  if dbeCodCaix.Text = '' then
   begin
      f.Mensagem(false,'Preencha Conta de Caixa!');
      result:= false;
   end else result:=true;
   if dbeCodFor.Text = '' then
   begin
      f.Mensagem(false,'Preencha Código de Fornecedor!');
      result:= false;
   end else result:=true;
   if dbeTitulo.Text = '' then
   begin
      f.Mensagem(false,'Preencha Titulo!');
      result:= false;
   end else result:=true;
   if dbeCodNota.Text = '' then
   begin
      f.Mensagem(false,'Preencha Nota!');
      result:= false;
   end else result:=true;
   if dbdeDtEmissao.Text = '  -  -    ' then
   begin
      f.Mensagem(false,'Preencha Data de Emissão!');
      result:= false;
   end else result:=true;
   if dbdeDtVenc.Text = '  -  -    ' then
   begin
      f.Mensagem(false,'Preencha Data de Vencimento!');
      result:= false;
   end else result:=true;
   if dbeValor.Text = '  -  -    ' then
   begin
      f.Mensagem(false,'Preencha Valor!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuContasPagar.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgContasPagar,0);
     dbdeDtEmissao.SetFocus;
  end;
end;

procedure TfrmManuContasPagar.dbeTituloExit(Sender: TObject);
begin
 if DataSource.State IN [dsInsert] then
  begin
     if dbeTitulo.Text <> '' then
     begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','conta',' and titulo='+
        QuotedStr(dbeTitulo.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsContastitulo.AsString:= '';
            f.Mensagem(false,'Titulo Ja esta Gravado!');
        end;
       end; 
  end;

end;

procedure TfrmManuContasPagar.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuContasPagar.tmr_verificacontaTimer(Sender: TObject);
begin
  if dm.cdsContasstacon.AsString = 'Q' then
  begin
    btnDadosPgto.Enabled := true;
  end else
  begin
    btnDadosPgto.Enabled := false;
  end;
  if dbdeDtVenc.Text = '  -  -    ' then
     lbl_nomedia.Visible := false
  else
  begin
    lbl_NomeDia.Visible := true;
    lbl_nomedia.Caption := F.DataExtenso(dbdeDtVenc.Date,2);
  end;
end;

procedure TfrmManuContasPagar.dbeCodCaixKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuContasPagar.dbeCodForKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;

end;

procedure TfrmManuContasPagar.dbeCodCaixExit(Sender: TObject);
begin
    if dbeCodCaix.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from plcon where cdcont='+
      QuotedStr(dbeCodCaix.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsContasconcax.AsString:= '';
          f.Mensagem(false,'Codigo de Caixa Não Existe!');
      end;
    end; 

end;

procedure TfrmManuContasPagar.dbeCodForExit(Sender: TObject);
begin
    if dbeCodFor.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','forne','and cdforn='+
      QuotedStr(dbeCodFor.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsContascdclfo.AsString:= '';
          f.Mensagem(false,'Fornecedor Não Existe!');
      end;
    end; 


end;

procedure TfrmManuContasPagar.btnDadosPgtoClick(Sender: TObject);
begin
   pnl_DadosPagamento.Visible := not pnl_DadosPagamento.Visible;

end;

end.
