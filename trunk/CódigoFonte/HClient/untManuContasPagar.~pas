unit untManuContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, ComCtrls, DB, ImgList, ToolWin, StdCtrls,
  wwdblook, Wwdbdlg, Mask, DBCtrls, ToolEdit, RXDBCtrl, CurrEdit, ExtCtrls;

type
  TfrmManuContasPagar = class(TfrmManutencao)
    pgContasPagar: TPageControl;
    tbPrincipal: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    Label2: TLabel;
    dbeCodFor: TDBEdit;
    Label3: TLabel;
    dbeTitulo: TDBEdit;
    Label4: TLabel;
    dbeCodNota: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    tbObservacao: TTabSheet;
    dbmmObs: TDBMemo;
    dbePesquisaTitulo: TwwDBLookupComboDlg;
    dbmmHistorico: TDBMemo;
    Bevel1: TBevel;
    dbdateedtdatacadastro: TDBDateEdit;
    dbdeDtVenc: TDBDateEdit;
    dbeValor: TRxDBCalcEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbGravarClick(Sender: TObject);
    procedure dbePesquisaFornecedorExit(Sender: TObject);
    procedure dbePesquisaTituloExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuContasPagar: TfrmManuContasPagar;

implementation

uses untDM, DAO, untPrincipal;

{$R *.dfm}

procedure TfrmManuContasPagar.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsCtPag);
  inherited;
  DataSource.DataSet := dm.cdsCtPag;
end;

procedure TfrmManuContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuContasPagar.tbGravarClick(Sender: TObject);
begin
  dm.cdsCtPagcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
  dm.cdsCtPagcodusu.AsInteger := frmPrincipal.Configuracao.UsuarioCodigo;
  dm.cdsCtPagtipcon.AsString  := 'P';
  dm.cdsCtPagstacon.AsString  := 'A';
  dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'codcon','conta');
  inherited;

end;

procedure TfrmManuContasPagar.dbePesquisaFornecedorExit(Sender: TObject);
begin
  dbeCodFor.Text := IntToStr(dm.cdsForcdforn.Value);
  dbePesquisaTitulo.SetFocus;
end;

procedure TfrmManuContasPagar.dbePesquisaTituloExit(Sender: TObject);
begin
  dbeTitulo.Text := dm.cdsPlanContascdcont.Value;
  dbeCodNota.SetFocus;
end;

procedure TfrmManuContasPagar.FormShow(Sender: TObject);
begin
  inherited;
  dm.cdsFor.Active := true;
  dm.cdsPlanContas.Active := true;
end;

end.
