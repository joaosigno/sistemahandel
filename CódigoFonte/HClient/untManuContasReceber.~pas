unit untManuContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls,
  DBCtrls, CurrEdit, RXDBCtrl, wwdblook, Wwdbdlg, ToolEdit, Mask, untDeclaracoes,
  ExtCtrls;

type
  TfrmManuContasReceber = class(TfrmManutencao)
    pgCtRec: TPageControl;
    tsInicio: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    DBText1: TDBText;
    Label5: TLabel;
    dbdeDtEmissao: TDBDateEdit;
    Label8: TLabel;
    dbeCodCaix: TwwDBLookupComboDlg;
    dbcbContaCaixa: TDBLookupComboBox;
    Label2: TLabel;
    dbeCodCli: TwwDBLookupComboDlg;
    dblcbClientes: TDBLookupComboBox;
    Label3: TLabel;
    dbeTitulo: TDBEdit;
    Label4: TLabel;
    dbeCodNota: TDBEdit;
    Label7: TLabel;
    dbdeDtVenc: TDBDateEdit;
    Label6: TLabel;
    dbeValor: TRxDBCalcEdit;
    btnDadosPgto: TButton;
    lbl_NomeDia: TLabel;
    tmr_verificaconta: TTimer;
    dbmmHistorico: TDBMemo;
    Label9: TLabel;
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
    Label10: TLabel;
    rxdbceMulta: TRxDBCalcEdit;
    dbcbxSemPromissoria: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeTituloExit(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tmr_verificacontaTimer(Sender: TObject);
    procedure dbeCodCaixKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodCaixExit(Sender: TObject);
    procedure dbeCodCliExit(Sender: TObject);
    procedure btnDadosPgtoClick(Sender: TObject);
    procedure dbeCodCliKeyPress(Sender: TObject; var Key: Char);
  private
  F: TFuncoes;
  function verificaDadosAntesGravar():Boolean;
  procedure verificaInsercao();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuContasReceber: TfrmManuContasReceber;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuContasReceber.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsContas);
  inherited;
  DataSource.DataSet := dm.cdsContas;
  ManuDAO.SQL.executaSQlPorEmp(dm.cdsCli,'*','clien',' order by nome');
  dbeCodCaix.LookupTable := dm.cdsPlanContas;
  dbeCodCli.LookupTable := dm.cdsCli;

end;

procedure TfrmManuContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuContasReceber.tbGravarClick(Sender: TObject);
begin
 if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsContastipcon.AsString  := 'R';
     dm.cdsContasstacon.AsString := 'A';
     dm.cdsContascdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'codcon','conta');
  end;
  inherited;
end;

function TfrmManuContasReceber.verificaDadosAntesGravar: Boolean;
begin
  if dbeCodCaix.Text = '' then
   begin
      f.Mensagem(false,'Preencha Conta de Caixa!');
      result:= false;
   end else result:=true;
   if dbeCodCli.Text = '' then
   begin
      f.Mensagem(false,'Preencha Código de Cliente!');
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

procedure TfrmManuContasReceber.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgCtRec,0);
     dbdeDtEmissao.SetFocus;
  end;
end;

procedure TfrmManuContasReceber.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuContasReceber.dbeTituloExit(Sender: TObject);
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

procedure TfrmManuContasReceber.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuContasReceber.tmr_verificacontaTimer(Sender: TObject);
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

procedure TfrmManuContasReceber.dbeCodCaixKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuContasReceber.dbeCodCaixExit(Sender: TObject);
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

procedure TfrmManuContasReceber.dbeCodCliExit(Sender: TObject);
begin
  if dbeCodCli.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','clien','and cdclie='+
      QuotedStr(dbeCodCli.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsContascdclfo.AsString:= '';
          f.Mensagem(false,'Cliente Não Existe!');
      end;
    end; 
end;

procedure TfrmManuContasReceber.btnDadosPgtoClick(Sender: TObject);
begin
   pnl_DadosPagamento.Visible := not pnl_DadosPagamento.Visible;
end;

procedure TfrmManuContasReceber.dbeCodCliKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

end.
