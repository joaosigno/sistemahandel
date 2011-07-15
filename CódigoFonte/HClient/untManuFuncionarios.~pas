unit untManuFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, RXDBCtrl, ToolEdit, untDeclaracoes, ShellApi, CurrEdit;

type
  TfrmManuFuncionario = class(TfrmManutencao)
    pgFuncionario: TPageControl;
    tbDadosPrincipais: TTabSheet;
    tbOutros: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeNome: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbeRG: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    dbeCEP: TDBEdit;
    Label8: TLabel;
    dbeendereco: TDBEdit;
    Label9: TLabel;
    dbebairro: TDBEdit;
    Label10: TLabel;
    dbenumero: TDBEdit;
    Label11: TLabel;
    dbecidade: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbetelefone: TDBEdit;
    dbeCod: TDBEdit;
    dbdateedtdatacadastro: TDBDateEdit;
    dbcbuf: TDBComboBox;
    dbeCNPJ: TRxDBComboEdit;
    Label14: TLabel;
    Label15: TLabel;
    dbdeDtNascimento: TDBDateEdit;
    dbcdedtemai: TRxDBComboEdit;
    Label16: TLabel;
    dbeCodProfi: TDBEdit;
    dblcbProfi: TDBLookupComboBox;
    Label18: TLabel;
    Label19: TLabel;
    dbdeDtAdmissao: TDBDateEdit;
    dbdeDtDaida: TDBDateEdit;
    Label20: TLabel;
    dbeCHoraria: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dbmmObs: TDBMemo;
    dbdePrFerias: TDBDateEdit;
    Label17: TLabel;
    Label24: TLabel;
    dbeCartProf: TDBEdit;
    DBComboBox1: TDBComboBox;
    dblcdDepartamento: TDBLookupComboBox;
    dbeCodDepartamento: TDBEdit;
    Label25: TLabel;
    dbcbxPessoafisica: TDBCheckBox;
    dbeCodBanco: TDBEdit;
    dblcbBanco: TDBLookupComboBox;
    dbeAgencia: TDBEdit;
    Label26: TLabel;
    dbeConta: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    dbeSalario: TRxDBCalcEdit;
    dbecomissao: TRxDBCalcEdit;
    procedure dbeCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure dbetelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodProfiKeyPress(Sender: TObject; var Key: Char);
    procedure dbeSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCOmissaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCNPJExit(Sender: TObject);
    procedure dbeCEPKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCNPJButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure dbeCodProfiExit(Sender: TObject);
    procedure dbeCodDepartamentoExit(Sender: TObject);
    procedure dbeCodBancoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodBancoExit(Sender: TObject);
    procedure dbeCodDepartamentoKeyPress(Sender: TObject; var Key: Char);
  private
     F:TFuncoes;
     procedure verificaInsersao();
     function verificaDadosAntesGravar:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuFuncionario: TfrmManuFuncionario;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuFuncionario.dbeCNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuFuncionario.dbetelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuFuncionario.dbeCodProfiKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuFuncionario.dbeSalarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuFuncionario.dbeCOmissaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

function TfrmManuFuncionario.verificaDadosAntesGravar: Boolean;
begin
  if dbeNome.Text = '' then
   begin
      f.Mensagem(false,'Preencha Nome!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuFuncionario.verificaInsersao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgFuncionario,0);
     dbeNome.SetFocus;
  end;  
end;

procedure TfrmManuFuncionario.dbeCNPJExit(Sender: TObject);
begin
  if DataSource.State in [dsInsert] then
  begin
      if dbeCNPJ.Text <> '' then
      begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from funci where cpf='+
        QuotedStr(dbeCNPJ.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsForCGC.AsString := '';
            f.Mensagem(false,'CNPJ Ja está Gravado!');
        end;
      end;  
  end;

  if not F.VerificaCPF(dbeCNPJ.Text) then dm.cdsFunccpf.AsString := '';

end;

procedure TfrmManuFuncionario.dbeCEPKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0
end;

procedure TfrmManuFuncionario.dbeCNPJButtonClick(Sender: TObject);
begin
  ShellExecute(Application.Handle,nil,PChar('http://www.receita.fazenda.gov.br/Aplicacoes/ATCTA/CPF/ConsultaPublica.asp'),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmManuFuncionario.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsFunc);
  inherited;
  DataSource.DataSet := dm.cdsFunc;
end;

procedure TfrmManuFuncionario.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsFunccdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdfunc','funci');
  end;
  inherited;
end;

procedure TfrmManuFuncionario.dbeNomeExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeNome.Text <> '' then
      begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from funci where nome='+
        QuotedStr(dbeNome.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsFornmfant.AsString:= '';
            f.Mensagem(false,'Nome Ja esta Gravado!');
        end;
      end;  
  end;

end;

procedure TfrmManuFuncionario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsersao;
end;

procedure TfrmManuFuncionario.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsersao;
end;

procedure TfrmManuFuncionario.dbeCodProfiExit(Sender: TObject);
begin
    if dbeCodProfi.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from profi where cdprof='+
       QuotedStr(dbeCodProfi.Text));
       if dm.cdsAux.RecordCount = 0 then
       begin
           dm.cdsFunccdprof.AsString:= '';
           f.Mensagem(false,'Profissão Não existe!');
       end;
    end;   
end;

procedure TfrmManuFuncionario.dbeCodDepartamentoExit(Sender: TObject);
begin
    if dbeCodDepartamento.Text <> '' then
    begin
       ManuDAO.SQL.executaSql(dm.cdsAux,'select * from depar where cddepa='+
       QuotedStr(dbeCodDepartamento.Text));
       if dm.cdsAux.RecordCount = 0 then
       begin
           dm.cdsFunccddepa.AsString:= '';
           f.Mensagem(false,'Departamento Não existe!');
       end;
    end;
end;

procedure TfrmManuFuncionario.dbeCodBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
   If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuFuncionario.dbeCodBancoExit(Sender: TObject);
begin
    if dbeCodBanco.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from banco where cdban='+
      QuotedStr(dbeCodBanco.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsFunccdbanc.AsString:= '';
          f.Mensagem(false,'Banco Não Existe!');
      end;
    end;
end;

procedure TfrmManuFuncionario.dbeCodDepartamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

end.
