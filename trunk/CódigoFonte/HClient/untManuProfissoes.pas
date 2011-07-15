unit untManuProfissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, untDeclaracoes, ToolEdit, RXDBCtrl;

type
  TfrmManuProfissoes = class(TfrmManutencao)
    pgProfissoes: TPageControl;
    tbDadosPrincipais: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    dbeProfissao: TDBEdit;
    dbeCod: TDBEdit;
    Label18: TLabel;
    dbdateedtdatacadastro: TDBDateEdit;
    procedure dbeProfissaoExit(Sender: TObject);
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
  frmManuProfissoes: TfrmManuProfissoes;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuProfissoes.dbeProfissaoExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeProfissao.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','profi',' and descri='+
        QuotedStr(dbeProfissao.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsGRProdescri.AsString:= '';
            f.Mensagem(false,'Profissão Ja esta Gravado!');
        end;
      end;  
  end;
end;

procedure TfrmManuProfissoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   ManuDAO.Free;
end;

procedure TfrmManuProfissoes.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsProfi);
  inherited;
  DataSource.DataSet := dm.cdsProfi;
end;

function TfrmManuProfissoes.verificaDadosAntesGravar: Boolean;
begin
   if dbeProfissao.Text = '' then
   begin
      f.Mensagem(false,'Preencha Profissão!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuProfissoes.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgProfissoes,0);
     dbeProfissao.SetFocus;
  end;
end;

procedure TfrmManuProfissoes.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuProfissoes.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuProfissoes.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsProficdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdprof','profi');
  end;
  inherited;
end;

end.
