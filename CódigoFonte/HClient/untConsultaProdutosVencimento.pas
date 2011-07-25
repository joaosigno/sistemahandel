unit untConsultaProdutosVencimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Grids, DBGrids, ExtCtrls, DB, SQL, untDeclaracoes;

type
  TfrmConsultaProdutosVencimento = class(TForm)
    lbData: TLabel;
    edtDataInicial: TDateEdit;
    edtDataFinal: TDateEdit;
    lbDatas2: TLabel;
    gridDependentes: TDBGrid;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    btn_Fechar: TButton;
    btnPesquisar: TButton;
    dsPro: TDataSource;
    dsGrade: TDataSource;
    lbl_titulo: TLabel;
    Image1: TImage;
    procedure btn_FecharClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure gridDependentesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridDependentesDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  SQL : TSQL;
  F : TFuncoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaProdutosVencimento: TfrmConsultaProdutosVencimento;

implementation

uses untDM, untManuProdutos;

{$R *.dfm}

procedure TfrmConsultaProdutosVencimento.btn_FecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmConsultaProdutosVencimento.btnPesquisarClick(
  Sender: TObject);
begin
  if edtDataInicial.Text = '  -  -    ' then
    f.Mensagem(false,'Preencha Data Incial!') else
  if edtDataFinal.Text = '  -  -    ' then
    f.Mensagem(false,'Preencha Data Final!') else
     SQL.executaSQlPorEmp(dm.cdsProd,'*','produ',' and vencim>=to_date('+QuotedStr(edtDataInicial.Text)+
          ',''dd/mm/yyyy'') and vencim<=to_date('+QuotedStr(edtDataFinal.Text)+',''dd/mm/yyyy'') order by vencim');
end;

procedure TfrmConsultaProdutosVencimento.gridDependentesDrawColumnCell(
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

procedure TfrmConsultaProdutosVencimento.DBGrid1DrawColumnCell(
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

procedure TfrmConsultaProdutosVencimento.gridDependentesDblClick(
  Sender: TObject);
begin
  dm.cdsProd.Edit;
  frmManuProdutos := TfrmManuProdutos.Create(Application);
  frmManuProdutos.ShowModal;
  frmManuProdutos.Free;
end;

procedure TfrmConsultaProdutosVencimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.cdsProd.close;
end;

procedure TfrmConsultaProdutosVencimento.FormCreate(Sender: TObject);
begin
  dm.cdsProd.Close;
  dsPro.DataSet := dm.cdsProd;
end;

end.
