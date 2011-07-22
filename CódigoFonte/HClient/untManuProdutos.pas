unit untManuProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin,untDeclaracoes,
  StdCtrls, Mask, DBCtrls, ToolEdit, RXDBCtrl, CurrEdit;

type
  TfrmManuProdutos = class(TfrmManutencao)
    pgProdutos: TPageControl;
    tsProdutos: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DBEDESCRI: TDBEdit;
    dbeCod: TDBEdit;
    dbdateedtdatacadastro: TDBDateEdit;
    dbcbAtivo: TDBCheckBox;
    Label2: TLabel;
    DBEcODmARCA: TDBEdit;
    dblcbMarca: TDBLookupComboBox;
    Label6: TLabel;
    dbecodgrupo: TDBEdit;
    dblcbgrupo: TDBLookupComboBox;
    dbcbControleGrade: TDBCheckBox;
    Label4: TLabel;
    dbeCodFab: TDBEdit;
    Label7: TLabel;
    dbeRefe: TDBEdit;
    dbcbbxunidade: TDBComboBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    rxcbcePrVenda: TRxDBCalcEdit;
    rxcbcePrCusto: TRxDBCalcEdit;
    rxcbceMargemLucro: TRxDBCalcEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    rxdbcePesoLiquido: TRxDBCalcEdit;
    rxdbcePesoBruto: TRxDBCalcEdit;
    rxdbceCustoReal: TRxDBCalcEdit;
    rxdbceEstMin: TRxDBCalcEdit;
    dbdeUltCompra: TDBDateEdit;
    dbdeUltVenda: TDBDateEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbePrzGrt: TDBEdit;
    tsImpostos: TTabSheet;
    dbedt_codigoNCM: TDBEdit;
    Label20: TLabel;
    dbcbbx_classqtoaorigem: TDBComboBox;
    dbcbbx_situacaotributaria: TDBComboBox;
    Label21: TLabel;
    Label22: TLabel;
    IMCS: TRxDBCalcEdit;
    rxdbceIPI: TRxDBCalcEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbeClasFiscal: TDBEdit;
    rsObs: TTabSheet;
    mmObs: TDBMemo;
    rxcbceEstAtual: TRxDBCalcEdit;
    Label26: TLabel;
    dbcbbxTipoProduto: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBEcODmARCAExit(Sender: TObject);
    procedure dbecodgrupoExit(Sender: TObject);
    procedure dbeCodFabExit(Sender: TObject);
    procedure DBEDESCRIExit(Sender: TObject);
    procedure rxcbceMargemLucroExit(Sender: TObject);
    procedure rxcbcePrVendaExit(Sender: TObject);
    procedure DataSourceStateChange(Sender: TObject);
    procedure dbcbTipoProdutoExit(Sender: TObject);
    procedure verificaTipoProduto;
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure dbcbbxTipoProdutoExit(Sender: TObject);
  private
   F: TFuncoes;
  function verificaDadosAntesGravar():Boolean;
  procedure verificaInsercao();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuProdutos: TfrmManuProdutos;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

{ TfrmManuProdutos }

function TfrmManuProdutos.verificaDadosAntesGravar: Boolean;
begin
  if DBEDESCRI.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição!');
      result:= false;
   end else result:=true;
   if DBEcODmARCA.Text = '' then
   begin
      f.Mensagem(false,'Preencha Marca!');
      result:= false;
   end else result:=true;
   if dbecodgrupo.Text = '' then
   begin
      f.Mensagem(false,'Preencha Grupo!');
      result:= false;
   end else result:=true;
   if rxcbcePrCusto.Value<0 then
   begin
      f.Mensagem(false,'Não é possível gravar Produto Com Preço de Custo Menor que (0)!');
      result:= false;
   end else result:=true;
   if rxcbcePrVenda.Value<0 then
   begin
      f.Mensagem(false,'Não é possível gravar Produto Com Preço de Venda Menor que (0)!');
      result:= false;
   end else result:=true;
   if dm.cdsProdpreven.IsNull then
   begin
      f.Mensagem(false,'Preencha Preço de Venda!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuProdutos.verificaInsercao;
begin
   if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgProdutos,0);
     DBEDESCRI.SetFocus;
  end;
end;

procedure TfrmManuProdutos.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
  verificaTipoProduto;
end;

procedure TfrmManuProdutos.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuProdutos.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsProdcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdprod','produ');
  end;
  inherited;  
