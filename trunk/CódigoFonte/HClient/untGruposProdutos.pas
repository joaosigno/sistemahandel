unit untGruposProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, StdCtrls, DBCtrls, Mask, ComCtrls, DB, ImgList,
  ToolWin, untDeclaracoes, ToolEdit, RXDBCtrl;

type
  TfrmManuGrupoProdutos = class(TfrmManutencao)
    pgGruposProdutos: TPageControl;
    tbDadosPrincipais: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    dbeDescricao: TDBEdit;
    dbeValorDesconto: TDBEdit;
    dbeCod: TDBEdit;
    dbcbControlarDesconto: TDBCheckBox;
    Label18: TLabel;
    dbdateedtdatacadastro: TDBDateEdit;
    procedure dbeDescricaoExit(Sender: TObject);
    procedure dbcbControlarDescontoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeValorDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
  private
    F : TFuncoes;
    procedure verificaInsercao;
    function verificaDadosAntesGravar:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuGrupoProdutos: TfrmManuGrupoProdutos;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuGrupoProdutos.dbeDescricaoExit(Sender: TObject);
begin
 if DataSource.State IN [dsInsert] then
  begin
    if dbeDescricao.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','grPro',' and descri='+
        QuotedStr(dbeDescricao.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsGRProdescri.AsString:= '';
            f.Mensagem(false,'Descrição Ja esta Gravado!');
        end;
     end;   
  end;

end;

procedure TfrmManuGrupoProdutos.dbcbControlarDescontoClick(
  Sender: TObject);
begin
  if dbcbControlarDesconto.Checked then
    dbeValorDesconto.Enabled := true
  else
    dbeValorDesconto.Enabled := false;
end;

procedure TfrmManuGrupoProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuGrupoProdutos.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsGRPro);
  inherited;
  DataSource.DataSet := dm.cdsGRPro;
end;

procedure TfrmManuGrupoProdutos.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgGruposProdutos,0);
     dm.cdsGRProacdesc.AsString := 'N';
     dbeDescricao.SetFocus;
  end;
end;

procedure TfrmManuGrupoProdutos.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuGrupoProdutos.dbeValorDescontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8,'.'] ) then key := #0;
end;

procedure TfrmManuGrupoProdutos.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuGrupoProdutos.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsGRProcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdgrup','grPro');
  end;
  inherited;
end;

function TfrmManuGrupoProdutos.verificaDadosAntesGravar:Boolean;
begin
   if dbeDescricao.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição!');
      result:= false;
   end else result:=true;
end;

end.
