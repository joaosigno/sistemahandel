unit untManuDepartamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, untDeclaracoes, ToolEdit, RXDBCtrl;

type
  TfrmManuDepartamento = class(TfrmManutencao)
    pgDepartamento: TPageControl;
    tbPrincipal: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    dbeDescri: TDBEdit;
    dbeCod: TDBEdit;
    Label18: TLabel;
    dbdateedtdatacadastro: TDBDateEdit;
    procedure dbeDescriExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
  F: TFuncoes;
  function verificaDadosAntesGravar():Boolean;
  procedure verificaInsercao();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuDepartamento: TfrmManuDepartamento;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuDepartamento.dbeDescriExit(Sender: TObject);
begin
 if DataSource.State IN [dsInsert] then
  begin
     if dbeDescri.Text <> '' then
     begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','depar',' and descri='+
        QuotedStr(dbeDescri.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsDepadescri.AsString:= '';
            f.Mensagem(false,'Departamento Ja esta Gravado!');
        end;
       end; 
  end;

end;

function TfrmManuDepartamento.verificaDadosAntesGravar: Boolean;
begin
  if dbeDescri.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descri��o!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuDepartamento.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgDepartamento,0);
     dbeDescri.SetFocus;
  end;
end;

procedure TfrmManuDepartamento.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuDepartamento.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuDepartamento.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsDepacdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cddepa','depar');
  end;
  inherited;
end;

procedure TfrmManuDepartamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuDepartamento.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsDepa);
  inherited;
  DataSource.DataSet := dm.cdsDepa;
end;

end.