end;

procedure TfrmManuProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuProdutos.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsProd);
  inherited;
  DataSource.DataSet := dm.cdsProd;
end;

procedure TfrmManuProdutos.DBEcODmARCAExit(Sender: TObject);
begin
    if DBEcODmARCA.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','mcpro','and cdmarc='+
      QuotedStr(DBEcODmARCA.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsProdcdmarc.AsString:= '';
          f.Mensagem(false,'Marca Não Existe!');
      end;
    end;


end;

procedure TfrmManuProdutos.dbecodgrupoExit(Sender: TObject);
begin
    if dbecodgrupo.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','grpro','and cdgrup='+
      QuotedStr(dbecodgrupo.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsProdcdgrup.AsString:= '';
          f.Mensagem(false,'Grupo Não Existe!');
      end;
    end;

end;

procedure TfrmManuProdutos.dbeCodFabExit(Sender: TObject);
begin
if DataSource.State IN [dsInsert] then
  begin
      if dbeCodFab.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','produ',' and codfab='+
        QuotedStr(dbeCodFab.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsProdcodfab.AsString:= '';
            f.Mensagem(false,'Codigo do Fabricante Ja esta Gravado!');
        end;
      end;  
  end;

end;

procedure TfrmManuProdutos.DBEDESCRIExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if DBEDESCRI.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','produ',' and descri='+
        QuotedStr(DBEDESCRI.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsProddescri.AsString:= '';
            f.Mensagem(false,'Descrição Ja esta Gravado!');
        end;
      end;  
  end;

end;

procedure TfrmManuProdutos.rxcbceMargemLucroExit(Sender: TObject);
begin
    rxcbcePrVenda.Value := ((rxcbcePrCusto.Value*rxcbceMargemLucro.Value)/100)+rxcbcePrCusto.Value;
end;

procedure TfrmManuProdutos.rxcbcePrVendaExit(Sender: TObject);
begin
  rxcbceMargemLucro.Value := ((rxcbcePrVenda.Value*100)/rxcbcePrCusto.Value)-100;

end;

procedure TfrmManuProdutos.DataSourceStateChange(Sender: TObject);
begin
  inherited;
  if DataSource.State in [dsInsert] then
  begin
      rxcbceEstAtual.Enabled := true;
      dbcbbxTipoProduto.Enabled := true;
  end else
  begin
      rxcbceEstAtual.Enabled := false;
      dbcbbxTipoProduto.Enabled := false;
  end;
end;

procedure TfrmManuProdutos.dbcbTipoProdutoExit(Sender: TObject);
begin
  verificaTipoProduto;
end;

procedure TfrmManuProdutos.verificaTipoProduto;
begin
  if dbcbbxTipoProduto.Text = 'SERVIÇO' then
  begin
     dbcbControleGrade.Checked := false;
     dbcbControleGrade.Enabled := false;
     rxcbceEstAtual.Enabled := false;
     dbeCodFab.Enabled := false;
     dbeRefe.Enabled := false;
     rxdbceEstMin.Enabled := false;
     dbcbbx_classqtoaorigem.Enabled := false;
     dbcbbx_situacaotributaria.Enabled := false;
  end else
  begin
     dbcbControleGrade.Enabled := true;
     if DataSource.State in [dsInsert] then
     begin
       rxcbceEstAtual.Enabled := true;
     end;  
     dbeCodFab.Enabled := true;
     dbeRefe.Enabled := true;
     rxdbceEstMin.Enabled := true;
     dbcbbx_classqtoaorigem.Enabled := true;
     dbcbbx_situacaotributaria.Enabled := true;
  end;
end;

procedure TfrmManuProdutos.tbPrimeiroClick(Sender: TObject);
begin
  inherited;
  verificaTipoProduto;
end;

procedure TfrmManuProdutos.tbAnteriorClick(Sender: TObject);
begin
  inherited;
  verificaTipoProduto;
end;

procedure TfrmManuProdutos.tbProximoClick(Sender: TObject);
begin
  inherited;
  verificaTipoProduto;
end;

procedure TfrmManuProdutos.tbUltimoClick(Sender: TObject);
begin
  inherited;
  verificaTipoProduto;
end;

procedure TfrmManuProdutos.dbcbbxTipoProdutoExit(Sender: TObject);
begin
  verificaTipoProduto;
end;

end.
