unit untManuCartaoFidelidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin,untDeclaracoes,
  StdCtrls, Mask, DBCtrls, ToolEdit, RXDBCtrl;

type
  TfrmManuCartaoFidelidade = class(TfrmManutencao)
    pgCartaoFidelidade: TPageControl;
    tsCartaoFidelidade: TTabSheet;
    Label1: TLabel;
    dbeNrcartao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbeNome: TDBEdit;
    Label5: TLabel;
    dbcbxativo: TDBCheckBox;
    dbcdedtemail: TRxDBComboEdit;
    dbdateedtdatacadastro: TDBDateEdit;
    procedure dbeNrcartaoExit(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
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
  frmManuCartaoFidelidade: TfrmManuCartaoFidelidade;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

{ TfrmManuCartaoFidelidade }

function TfrmManuCartaoFidelidade.verificaDadosAntesGravar: Boolean;
begin
  if dbeNrcartao.Text = '' then
   begin
      f.Mensagem(false,'Preencha Número do Cartão!');
      result:= false;
   end else result:=true;
   if dbeNome.Text = '' then
   begin
      f.Mensagem(false,'Preencha Nome do Cartão!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuCartaoFidelidade.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgCartaoFidelidade,0);
     dbeNrcartao.SetFocus;
  end;

end;

procedure TfrmManuCartaoFidelidade.dbeNrcartaoExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeNrcartao.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','crfid','and nrcart='+
        QuotedStr(dbeNrcartao.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsCartFidnrcart.AsString:= '';
            f.Mensagem(false,'Número de Cartão Fidelidade Ja esta Gravado!');
        end;
       end; 
  end;

end;

procedure TfrmManuCartaoFidelidade.dbeNomeExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeNome.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*',' crfid ','and nmcart='+
        QuotedStr(dbeNrcartao.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsCartFidnrcart.AsString:= '';
            f.Mensagem(false,'Nome de Cartão Fidelidade Ja esta Gravado!');
        end;
       end; 
  end;

end;

procedure TfrmManuCartaoFidelidade.FormShow(Sender: TObject);
begin
  inherited;
   verificaInsercao;
end;

procedure TfrmManuCartaoFidelidade.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuCartaoFidelidade.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsCartFidcdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
  end;
  inherited;
end;

procedure TfrmManuCartaoFidelidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuCartaoFidelidade.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsCartFid);
  inherited;
  DataSource.DataSet := dm.cdsCartFid;

end;

end.
