unit untSequenciasProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, DB, SQL, DBClient, DAO;

type
  TfrmSequenciaisProdutos = class(TForm)
    AdvancedPanel2: TPanel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    DR1: TLabel;
    DR2: TLabel;
    DR3: TLabel;
    lbl_qtdinicial: TLabel;
    lbl_qtdatual: TLabel;
    lbl_qtdrestante: TLabel;
    AdvancedPanel3: TPanel;
    Label48: TLabel;
    gridDependentes: TDBGrid;
    dsSequenciais: TDataSource;
    btn_ok: TButton;
    btn_cancelar: TButton;
    cdsSequenciais: TClientDataSet;
    cdsSequenciaiscdsequ: TIntegerField;
    cdsSequenciaiscdempr: TIntegerField;
    cdsSequenciaisdtcada: TDateField;
    cdsSequenciaisultcom: TDateField;
    cdsSequenciaisultven: TDateField;
    cdsSequenciaiscdprod: TIntegerField;
    cdsSequenciaisdescri: TStringField;
    cdsSequenciaisprecus: TFloatField;
    cdsSequenciaispreven: TFloatField;
    cdsSequenciaisvencim: TDateField;
    cdsSequenciaisquantTotal: TFloatField;
    cdsSequenciaissomaauxiliar: TAggregateField;
    cdsSequenciaisestatu: TFloatField;
    cdsSequenciaisauxili: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsSequenciaisCalcFields(DataSet: TDataSet);
    procedure cdsSequenciaisBeforeInsert(DataSet: TDataSet);
    procedure cdsSequenciaisAfterPost(DataSet: TDataSet);
    procedure btn_okClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure gridDependentesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  SQL : TSQL;
  DAOSequencial : TDao;
    { Private declarations }
  public
  tipoform: integer;
    { Public declarations }
  end;

var
  frmSequenciaisProdutos: TfrmSequenciaisProdutos;
  InsereMaisSequencial: string;

implementation

uses untDM, untPrincipal, untManuProdutos;

{$R *.dfm}

procedure TfrmSequenciaisProdutos.FormShow(Sender: TObject);
begin
    if tipoform = 1 then
    begin
    lbl_qtdinicial.caption := FormatFloat('#,##0.00',dm.cdsProdestatu.value);
    lbl_qtdrestante.caption := FormatFloat('#,##0.00',dm.cdsProdestatu.Value);
    sql.executaSQlPorEmp(dm.cdsSequenciais,'*','sqpro',' and cdprod='+IntToStr(dm.cdsProdcdprod.Value));
    cdsSequenciais.Open;
    sql.executaSQlPorEmp(dm.cdsLinhaGrade,'*','lcgra',' and lincol=''L'' and cdgrad='+IntToStr(dm.cdsProdcdgrad.Value));
    dm.cdsLinhaGrade.Open;
    sql.executaSQlPorEmp(dm.cdsColunaGrade,'*','lcgra',' and lincol=''C'' and cdgrad='+IntToStr(dm.cdsProdcdgrad.Value));
    dm.cdsColunaGrade.Open;
    while not dm.cdsLinhaGrade.Eof do
    begin
      while not dm.cdsColunaGrade.Eof do
      begin
        cdsSequenciais.Append;
        cdsSequenciaiscdsequ.value := StrToInt(SQL.proxCod(dm.cdsAux,'cdsequ','sqpro'));
        cdsSequenciaiscdempr.Value := frmprincipal.Configuracao.EmpresaCodigo;
        cdsSequenciaiscdprod.Value := dm.cdsProdcdprod.Value;
        cdsSequenciaisdescri.Value := dm.cdsLinhaGradedescri.Value + ' - ' + dm.cdsColunaGradedescri.Value;
        cdsSequenciaisprecus.Value := dm.cdsProdprecus.Value;
        cdsSequenciaispreven.Value := dm.cdsProdpreven.Value;
        cdsSequenciaisestatu.Value := 0;
        cdsSequenciaisauxili.Value := 0;
        cdsSequenciais.Post;
        dm.cdsColunaGrade.Next;
      end;
      dm.cdsColunaGrade.First;
      dm.cdsLinhaGrade.Next;
    end;
    InsereMaisSequencial := 'N';
    cdsSequenciaiscdsequ.ReadOnly := true;
    cdsSequenciaisdescri.ReadOnly := true;
    cdsSequenciaissomaauxiliar.ReadOnly := true;
    cdsSequenciaisquantTotal.ReadOnly := true;
    cdsSequenciaisestatu.ReadOnly := true;
    end;
end;

procedure TfrmSequenciaisProdutos.FormCreate(Sender: TObject);
begin
  InsereMaisSequencial := 'S';
end;

procedure TfrmSequenciaisProdutos.cdsSequenciaisCalcFields(
  DataSet: TDataSet);
begin
  if (Tipoform = 1) then
    cdsSequenciaisquantTotal.Value := cdsSequenciaisquantTotal.Value + cdsSequenciaisauxili.value
end;

procedure TfrmSequenciaisProdutos.cdsSequenciaisBeforeInsert(
  DataSet: TDataSet);
begin
  if InsereMaisSequencial = 'N' then abort;
end;

procedure TfrmSequenciaisProdutos.cdsSequenciaisAfterPost(
  DataSet: TDataSet);
begin
  if (tipoform = 1) then
  begin
//    lbl_qtdatual.caption := FormatFloat('#,##0.00',cdsSequenciaissomaauxiliar.value);
//    lbl_qtdrestante.caption := FormatFloat('#,##0.00',strtofloat(lbl_qtdinicial.caption) - cdsSequenciaissomaauxiliar.value);
  end;
end;

procedure TfrmSequenciaisProdutos.btn_okClick(Sender: TObject);
begin
    if tipoform = 1 then
    begin
    cdsSequenciais.Next;
    if strtofloat(lbl_qtdrestante.caption) <> 0 then
    begin
      MessageDlg('A quantidade do estoque do sequencial tem que ser igual ao do produto!', mtError, [mbOK], 0);
      abort;
    end else
    begin
      cdsSequenciais.first;
      while not cdsSequenciais.eof do
      begin
        cdsSequenciais.edit;
        cdsSequenciaisestatu.value := cdsSequenciaisauxili.value;
        cdsSequenciais.post;
        cdsSequenciais.next;
      end;
      frmManuProdutos.cdssequencial.Close;
      frmManuProdutos.cdssequencial.open;
      cdsSequenciais.ApplyUpdates(0);
      ModalResult := mrOK;
    end;
    end;
end;

procedure TfrmSequenciaisProdutos.btn_cancelarClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmSequenciaisProdutos.gridDependentesDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clblack; //aqui é definida a cor da fonte sem a selecao
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:=$000080FF; //aqui é definida a cor de seleção
      TDbGrid(Sender).Canvas.font.Color:= clwindow; //aqui é definida a cor da fonte com a selecao
      TDbGrid(Sender).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [FSBOLD]; //aqui é definida a a fonte negrito com a selecao
      FillRect(Rect);
    end;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmSequenciaisProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    cdsSequenciaiscdsequ.ReadOnly := false;
    cdsSequenciaisdescri.ReadOnly := false;
    cdsSequenciaissomaauxiliar.ReadOnly := false;
    cdsSequenciaisquantTotal.ReadOnly := false;
    cdsSequenciaisestatu.ReadOnly := false;
end;

end.
