unit untManuAcertoEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, ComCtrls, DB, ImgList, ToolWin, StdCtrls, Mask,
  DBCtrls, wwdblook, Wwdbdlg, ExtCtrls, ToolEdit, CurrEdit, RXDBCtrl, untDeclaracoes;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure pesquisaExit(Sender: TObject);
    procedure dbeDescriProExit(Sender: TObject);
  private
    F : TFuncoes;
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
end;

procedure TfrmManuAcertosEstoque.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsProd);
  inherited;
  DataSource.DataSet := dm.cdsProd;
  pesquisa.LookupTable := dm.cdsProd;
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
      dm.HistPro(frmPrincipal.Configuracao.EmpresaCodigo,dm.cdsProdcdprod.AsInteger,
               'Alterado pelo Usu�rio '+IntToStr(frmPrincipal.Configuracao.UsuarioCodigo)+
                '-'+frmPrincipal.Configuracao.UsuarioNome,
                exceEstcorreto.Value-estAtu,exceEstcorreto.Value);
      dm.cdsProdestatu.AsFloat := exceEstcorreto.Value;
      dm.cdsProdpreven.AsFloat := rxceprcustocorreto.Value;
      dm.cdsProdprecus.AsFloat := rxceprcustocorreto.Value;
  inherited;
  end;

end;

function TfrmManuAcertosEstoque.verificaDadosAntesGravar:Boolean;
begin
    if exceEstcorreto.Value<0 then
    begin
       f.Mensagem(false,'Estoque Correto N�o pode ser Menor que (0)');
       result:= false;
    end else result := true;
    if rxceprcustocorreto.Value<0 then
    begin
       f.Mensagem(false,'Pre�o de Custo Correto N�o pode ser Menor que (0)');
       result:= false;
    end else result := true;
    if rxceprvendacorreto.Value<0 then
    begin
       f.Mensagem(false,'Pre�o de Venda Correto N�o pode ser Menor que (0)');
       result:= false;
    end else result := true;
    if (dm.cdsProdtipopr.AsString = 'S') and (exceEstcorreto.Value>0)  then
    begin
       f.Mensagem(false,'Esse produto � um Servi�o, n�o pode ter Estoque!');
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

end.

