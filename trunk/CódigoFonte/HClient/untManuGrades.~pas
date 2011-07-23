unit untManuGrades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, Grids, ExtCtrls,
  Menus, DBGrids, StdCtrls, Mask, DBCtrls, wwdblook, Wwdbdlg, untDeclaracoes,
  DBClient, ToolEdit, RXDBCtrl;

type
  TfrmManuGrades = class(TfrmManutencao)
    pgGrade: TPageControl;
    tsinicio: TTabSheet;
    dbgrd_Linha: TDBGrid;
    dbgrd_Coluna: TDBGrid;
    pm_coluna: TPopupMenu;
    Apagarcoluna1: TMenuItem;
    pm_linha: TPopupMenu;
    Apagarlinha1: TMenuItem;
    AdvancedPanel4: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    lbl_linha: TLabel;
    lbl_coluna: TLabel;
    AdvancedPanel5: TPanel;
    Label7: TLabel;
    strgrd_grade: TStringGrid;
    dbeCod: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbeDescri: TDBEdit;
    pesquisa: TwwDBLookupComboDlg;
    Label5: TLabel;
    dbeDescLinha: TDBEdit;
    Label3: TLabel;
    dbeDescCol: TDBEdit;
    dsGradeLinha: TDataSource;
    dsGradeColuna: TDataSource;
    cdsColGrade: TClientDataSet;
    cdsColGradecdlcgr: TIntegerField;
    cdsColGradedtcada: TDateField;
    cdsColGradecdempr: TIntegerField;
    cdsColGradecdgrad: TIntegerField;
    cdsColGradedescri: TStringField;
    cdsColGradelincol: TStringField;
    cdsLinhGrade: TClientDataSet;
    cdsLinhGradecdlcgr: TIntegerField;
    cdsLinhGradedtcada: TDateField;
    cdsLinhGradecdempr: TIntegerField;
    cdsLinhGradecdgrad: TIntegerField;
    cdsLinhGradedescri: TStringField;
    cdsLinhGradelincol: TStringField;
    dbdateedtdatacadastro: TDBDateEdit;
    Label4: TLabel;
    cdsGDProd: TClientDataSet;
    cdsGDProdcdgrad: TIntegerField;
    cdsGDProddescri: TStringField;
    cdsGDProddeslin: TStringField;
    cdsGDProddescol: TStringField;
    cdsGDProddtcada: TDateField;
    cdsGDProdcdempr: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure verGrade();
    procedure carregaOpcoes();
    procedure tbCancelarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeDescColKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDescLinhaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Apagarcoluna1Click(Sender: TObject);
    procedure Apagarlinha1Click(Sender: TObject);
    procedure dbgrd_LinhaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgrd_ColunaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbPrimeiroClick(Sender: TObject);
    procedure pesquisaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cdsLinhGradeBeforePost(DataSet: TDataSet);
    procedure cdsColGradeBeforePost(DataSet: TDataSet);
    procedure cdsLinhGradeAfterPost(DataSet: TDataSet);
    procedure cdsColGradeAfterPost(DataSet: TDataSet);
    procedure cdsLinhGradeAfterInsert(DataSet: TDataSet);
    procedure cdsLinhGradeAfterDelete(DataSet: TDataSet);
    procedure cdsColGradeAfterDelete(DataSet: TDataSet);
    procedure cdsColGradeAfterEdit(DataSet: TDataSet);
    procedure cdsLinhGradeAfterEdit(DataSet: TDataSet);
    procedure cdsColGradeAfterInsert(DataSet: TDataSet);
    procedure cdsGDProdAfterCancel(DataSet: TDataSet);
    procedure cdsGDProdAfterDelete(DataSet: TDataSet);
    procedure cdsGDProdAfterInsert(DataSet: TDataSet);
    procedure cdsGDProdAfterPost(DataSet: TDataSet);
    procedure cdsGDProdBeforeDelete(DataSet: TDataSet);
    procedure cdsGDProdBeforePost(DataSet: TDataSet);
  private
  DAOLinha   : TManutencaoDAO;
  DAOColunas : TManutencaoDAO;
  F : TFuncoes;
    { Private declarations }
  public
  procedure verificaInsercao();
  function verificaDadosAntesGravar():Boolean;
  procedure selecionaLinhasColunas();
    { Public declarations }
  end;

