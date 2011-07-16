unit untManuDepAut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, ToolEdit,
  RXDBCtrl, StdCtrls, Mask, DBCtrls, untDeclaracoes, DAO, DBClient;

type
  TDepAutDAO = class(TDAO)

  end;

  TfrmManuDepAut = class(TfrmManutencao)
    pgDepAut: TPageControl;
    tsDadosPrincipais: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    Label18: TLabel;
    dbdateedtdatacadastro: TDBDateEdit;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    dbeDocumento: TDBEdit;
    Label4: TLabel;
    dbeTelefone: TDBEdit;
    dbcbxDependente: TDBCheckBox;
    dbcbCompra: TDBCheckBox;
    cdsDepAut: TClientDataSet;
    cdsDepAutnome: TStringField;
    cdsDepAutdocume: TStringField;
    cdsDepAutcompra: TStringField;
    cdsDepAutdtnasc: TDateField;
    cdsDepAuttelefo: TStringField;
    cdsDepAutcdclien: TIntegerField;
    cdsDepAutdtcada: TDateField;
    cdsDepAutcdempr: TIntegerField;
    cdsDepAuttipo: TStringField;
    procedure dbeNomeExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
  private
  F: TFuncoes;
  function verificaDadosAntesGravar():Boolean;
  procedure verificaInsercao();
    { Private declarations }
  public
  c: integer;
    { Public declarations }
  end;

var
  frmManuDepAut: TfrmManuDepAut;
  DepAutDAO : TDepAutDAO;

implementation

uses untDM, untPrincipal, untManuClientes;

{$R *.dfm}

procedure TfrmManuDepAut.dbeNomeExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeNome.Text <> '' then
      begin
      DepAutDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','depaut',' and nome='+
        QuotedStr(dbeNome.Text)+' and cdclien='+QuotedStr(dbeCod.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            cdsDepAutnome.AsString:= '';
            f.Mensagem(false,'Dep/Aut Ja esta Gravado!');
        end;
      end;  
  end;

end;

function TfrmManuDepAut.verificaDadosAntesGravar: Boolean;
begin
   if dbeNome.Text = '' then
   begin
      f.Mensagem(false,'Preencha Nome!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuDepAut.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgDepAut,0);
     dbeNome.SetFocus;
  end;
end;

procedure TfrmManuDepAut.FormShow(Sender: TObject);
begin
  if c = 0 then
  begin
    DepAutDAO := TDepAutDAO.Create(dm.cdsDepen);
    DataSource.DataSet := dm.cdsDepen;
  end else
  begin
    DepAutDAO := TDepAutDAO.Create(dm.cdsAutori);
    DataSource.DataSet := dm.cdsAutori;
  end;
  verificaInsercao;
end;

procedure TfrmManuDepAut.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
   DepAutDAO.gravar;
  close;
end;

procedure TfrmManuDepAut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataSource.State in [dsEdit] then
  begin
     case MessageDlg('ATENÇÃO: Tem dados não salvos na tabela!' + #13 + 'Deseja salvá-los?', mtConfirmation, mbyesnocancel, 0) of
        mryes: DepAutDAO.gravar;
        mrno: DepAutDAO.cancelar;
        mrcancel:abort;
     end;
  end;
  DepAutDAO.cancelar;
end;

procedure TfrmManuDepAut.tbExcluirClick(Sender: TObject);
begin
  case MessageDlg('ATENÇÃO: Deseja Excluir!' + #13 + 'o dado da tabela?', mtConfirmation ,[mbYes,mbNo], 0) of
        mryes: DepAutDAO.excluir;
        mrno: DepAutDAO.cancelar;
   end;

end;

procedure TfrmManuDepAut.tbCancelarClick(Sender: TObject);
begin
  DepAutDAO.cancelar;
  close;
end;

end.
