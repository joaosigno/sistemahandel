unit untManuAcertoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, ComCtrls, DB, ImgList, ToolWin, StdCtrls, Mask,
  DBCtrls, wwdblook, Wwdbdlg, ExtCtrls, ToolEdit, CurrEdit, RXDBCtrl, untDeclaracoes,
  Grids, DBGrids, SQL;

type
  TfrmManuAcertosEstoque = class(TfrmManutencao)
    pgAcertoEstoqu: TPageControl;
    tsInicio: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    dbeDescriPro: TDBEdit;
    pesquisa: TwwDBLookupComboDlg;
    Bevel2: TBevel;
    rxcbceEstAtual: TRxDBCalcEdit;
    rxcbceEstMinimo: TRxDBCalcEdit;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    rxdbceprvendaatual: TRxDBCalcEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    exceEstcorreto: TRxDBCalcEdit;
    rxceprcustocorreto: TRxDBCalcEdit;
    rxceprvendacorreto: TRxDBCalcEdit;
    rxdbceprcustoatual: TRxDBCalcEdit;
    gridAcertos: TDBGrid;
    dsGrade: TDataSource;
    lblGrade: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure pesquisaExit(Sender: TObject);
    procedure dbeDescriProExit(Sender: TObject);
    procedure pesquisaEnter(Sender: TObject);
    procedure dbeDescriProChange(Sender: TObject);
  private
    F : TFuncoes;
    SQL : TSQL;
    estAtu,PrVeAtu,PrCusAtu:real;
    procedure verificaInsercao;
    function verificaDadosAntesGravar:Boolean;
    procedure armazenaValores();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuAcertosEstoque: TfrmManuAcertosEstoque;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

{ TfrmManuAcertosEstoque }

procedure TfrmManuAcertosEstoque.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgAcertoEstoqu,0);
     dbeDescriPro.SetFocus;
  end;
end;

procedure TfrmManuAcertosEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
  ManuDAO.Free;
  dm.cdsSequenciaisdescri.ReadOnly := false;
  dm.cdsProd.Close;
  dm.cdsSequenciais.Close;
end;

procedure TfrmManuAcertosEstoque.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsProd);
  inherited;
  ManuDAO.SQL.executaSQlPorEmp(dm.cdsProd,'*','produ',' and tipopr<>''S''');
  dm.cdsProd.Close;
  DataSource.DataSet := dm.cdsProd;
  dsGrade.DataSet := dm.cdsSequenciais;
  pesquisa.LookupTable := dm.cdsProd;
  dm.cdsSequenciaisdescri.ReadOnly := true;
end;

procedure TfrmManuAcertosEstoque.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
  armazenaValores;
end;

procedure TfrmManuAcertosEstoque.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
    begin
      if (dm.cdsProdtipcon.Value='G') and (dm.cdsSequenciaisSOMAQUANTIDADE.value <> dm.cdsProdestatu.Value) then
      begin
             MessageDlg('O estoque da grade tem que ser igual ao do produto!', mtError, [mbOK], 0);
             abort;
      end
      else begin
        dm.HistPro(frmPrincipal.Configuracao.EmpresaCodigo,dm.cdsProdcdprod.AsInteger,
                 'Alterado pelo Usuário '+IntToStr(frmPrincipal.Configuracao.UsuarioCodigo)+
                  '-'+frmPrincipal.Configuracao.UsuarioNome+'(Acertos do Estoque)',
                  exceEstcorreto.Value-estAtu,exceEstcorreto.Value);
        dm.cdsProdestatu.AsFloat := exceEstcorreto.Value;
        dm.cdsProdpreven.AsFloat := rxceprcustocorreto.Value;
        dm.cdsProdprecus.AsFloat := rxceprcustocorreto.Value;
        if dm.cdsProdtipcon.Value = 'G' then
        begin
          dm.cdsSequenciais.First;
          while not dm.cdsSequenciais.Eof do
          begin
             dm.cdsSequenciais.Edit;
             dm.cdsSequenciais.Post;
             dm.cdsSequenciais.Next;
          end;
          dm.cdsSequenciais.ApplyUpdates(0);
        end;  
        inherited;
        MessageDlg('Produto Alterado Com Sucesso!', mtConfirmation, [mbOK], 0);
        dm.cdsProd.Close;
        gridAcertos.Visible:= false;
      end;
  end;

end;

function TfrmManuAcertosEstoque.verificaDadosAntesGravar:Boolean;
begin
    if exceEstcorreto.Value<0 then
    begin
       f.Mensagem(false,'Estoque Correto Não pode ser Menor que (0)');
       result:= false;
    end else result := true;
    if rxceprcustocorreto.Value<0 then
    begin
       f.Mensagem(false,'Preço de Custo Correto Não pode ser Menor que (0)');
       result:= false;
    end else result := true;
    if rxceprvendacorreto.Value<0 then
    begin
       f.Mensagem(false,'Preço de Venda Correto Não pode ser Menor que (0)');
       result:= false;
    end else result := true;
end;

procedure TfrmManuAcertosEstoque.armazenaValores;
begin
  estAtu   := dm.cdsProdestatu.AsFloat;
  PrVeAtu  := dm.cdsProdpreven.AsFloat;
  PrCusAtu := dm.cdsProdcusrea.AsFloat;
end;

procedure TfrmManuAcertosEstoque.pesquisaExit(Sender: TObject);
begin
  armazenaValores;
end;

procedure TfrmManuAcertosEstoque.dbeDescriProExit(Sender: TObject);
begin
  armazenaValores;
end;

procedure TfrmManuAcertosEstoque.pesquisaEnter(Sender: TObject);
begin
  dm.cdsProd.Open;
  pesquisa.LookupTable := dm.cdsProd;

end;

procedure TfrmManuAcertosEstoque.dbeDescriProChange(Sender: TObject);
begin
  if dm.cdsProdtipcon.AsString = 'G' then
  begin
    sql.executaSQlPorEmp(dm.cdsSequenciais,'*','sqpro',' and cdprod='+IntToStr(dm.cdsProdcdprod.Value));
    gridAcertos.Visible := true;
    lblGrade.Visible := true;
  end
  else
  begin
    gridAcertos.Visible := false;
    lblGrade.Visible := false;
  end;  
end;

end.