var
  frmManuGrades: TfrmManuGrades;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

{ TfrmManuGrades }

function TfrmManuGrades.verificaDadosAntesGravar: Boolean;
begin
   if dbeDescri.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição!');
      result:= false;
   end else result:=true;
   if dbeDescLinha.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição de Linha!');
      result:= false;
   end else result:=true;
   if dbeDescCol.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição de Coluna!');
      result:= false;
   end else result:=true;
  if cdsLinhGrade.IsEmpty then
   begin
      f.Mensagem(false,'Preencha Linhas da Tabela!');
      result:= false;
   end else result:=true;
   if cdsColGrade.IsEmpty then
   begin
      f.Mensagem(false,'Preencha Colunas da Tabela!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuGrades.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgGrade,0);
     dbeDescri.SetFocus;
  end;
  carregaopcoes;
  vergrade;
end;

procedure TfrmManuGrades.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(cdsGDProd);
  inherited;
  DataSource.DataSet := cdsGDProd;
  DAOLinha  := TManutencaoDAO.Create(cdsLinhGradE);
  dsGradeLinha.DataSet := cdsLinhGrade;
  DAOColunas := TManutencaoDAO.Create(cdsColGrade);
  dsGradeColuna.DataSet := cdsColGrade;

  pesquisa.LookupTable := cdsGDProd;


   ManuDAO.SQL.executaSQlPorEmp(cdsGDProd,'*','gdpro','');

  selecionaLinhasColunas;
end;

procedure TfrmManuGrades.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  cdsGDProdcdgrad.AsInteger := StrToInt(ManuDAO.SQL.proxCod(dm.cdsAux,'cdgrad','gdpro'));
  cdsGDProdcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;

  verificaInsercao;
  carregaOpcoes;
  verGrade;
  selecionaLinhasColunas;
end;

procedure TfrmManuGrades.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
  carregaopcoes;
  vergrade;
end;

procedure TfrmManuGrades.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DAOLinha.cancelar;
  DAOColunas.cancelar;
  
  inherited;

  ManuDAO.Free;
  DAOLinha.Free;
  DAOColunas.Free;
end;

procedure TfrmManuGrades.verGrade;
var
  i: integer;
begin
  if cdsColGrade.IsEmpty then
  begin
    strgrd_grade.ColCount := 2;
    strgrd_grade.Cols[1].Text := '';
  end else strgrd_grade.ColCount := cdsColGrade.RecordCount + 1;
  if cdsLinhGrade.IsEmpty then
  begin
    strgrd_grade.RowCount := 2;
    strgrd_grade.Rows[1].Text := '';
  end else strgrd_grade.RowCount := cdsLinhGrade.RecordCount + 1;
  cdsLinhGrade.First;
  cdsColGrade.First;
  i:= 1;
  while not cdsLinhGrade.Eof do
  begin
    strgrd_grade.Cols[i].Text := dbgrd_linha.Fields[0].Text;
    I := i + 1;
    cdsLinhGrade.Next;
  end;

  i:= 1;
  while not cdsColGrade.Eof do
  begin
    strgrd_grade.Cols[i].Text := dbgrd_coluna.Fields[0].Text;
    I := i + 1;
    cdsColGrade.Next;
  end;

end;

procedure TfrmManuGrades.carregaOpcoes;
begin
  Screen.Cursor := crSQLWait;
  if not cdsGDProd.IsEmpty then
  begin
    dbgrd_linha.Columns.Items[0].Title.caption := cdsGDProddeslin.Text;
    lbl_linha.caption := cdsGDProddeslin.Text;
    dbgrd_coluna.Columns.Items[0].Title.caption := cdsGDProddescol.Text;
    lbl_coluna.caption := cdsGDProddescol.Text;
    if cdsGDProddeslin.Text = '' then dbgrd_linha.Columns.Items[0].Title.caption := 'DESCRIÇÃO';
    if cdsGDProddescol.Text = '' then dbgrd_coluna.Columns.Items[0].Title.caption := 'DESCRIÇÃO';
  end else
  begin
    dbgrd_linha.Columns.Items[0].Title.caption := 'DESCRIÇÃO';
    lbl_linha.caption := 'DESCRIÇÃO';
    dbgrd_coluna.Columns.Items[0].Title.caption := 'DESCRIÇÃO';
    lbl_coluna.caption := 'DESCRIÇÃO';
  end;
  Screen.Cursor := crDefault;
end;

procedure TfrmManuGrades.tbCancelarClick(Sender: TObject);
begin
  carregaopcoes;
  vergrade;
  inherited;

end;

procedure TfrmManuGrades.tbExcluirClick(Sender: TObject);
begin
  carregaopcoes;
  vergrade;

  inherited;

    carregaopcoes;
  vergrade;
end;

procedure TfrmManuGrades.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  inherited;
  verGrade;
  carregaOpcoes;
  selecionaLinhasColunas;
end;

procedure TfrmManuGrades.dbeDescColKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  dbgrd_coluna.Columns.Items[0].Title.caption := dbeDescCol.Text;
  lbl_coluna.caption := dbeDescCol.Text;
end;

procedure TfrmManuGrades.dbeDescLinhaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  dbgrd_linha.Columns.Items[0].Title.caption := dbeDescLinha.Text;
  lbl_linha.caption := dbeDescLinha.Text;
end;

procedure TfrmManuGrades.Apagarcoluna1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar essa coluna?', mtConfirmation ,[mbYes,mbNo], 0) = mryes then
  begin
     DAOColunas.excluir;
     vergrade;
  end;

end;

procedure TfrmManuGrades.Apagarlinha1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar essa linha?', mtConfirmation ,[mbYes,mbNo], 0) = mryes then
  begin
    DAOLinha.excluir;
    vergrade;
  end;

end;

procedure TfrmManuGrades.dbgrd_LinhaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TfrmManuGrades.dbgrd_ColunaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
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

procedure TfrmManuGrades.tbProximoClick(Sender: TObject);
begin
  inherited;
  selecionaLinhasColunas;
  carregaOpcoes;
  verGrade;
end;

procedure TfrmManuGrades.tbUltimoClick(Sender: TObject);
begin
  inherited;
  selecionaLinhasColunas;
  carregaOpcoes;
  verGrade;
end;

procedure TfrmManuGrades.tbAnteriorClick(Sender: TObject);
begin
  inherited;
  selecionaLinhasColunas;
  carregaOpcoes;
  verGrade;
end;

procedure TfrmManuGrades.tbPrimeiroClick(Sender: TObject);
begin
  inherited;
  selecionaLinhasColunas;
  carregaOpcoes;
  verGrade;
end;

procedure TfrmManuGrades.selecionaLinhasColunas;
begin
   DAOLinha.SQL.executaSQlPorEmp(cdsLinhGrade,'*','lcgra',' and lincol=''L'' and cdgrad='+
                     IntToStr(cdsGDProdcdgrad.AsInteger));
  DAOColunas.SQL.executaSQlPorEmp(cdsColGrade,'*','lcgra',' and lincol=''C'' and cdgrad='+
                    IntToStr(cdsGDProdcdgrad.AsInteger));
end;

procedure TfrmManuGrades.pesquisaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
//  selecionaLinhasColunas;
  carregaOpcoes;
  verGrade;
end;

procedure TfrmManuGrades.cdsColGradeBeforePost(DataSet: TDataSet);
begin
     cdsColGradecdlcgr.AsInteger := StrToInt(DAOColunas.SQL.proxCod(dm.cdsAux,'cdlcgr','lcgra'));
     cdsColGradecdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     cdsColGradecdgrad.AsInteger := cdsGDProdcdgrad.AsInteger;
     cdsColGradelincol.AsString := 'C';

   if cdsColGradedescri.AsString = '' then
   begin
      DAOColunas.cancelar;
   end else

end;

procedure TfrmManuGrades.cdsLinhGradeAfterPost(DataSet: TDataSet);
begin
//   carregaOpcoes;
   DAOLinha.gravar;
   verGrade;
//   selecionaLinhasColunas;
end;

procedure TfrmManuGrades.cdsColGradeAfterPost(DataSet: TDataSet);
begin

//   carregaOpcoes;
   DAOColunas.gravar;
   verGrade;
//   selecionaLinhasColunas;
end;

procedure TfrmManuGrades.cdsLinhGradeBeforePost(DataSet: TDataSet);
begin
     cdsLinhGradecdlcgr.AsInteger := StrToInt(DAOColunas.SQL.proxCod(dm.cdsAux,'cdlcgr','lcgra'));
     cdsLinhGradecdgrad.AsInteger := StrToInt(dbeCod.Text);
     cdsLinhGradecdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     cdsLinhGradelincol.AsString := 'L';

   if cdsLinhGradedescri.AsString = '' then
   begin
      DAOLinha.cancelar;
   end else
     
end;

procedure TfrmManuGrades.cdsLinhGradeAfterInsert(DataSet: TDataSet);
begin
  cdsLinhGradecdlcgr.Value := StrToInt(DAOLinha.SQL.proxCod(dm.cdsAux,'cdlcgr','lcgra'));
  cdsLinhGradecdempr.Value := frmprincipal.Configuracao.EmpresaCodigo;
  cdsLinhGradecdgrad.Value := cdsGDProdcdgrad.Value;
  cdsLinhGradelincol.Value := 'L';
  cdsGDProd.Edit;
end;

procedure TfrmManuGrades.cdsLinhGradeAfterDelete(DataSet: TDataSet);
begin
   cdsGDProd.Edit;
end;

procedure TfrmManuGrades.cdsColGradeAfterDelete(DataSet: TDataSet);
begin
   cdsGDProd.Edit;
end;

procedure TfrmManuGrades.cdsColGradeAfterEdit(DataSet: TDataSet);
begin
   cdsGDProd.Edit;
end;

procedure TfrmManuGrades.cdsLinhGradeAfterEdit(DataSet: TDataSet);
begin
   cdsGDProd.Edit;
end;

procedure TfrmManuGrades.cdsColGradeAfterInsert(DataSet: TDataSet);
begin
  cdsColGradecdlcgr.Value := StrToInt(DAOLinha.SQL.proxCod(dm.cdsAux,'cdlcgr','lcgra'));
  cdsColGradecdempr.Value := frmprincipal.Configuracao.EmpresaCodigo;
  cdsColGradecdgrad.Value := cdsGDProdcdgrad.Value;
  cdsColGradelincol.Value := 'C';
  cdsGDProd.Edit;
end;

procedure TfrmManuGrades.cdsGDProdAfterCancel(DataSet: TDataSet);
begin
  carregaopcoes;
  vergrade;
end;

procedure TfrmManuGrades.cdsGDProdAfterDelete(DataSet: TDataSet);
begin
  try
    cdsColGrade.ApplyUpdates(0);
    cdsLinhGrade.ApplyUpdates(0);
    cdsColGrade.ApplyUpdates(0);

  except

  end;
  carregaopcoes;
  vergrade;

end;

procedure TfrmManuGrades.cdsGDProdAfterInsert(DataSet: TDataSet);
begin
  cdsGDProdcdgrad.value := StrToInt(ManuDAO.SQL.proxCod(dm.cdsAux,'cdgrad','gdpro'));
  cdsGDProdcdempr.Value := frmprincipal.Configuracao.EmpresaCodigo;
  carregaopcoes;
  vergrade;
  dbeDescri.SetFocus; 
end;

procedure TfrmManuGrades.cdsGDProdAfterPost(DataSet: TDataSet);
begin
  try
    cdsGDProd.ApplyUpdates(0);
    cdsLinhGrade.ApplyUpdates(0);
    cdsColGrade.ApplyUpdates(0);
  except

  end;
  carregaopcoes;
end;

procedure TfrmManuGrades.cdsGDProdBeforeDelete(DataSet: TDataSet);
begin
  carregaopcoes;
  vergrade;
end;

procedure TfrmManuGrades.cdsGDProdBeforePost(DataSet: TDataSet);
begin
  DAOLinha.gravar;
  DAOColunas.gravar;

end;

end.
