unit untConferenciaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Wwdbdlg, ExtCtrls, DB, Grids, DBGrids,
  DBClient, untDeclaracoes, SQL, clipbrd;

type
  TfrmConferenciaEstoque = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pesquisaFornecedor: TwwDBLookupComboDlg;
    pesquisaMarca: TwwDBLookupComboDlg;
    pesquisaGrupo: TwwDBLookupComboDlg;
    lblgrupo: TLabel;
    lblMarca: TLabel;
    lblFornecedor: TLabel;
    Image1: TImage;
    lbl_titulo: TLabel;
    gridProdutos: TDBGrid;
    dsProd: TDataSource;
    cdsProdutos: TClientDataSet;
    cdsProdutoscdprod: TIntegerField;
    cdsProdutosdescri: TStringField;
    cdsProdutosestatu: TFloatField;
    cdsProdutoscodfab: TStringField;
    cdsProdutospreven: TFloatField;
    cdsProdutosContagem: TFloatField;
    btnVisualiza: TButton;
    btnAcertar: TButton;
    btnImprimir: TButton;
    btn_fechar: TButton;
    Label4: TLabel;
    cdsProdutosDiferenca: TFloatField;
    procedure pesquisaGrupoChange(Sender: TObject);
    procedure pesquisaMarcaChange(Sender: TObject);
    procedure pesquisaFornecedorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAcertarClick(Sender: TObject);
    procedure btnVisualizaClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure cdsProdutosCalcFields(DataSet: TDataSet);
    procedure gridProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsProdutosBeforeInsert(DataSet: TDataSet);
    procedure cdsProdutosBeforeDelete(DataSet: TDataSet);
  private
  F : TFuncoes;
  SQL : TSQL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConferenciaEstoque: TfrmConferenciaEstoque;
  CalculaAutomatico: Boolean;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmConferenciaEstoque.pesquisaGrupoChange(Sender: TObject);
begin
     lblgrupo.Caption := dm.cdsGRProdescri.AsString;
end;

procedure TfrmConferenciaEstoque.pesquisaMarcaChange(Sender: TObject);
begin
     lblMarca.Caption := dm.cdsMcProdescri.AsString;
end;

procedure TfrmConferenciaEstoque.pesquisaFornecedorChange(Sender: TObject);
begin
  lblFornecedor.Caption := dm.cdsFornmfant.AsString;
end;

procedure TfrmConferenciaEstoque.FormCreate(Sender: TObject);
begin
  dsProd.DataSet := cdsProdutos;
  dm.cdsGRPro.Open;
  dm.cdsMcPro.Open;
  dm.cdsFor.Open;
  pesquisaGrupo.LookupTable := dm.cdsGRPro;
  pesquisaMarca.LookupTable := dm.cdsMcPro;
  pesquisaFornecedor.LookupTable := dm.cdsFor;
end;

procedure TfrmConferenciaEstoque.btnAcertarClick(Sender: TObject);
begin
  if MessageDlg('Deseja acertar o estoque dos produtos baseado nas quantidades digitadas no campo Contagem?', mtConfirmation, [mbyes,mbno], 0) = mryes then
  begin
    cdsProdutosestatu.ReadOnly := false;
    cdsProdutos.first;
    while not cdsProdutos.eof do
    begin
      cdsProdutos.edit;
      dm.HistPro(frmPrincipal.Configuracao.EmpresaCodigo,cdsProdutoscdprod.AsInteger,'Alterado pelo Usuário '+IntToStr(
          frmPrincipal.Configuracao.UsuarioCodigo)+'-'+frmPrincipal.Configuracao.UsuarioNome+'(Conferência de Estoque)',
        cdsProdutosDiferenca.AsFloat,cdsProdutosContagem.AsFloat);
      cdsProdutosestatu.value := cdsProdutosContagem.value;
      cdsProdutos.post;
      cdsProdutos.next;
    end;
    try
      cdsProdutos.ApplyUpdates(0);
      MessageDlg('O estoque foi atualizado com sucesso !!', mtInformation, [mbOK], 0);
    except

    end;
    cdsProdutosestatu.ReadOnly := true;
  end;
end;

procedure TfrmConferenciaEstoque.btnVisualizaClick(Sender: TObject);
var strsql : string;
begin
  CalculaAutomatico := true;
  
  strsql := 'select * from produ where cdempr='+IntToStr(frmPrincipal.Configuracao.EmpresaCodigo)+
      ' and tipopr<>''S''';

  if (pesquisaGrupo.Text <> '') then
    strsql := strsql +' and cdgrup='+QuotedStr(pesquisaGrupo.Text);
  if (pesquisaMarca.Text <> '') then
    strsql := strsql +' and cdmarc='+QuotedStr(pesquisaMarca.Text);
  if (pesquisaFornecedor.Text <> '') then
    strsql := strsql +' and cdforn='+QuotedStr(pesquisaFornecedor.Text);

    strsql := strsql + ' order by cdprod';

  sql.executaSql(cdsProdutos,strsql);

  if cdsProdutos.RecordCount >0 then
  begin
     btnAcertar.Enabled := true;
  end else btnAcertar.Enabled := false;

   CalculaAutomatico := false;
end;

procedure TfrmConferenciaEstoque.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConferenciaEstoque.cdsProdutosCalcFields(DataSet: TDataSet);
begin
  if CalculaAutomatico then cdsProdutosContagem.value := cdsProdutosestatu.value;
  cdsProdutosDiferenca.value := cdsProdutosContagem.value - cdsProdutosestatu.value;
end;

procedure TfrmConferenciaEstoque.gridProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDBGrid(Sender).Columns[5].Font.Color := clRed;
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

procedure TfrmConferenciaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.cdsGRPro.Close;
  dm.cdsMcPro.Close;
  dm.cdsFor.Close;
  cdsProdutos.Close;
end;

procedure TfrmConferenciaEstoque.cdsProdutosBeforeInsert(
  DataSet: TDataSet);
begin
    Abort;
end;

procedure TfrmConferenciaEstoque.cdsProdutosBeforeDelete(
  DataSet: TDataSet);
begin
    Abort;
end;

end.
