unit untManuTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, ToolEdit,
  RXDBCtrl, StdCtrls, Mask, DBCtrls, untDeclaracoes, ShellApi;

type
  TfrmManuTransportadoras = class(TfrmManutencao)
    pgTransportadoras: TPageControl;
    tsInicio: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    Label18: TLabel;
    dbdateedtdatacadastro: TDBDateEdit;
    Label2: TLabel;
    dbeNmFant: TDBEdit;
    Label3: TLabel;
    dbeRzSoci: TDBEdit;
    Label4: TLabel;
    DbeEnde: TDBEdit;
    Label5: TLabel;
    dbeTelefone: TDBEdit;
    Label6: TLabel;
    dbeFax: TDBEdit;
    Label7: TLabel;
    dbeInsEst: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    dbeBairro: TDBEdit;
    Label10: TLabel;
    dbeCidade: TDBEdit;
    Label11: TLabel;
    dbeNum: TDBEdit;
    dbeUF: TDBComboBox;
    Label16: TLabel;
    Label12: TLabel;
    dbeRespon: TDBEdit;
    dbcdedtemail: TRxDBComboEdit;
    dbcdedthomepage: TRxDBComboEdit;
    Label20: TLabel;
    Label21: TLabel;
    rxdbxeCNPJ: TRxDBComboEdit;
    procedure dbeNmFantExit(Sender: TObject);
    procedure dbeRzSociExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rxdbxeCNPJButtonClick(Sender: TObject);
    procedure rxdbxeCNPJExit(Sender: TObject);
    procedure rxdbxeCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbeFaxKeyPress(Sender: TObject; var Key: Char);
  private
   F: TFuncoes;
  function verificaDadosAntesGravar():Boolean;
  procedure verificaInsercao();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuTransportadoras: TfrmManuTransportadoras;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmManuTransportadoras.dbeNmFantExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
     if dbeNmFant.Text <> '' then
     begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','trans',' and nmfant='+
        QuotedStr(dbeNmFant.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsTransnmfant.AsString:= '';
            f.Mensagem(false,'Nome Fantasia Ja esta Gravado!');
        end;
       end; 
  end;

end;

procedure TfrmManuTransportadoras.dbeRzSociExit(Sender: TObject);
begin
   if DataSource.State IN [dsInsert] then
  begin
     if dbeRzSoci.Text <> '' then
     begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','trans',' and rzsoci='+
        QuotedStr(dbeRzSoci.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsTransrzsoci.AsString:= '';
            f.Mensagem(false,'Razão Social Ja esta Gravado!');
        end;
       end; 
  end;

end;

function TfrmManuTransportadoras.verificaDadosAntesGravar: Boolean;
begin
  if dbeNmFant.Text = '' then
   begin
      f.Mensagem(false,'Preencha Nome Fantasia!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuTransportadoras.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgTransportadoras,0);
     dbeNmFant.SetFocus;
  end;
end;

procedure TfrmManuTransportadoras.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuTransportadoras.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuTransportadoras.tbGravarClick(Sender: TObject);
begin
   if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsTranscdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdtran','trans');
  end;
  inherited;

end;

procedure TfrmManuTransportadoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuTransportadoras.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsTrans);
  inherited;
  DataSource.DataSet := dm.cdsTrans;

end;

procedure TfrmManuTransportadoras.rxdbxeCNPJButtonClick(Sender: TObject);
begin
  ShellExecute(Application.Handle,nil,PChar('http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/cnpjreva_solicitacao.asp'),nil,nil,SW_SHOWNORMAL);
end;

procedure TfrmManuTransportadoras.rxdbxeCNPJExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
     if rxdbxeCNPJ.Text <> '' then
     begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','trans',' and cgc='+
        QuotedStr(rxdbxeCNPJ.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsTransnmfant.AsString:= '';
            f.Mensagem(false,'CNPJ Ja esta Gravado!');
        end;
       end; 
  end;

  if not F.VerificaCGC(rxdbxeCNPJ.Text) then rxdbxeCNPJ.Color := $004D61EE else rxdbxeCNPJ.Color := clLime;

end;

procedure TfrmManuTransportadoras.rxdbxeCNPJKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;

  if not F.VerificaCGC(rxdbxeCNPJ.Text) then rxdbxeCNPJ.Color := $004D61EE else rxdbxeCNPJ.Color := clLime;
end;

procedure TfrmManuTransportadoras.dbeTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;

end;

procedure TfrmManuTransportadoras.dbeFaxKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;

end;

end.
