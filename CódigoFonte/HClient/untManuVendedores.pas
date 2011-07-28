unit untManuVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, ComCtrls, DB, ImgList, ToolWin, StdCtrls, Mask,
  DBCtrls, ToolEdit, CurrEdit, RXDBCtrl, untDeclaracoes;

type
  TfrmManuVendedores = class(TfrmManutencao)
    pgVendedores: TPageControl;
    tsDadosPrincipais: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    dbeCodFUncionatio: TDBEdit;
    dblcbCodFuncionario: TDBLookupComboBox;
    Label3: TLabel;
    dbeNome: TDBEdit;
    dbeCod: TDBEdit;
    dbcbxRecebeCOmissao: TDBCheckBox;
    gbCOmissao: TGroupBox;
    dbecomissao: TRxDBCalcEdit;
    Label4: TLabel;
    VendaaVista: TDBCheckBox;
    vendaaprazo: TDBCheckBox;
    Vendaacheque: TDBCheckBox;
    vendaacartao: TDBCheckBox;
    dbdateedtdatacadastro: TDBDateEdit;
    Label7: TLabel;
    procedure dbcbxRecebeCOmissaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeCodFUncionatioExit(Sender: TObject);
    procedure dbeCodFUncionatioKeyPress(Sender: TObject; var Key: Char);
  private
  F : TFuncoes;
    { Private declarations }
  public
   procedure verificaInsercao();
   function verificaDadosAntesGravar():Boolean;
  end;

var
  frmManuVendedores: TfrmManuVendedores;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuVendedores.dbcbxRecebeCOmissaoClick(Sender: TObject);
begin
  if dbcbxRecebeCOmissao.Checked then
  begin
      gbCOmissao.Enabled := true;
  end else
  begin
      gbCOmissao.Enabled := false;
  end;
end;

procedure TfrmManuVendedores.FormCreate(Sender: TObject);
begin
  ManuDao := TManutencaoDAO.Create(dm.cdsVende);
  inherited;
  DataSource.DataSet := DM.cdsVende;
  ManuDAO.SQL.executaSQlPorEmp(dm.cdsFunc,'*','funci','');

end;

procedure TfrmManuVendedores.dbeNomeExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeNome.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','vende',' and nome='+
        QuotedStr(dbeNome.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsVendenome.AsString:= '';
            f.Mensagem(false,'Vendedor Ja esta Gravado!');
        end;
      end;  
  end;

end;

procedure TfrmManuVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

function TfrmManuVendedores.verificaDadosAntesGravar: Boolean;
begin
   if dbeNome.Text = '' then
   begin
      f.Mensagem(false,'Preencha Nome!');
      result:= false;
   end else result:=true;
   if dbeCodFUncionatio.Text = '' then
   begin
      f.Mensagem(false,'Preencha Funcionario!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuVendedores.verificaInsercao;
begin
   if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgVendedores,0);
     dbeNome.SetFocus;
  end;
end;

procedure TfrmManuVendedores.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuVendedores.tbAdicionarClick(Sender: TObject);
begin
  inherited;
   verificaInsercao;
end;

procedure TfrmManuVendedores.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsVendecdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdvend','vende');
  end;
  inherited;

end;

procedure TfrmManuVendedores.dbeCodFUncionatioExit(Sender: TObject);
begin
   if dbeCodFUncionatio.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','funci','and cdfunc='+
      QuotedStr(dbeCodFUncionatio.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsVendecdfunc.AsString:= '';
          f.Mensagem(false,'Funcionário Não Existe!');
      end;
    end; 

end;

procedure TfrmManuVendedores.dbeCodFUncionatioKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

end.
