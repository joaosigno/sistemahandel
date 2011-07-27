unit untManuGruposCLientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, ToolEdit,
  RXDBCtrl, StdCtrls, Mask, DBCtrls, untDeclaracoes;

type
  TfrmManuGruposClientes = class(TfrmManutencao)
    pgGrCli: TPageControl;
    tsInicio: TTabSheet;
    tsOpcoes: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    dbeCod: TDBEdit;
    dbeDescricao: TDBEdit;
    Label18: TLabel;
    dbdateedtdatacadastro: TDBDateEdit;
    gbFormasPagamento: TGroupBox;
    dbVV: TDBCheckBox;
    dbVChe: TDBCheckBox;
    DBVP: TDBCheckBox;
    DBVCar: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    procedure dbeDescricaoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
  private
    F: TFuncoes;
    { Private declarations }
  public
    procedure verificaInsercao;
    function verificaDadosAntesGravar:Boolean;    
    { Public declarations }
  end;

var
  frmManuGruposClientes: TfrmManuGruposClientes;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

{ TfrmManuGruposClientes }

procedure TfrmManuGruposClientes.dbeDescricaoExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
    if dbeDescricao.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','grcli',' and descri='+
        QuotedStr(dbeDescricao.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsGRClidescri.AsString:= '';
            f.Mensagem(false,'Descrição Ja esta Gravado!');
        end;
     end;   
  end;

end;

procedure TfrmManuGruposClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuGruposClientes.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsGRCli);
  inherited;
  DataSource.DataSet := dm.cdsGRCli;
end;

function TfrmManuGruposClientes.verificaDadosAntesGravar: Boolean;
begin
  if dbeDescricao.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuGruposClientes.verificaInsercao;
begin
   if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgGrCli,0);
     dbeDescricao.SetFocus;
  end;
end;

procedure TfrmManuGruposClientes.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuGruposClientes.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuGruposClientes.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsGRClicdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdgrup','grCli');
  end;
   inherited;

end;

end.
