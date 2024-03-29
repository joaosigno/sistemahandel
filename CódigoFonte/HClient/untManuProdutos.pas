unit untManuProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin,untDeclaracoes,
  StdCtrls, Mask, DBCtrls, ToolEdit, RXDBCtrl, CurrEdit, wwdblook, Wwdbdlg,
  DBClient, SQL, Grids, DBGrids;

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
    dbdeVemnc: TDBDateEdit;
    Label27: TLabel;
    Label28: TLabel;
    dbeCodForn: TDBEdit;
    dblcbFornecedor: TDBLookupComboBox;
    Label29: TLabel;
    pesquisagrade: TwwDBLookupComboDlg;
    tsGrade: TTabSheet;
    gridDependentes: TDBGrid;
    dsSequencial: TDataSource;
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
    procedure carregaOpcaoes;
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure dbcbbxTipoProdutoExit(Sender: TObject);
    procedure dbcbControleGradeExit(Sender: TObject);
    procedure dbeCodFornExit(Sender: TObject);
    procedure dbcbControleGradeClick(Sender: TObject);
    procedure pesquisagradeExit(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure dbcbbxTipoProdutoChange(Sender: TObject);
    procedure pesquisagradeKeyPress(Sender: TObject; var Key: Char);
    procedure pesquisagradeEnter(Sender: TObject);
    procedure pesquisagradeChange(Sender: TObject);
    procedure gridDependentesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure atualizaGrade();
    procedure tbExcluirClick(Sender: TObject);
  private
   F: TFuncoes;
   SQL : TSQL;
  function verificaDadosAntesGravar():Boolean;
  procedure verificaInsercao();
    { Private declarations }
  public
  MudouTipodeControle: String;
  codigograde : string;
    { Public declarations }
  end;

var
  frmManuProdutos: TfrmManuProdutos;

implementation

uses untDM, untPrincipal, untSequenciasProdutos;

{$R *.dfm}

{ TfrmManuProdutos }

function TfrmManuProdutos.verificaDadosAntesGravar: Boolean;
begin
  if DBEDESCRI.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descri��o!');
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
      f.Mensagem(false,'N�o � poss�vel gravar Produto Com Pre�o de Custo Menor que (0)!');
      result:= false;
   end else result:=true;
   if rxcbcePrVenda.Value<0 then
   begin
      f.Mensagem(false,'N�o � poss�vel gravar Produto Com Pre�o de Venda Menor que (0)!');
      result:= false;
   end else result:=true;
   if dm.cdsProdpreven.IsNull then
   begin
      f.Mensagem(false,'Preencha Pre�o de Venda!');
      result:= false;
   end else result:=true;
   if (dbcbControleGrade.Checked) and (pesquisagrade.Text='') then
   begin
      f.Mensagem(false,'Preencha C�digo da Grade!');
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
//  carregaOpcaoes;
end;

procedure TfrmManuProdutos.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
  atualizaGrade;
end;

procedure TfrmManuProdutos.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  begin
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsProdcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdprod','produ');
  end;
  if (MudouTipodeControle = 'S') then
  begin
    case MessageDlg('Se o tipo de controle for alterado os dados da Grade existentes para este produto ser�o perdidos!' + #13 + 'Deseja continuar?', mtConfirmation, [mbyes,mbno], 0) of
      mryes:
      begin
        dm.cdsSequenciais.First;
        while not dm.cdsSequenciais.Eof do
        begin
          dm.cdsSequenciais.Delete;
        end;
        dm.cdsSequenciais.ApplyUpdates(0);
        if (dm.cdsProdestatu.value > 0) and (dbcbControleGrade.Checked) then
        begin
          frmSequenciaisProdutos := TfrmSequenciaisProdutos.create(Application);
          if dbcbControleGrade.Checked then
          begin
            frmSequenciaisProdutos.tipoform := 1;
          end;
          if frmSequenciaisProdutos.showmodal = mrcancel then abort;
        end;
      end;
    end;
  end;
  inherited;
  atualizaGrade;
  end;  
end;

procedure TfrmManuProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dm.cdsGradePro.Close;
  dm.cdsSequenciais.Close;
  ManuDAO.Free;
end;

procedure TfrmManuProdutos.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsProd);
  inherited;
  DataSource.DataSet := dm.cdsProd;
  dm.cdsGradePro.Open;
  atualizaGrade;
  dm.cdsSequenciais.Open;
  pesquisagrade.LookupTable := dm.cdsGradePro;
  MudouTipodeControle := 'N';
  ManuDAO.SQL.executaSQlPorEmp(dm.cdsMcPro,'*','mcpro','');
  ManuDAO.SQL.executaSQlPorEmp(dm.cdsFor,'*','forne','');
  ManuDAO.SQL.executaSQlPorEmp(dm.cdsGRPro,'*','grpro','');
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
          f.Mensagem(false,'Marca N�o Existe!');
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
          f.Mensagem(false,'Grupo N�o Existe!');
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
            f.Mensagem(false,'Descri��o Ja esta Gravado!');
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
{  if DataSource.State in [dsInsert] then
  begin
      rxcbceEstAtual.Enabled := true;
      dbcbbxTipoProduto.Enabled := true;
  end else
  begin
      rxcbceEstAtual.Enabled := false;
      dbcbbxTipoProduto.Enabled := false;
  end;}
  carregaOpcaoes;
end;

procedure TfrmManuProdutos.dbcbTipoProdutoExit(Sender: TObject);
begin
  carregaOpcaoes;
end;

procedure TfrmManuProdutos.carregaOpcaoes;
begin
  if dbcbbxTipoProduto.Text = 'PRODUTO' then
  begin
     dbcbControleGrade.Enabled := true;
     if DataSource.State in [dsInsert] then
     begin
     rxcbceEstAtual.Enabled := true;
     end else rxcbceEstAtual.Enabled := false;
     dbeCodFab.Enabled := true;
     rxdbceEstMin.Enabled := true;
     dbcbbx_classqtoaorigem.Enabled := true;
     dbcbbx_situacaotributaria.Enabled := true;
     if dbcbControleGrade.Checked then
      begin
        pesquisagrade.Enabled := true;
      end else
      begin
        pesquisagrade.Enabled := false;
      end;
   end else
   begin
     dbcbControleGrade.Enabled := false;
     pesquisagrade.Enabled := false;
     rxcbceEstAtual.Enabled := false;
     dbeCodFab.Enabled := false;
     rxdbceEstMin.Enabled := false;
     dbcbbx_classqtoaorigem.Enabled := false;
     dbcbbx_situacaotributaria.Enabled := false;
   end;
end;

procedure TfrmManuProdutos.tbPrimeiroClick(Sender: TObject);
begin
  inherited;
  carregaOpcaoes;
  atualizaGrade;
end;

procedure TfrmManuProdutos.tbAnteriorClick(Sender: TObject);
begin
  inherited;
  carregaOpcaoes;
  atualizaGrade;
end;

procedure TfrmManuProdutos.tbProximoClick(Sender: TObject);
begin
  inherited;
  carregaOpcaoes;
  atualizaGrade;
end;

procedure TfrmManuProdutos.tbUltimoClick(Sender: TObject);
begin
  inherited;
  carregaOpcaoes;
  atualizaGrade;
end;

procedure TfrmManuProdutos.dbcbbxTipoProdutoExit(Sender: TObject);
begin
//  carregaOpcaoes;
end;

procedure TfrmManuProdutos.dbcbControleGradeExit(Sender: TObject);
begin
{  if dbcbControleGrade.Checked then
  begin
      dbcbbxTipoProduto.Enabled := false;
      rxcbceEstAtual.Enabled := false;
  end else
  begin
    pgProdutos.Pages[2].TabVisible := false;
    dbcbbxTipoProduto.Enabled := true;
    rxcbceEstAtual.Enabled := true;
  end;}
end;

procedure TfrmManuProdutos.dbeCodFornExit(Sender: TObject);
begin
  if dbeCodForn.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','forne','and cdforn='+
      QuotedStr(dbeCodForn.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsProdcdforn.AsString:= '';
          f.Mensagem(false,'Fornecedor N�o Existe!');
      end;
    end;

end;

procedure TfrmManuProdutos.dbcbControleGradeClick(Sender: TObject);
begin
{  if dbcbControleGrade.Checked then
     pesquisagrade.Enabled := true
     else pesquisagrade.Enabled := false;}
     carregaOpcaoes;
     MudouTipodeControle := 'S';
end;

procedure TfrmManuProdutos.pesquisagradeExit(Sender: TObject);
var codigograde2:string;
begin
  if pesquisagrade.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','gdpro','and cdgrad='+
      QuotedStr(pesquisagrade.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsProdcdgrad.AsString:= '';
          f.Mensagem(false,'Grade N�o Existe!');
      end;
    end;
    codigograde2 := pesquisagrade.Text;
    if codigograde2 <> codigograde then
      MudouTipodeControle := 'S';
end;

procedure TfrmManuProdutos.tbCancelarClick(Sender: TObject);
begin
  inherited;
  carregaOpcaoes;
  atualizaGrade;
end;

procedure TfrmManuProdutos.dbcbbxTipoProdutoChange(Sender: TObject);
begin
  carregaOpcaoes;
end;

procedure TfrmManuProdutos.pesquisagradeKeyPress(Sender: TObject;
  var Key: Char);
begin
//   MudouTipodeControle := 'S';
end;

procedure TfrmManuProdutos.pesquisagradeEnter(Sender: TObject);
begin
    codigograde := pesquisagrade.Text;
end;

procedure TfrmManuProdutos.pesquisagradeChange(Sender: TObject);
var codigograde2:string;
begin
  codigograde2 := pesquisagrade.Text;
    if codigograde2 <> codigograde then
      MudouTipodeControle := 'S';

end;

procedure TfrmManuProdutos.gridDependentesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
   TDbGrid(Sender).Canvas.font.Color:= clblack; //aqui � definida a cor da fonte sem a selecao
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:=$000080FF; //aqui � definida a cor de sele��o
      TDbGrid(Sender).Canvas.font.Color:= clwindow; //aqui � definida a cor da fonte com a selecao
      TDbGrid(Sender).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [FSBOLD]; //aqui � definida a a fonte negrito com a selecao
      FillRect(Rect);
    end;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmManuProdutos.atualizaGrade;
begin
  sql.executaSQlPorEmp(dm.cdsSequenciais,'*','sqpro',' and cdprod='+IntToStr(dm.cdsProdcdprod.AsInteger));
end;

procedure TfrmManuProdutos.tbExcluirClick(Sender: TObject);
begin
  inherited;
  atualizaGrade
end;

end.
