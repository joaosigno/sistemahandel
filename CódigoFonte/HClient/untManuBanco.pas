unit untManuBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, ToolEdit, RXDBCtrl, untDeclaracoes;

type
  
  TfrmManuBanco = class(TfrmManutencao)
    pgBanco: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeCod: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    dbeDescri: TDBEdit;
    dbdateedtdatacadastro: TDBDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeDescriExit(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeCodKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  F : TFuncoes;
    { Private declarations }
  public
   procedure verificaInsercao();
   function verificaDadosAntesGravar():Boolean;
    { Public declarations }
  end;

var
  frmManuBanco: TfrmManuBanco;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuBanco.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsBanc);
  inherited;
  DataSource.DataSet := DM.cdsBanc;
end;

procedure TfrmManuBanco.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar =false then
    abort else
  inherited;
end;

procedure TfrmManuBanco.dbeDescriExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeDescri.Text <> '' then
      begin
        ManuDAO.SQL.executaSql(dm.cdsAux,'select * from banco where descri='+
        QuotedStr(dbeDescri.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsBancdescri.AsString:= '';
            f.Mensagem(false,'Descrição Ja esta Gravado!');
        end;
      end;  
  end;

end;

function TfrmManuBanco.verificaDadosAntesGravar: Boolean;
begin
   if dbeDescri.Text = '' then
   begin
      f.Mensagem(false,'Preencha Descrição!');
      result:= false;
   end else result:=true;
   if dbeCod.Text = '' then
   begin
      f.Mensagem(false,'Preencha Código!');
      result:= false;
   end else result:=true;

end;

procedure TfrmManuBanco.verificaInsercao;
begin
   if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgBanco,0);
     dbeDescri.SetFocus;
  end;
end;

procedure TfrmManuBanco.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuBanco.FormShow(Sender: TObject);
begin
  verificaInsercao;
end;

procedure TfrmManuBanco.dbeCodKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuBanco.dbeCodExit(Sender: TObject);
begin
 if DataSource.State IN [dsInsert] then
  begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from banco where cdban='+
        QuotedStr(dbeCod.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsBancdescri.AsString:= '';
            f.Mensagem(false,'Código Ja esta Gravado!');
        end;
  end;

end;

procedure TfrmManuBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

end.
