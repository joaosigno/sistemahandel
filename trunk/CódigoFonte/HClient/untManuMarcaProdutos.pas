unit untManuMarcaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, ToolEdit, RXDBCtrl,untDeclaracoes;

type
  TfrmManuMarcaProdutos = class(TfrmManutencao)
    pgMcPro: TPageControl;
    tsMcPro: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeDescricao: TDBEdit;
    dbdateedtdatacadastro: TDBDateEdit;
    dbeCod: TDBEdit;
    procedure dbeDescricaoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  frmManuMarcaProdutos: TfrmManuMarcaProdutos;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuMarcaProdutos.dbeDescricaoExit(Sender: TObject);
begin
if DataSource.State IN [dsInsert] then
  begin
      if dbeDescricao.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','mcpro',' and descri='+
        QuotedStr(dbeDescricao.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsMcProdescri.AsString:= '';
            f.Mensagem(false,'Descrição Ja esta Gravado!');
        end;
      end;  
  end;

end;

procedure TfrmManuMarcaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuMarcaProdutos.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsMcPro);
  inherited;
  DataSource.DataSet := dm.cdsMcPro;

end;

function TfrmManuMarcaProdutos.verificaDadosAntesGravar: Boolean;
begin
  if dbeDescricao.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuMarcaProdutos.verificaInsercao;
begin
   if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgMcPro,0);
     dbeDescricao.SetFocus;
  end;
end;

procedure TfrmManuMarcaProdutos.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuMarcaProdutos.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuMarcaProdutos.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsMcProcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdmarc','mcpro');
  end;
  inherited;

end;

end.
