unit untRenegociacaoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ToolEdit, CurrEdit, StdCtrls, Mask, ExtCtrls,
  wwdblook, Wwdbdlg, DB, untDeclaracoes, DBClient, SQL, Menus,
  RXDBCtrl, DBCtrls, DBTables, FMTBcd, Provider, SqlExpr,
  dblookup, SqlTimSt;

type
  TfrmRenegociacaoContas = class(TForm)
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Shape4: TShape;
    Image1: TImage;
    lbl_funcionario: TLabel;
    btnSelecionaContas: TButton;
    btnRenegociar: TButton;
    edtNomeConta: TEdit;
    edtNomeFornecedor: TEdit;
    edtNro: TRxCalcEdit;
    edtTotalContas: TRxCalcEdit;
    edtTotalDescontos: TRxCalcEdit;
    edtTotalDevido: TRxCalcEdit;
    edtTotalJuros: TRxCalcEdit;
    edtValor: TRxCalcEdit;
    edtVencimento: TDateEdit;
    gridContas: TDBGrid;
    btnFechar: TButton;
    edtFornecedor: TwwDBLookupComboDlg;
    edtConta: TwwDBLookupComboDlg;
    dsRenegociacao: TDataSource;
    cdsContas: TClientDataSet;
    cdsContascdclfo: TIntegerField;
    cdsContastitulo: TStringField;
    cdsContasnotcon: TIntegerField;
    cdsContasdtemit: TDateField;
    cdsContasvlcont: TFloatField;
    cdsContasdtvenc: TDateField;
    cdsContasdtpaga: TDateField;
    cdsContasvalpag: TFloatField;
    cdsContasjurpag: TFloatField;
    cdsContasobscon: TStringField;
    cdsContasstacon: TStringField;
    cdsContascdvend: TIntegerField;
    cdsContasconcax: TStringField;
    cdsContasdescon: TFloatField;
    cdsContashistor: TStringField;
    cdsContasmulpag: TFloatField;
    cdsContassemdup: TStringField;
    cdsContasDIASATRASO: TIntegerField;
    cdsContasJUROSMULTA: TFloatField;
    PopupMenu: TPopupMenu;
    SelecionarContas1: TMenuItem;
    RetirartodasasContasdaRelao1: TMenuItem;
    tmr_abreselecao: TTimer;
    tmr_VerificaContas: TTimer;
    cdsContasSOMAVALOR: TAggregateField;
    cdsContascodcon: TIntegerField;
    cdsContascdempr: TIntegerField;
    cdsContastipcon: TStringField;
    cdsContasprocuraClientes: TStringField;
    cdsContasprocuraFornecedor: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFornecedorChange(Sender: TObject);
    procedure edtContaChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure edtContaExit(Sender: TObject);
    procedure edtFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure edtContaKeyPress(Sender: TObject; var Key: Char);
    procedure btnRenegociarClick(Sender: TObject);
    procedure btnSelecionaContasClick(Sender: TObject);
    procedure cdsContasCalcFields(DataSet: TDataSet);
    procedure RetirartodasasContasdaRelao1Click(Sender: TObject);
    procedure SelecionarContas1Click(Sender: TObject);
    procedure tmr_abreselecaoTimer(Sender: TObject);
    procedure tmr_VerificaContasTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTotalDescontosExit(Sender: TObject);
    procedure edtTotalJurosExit(Sender: TObject);
  private
  F : TFuncoes;
  SQl : TSQL;
    { Private declarations }
  public
  InserindoRenegociacao: boolean;
  tipo : String;
  //R - Recebidas
  //P- Pagar
    { Public declarations }
  end;

var
  frmRenegociacaoContas: TfrmRenegociacaoContas;

implementation

uses untDM, untRenegociacaoAux, untSelecionarContas, untPrincipal, Math;

{$R *.dfm}

procedure TfrmRenegociacaoContas.FormCreate(Sender: TObject);
begin
  dm.cdsPlanContas.Open;
  dm.cdsFor.Open;
  dsRenegociacao.DataSet := cdsContas;
  edtConta.LookupTable := dm.cdsPlanContas;
  edtFornecedor.LookupTable := dm.cdsFor;
  edtVencimento.Date := incMonth(date);
  cdsContasprocuraClientes.LookupDataSet := dm.cdsCli;
  cdsContasprocuraFornecedor.LookupDataSet := dm.cdsFor;
  edtNomeFornecedor.Text := '';
  InserindoRenegociacao := False;
end;

procedure TfrmRenegociacaoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.cdsPlanContas.close;
  dm.cdsFor.close;
end;

procedure TfrmRenegociacaoContas.edtFornecedorChange(Sender: TObject);
begin
    edtNomeFornecedor.Text := dm.cdsFornmfant.AsString;
end;

procedure TfrmRenegociacaoContas.edtContaChange(Sender: TObject);
begin
    edtNomeConta.Text := dm.cdsPlanContasdescri.AsString;
end;

procedure TfrmRenegociacaoContas.btnFecharClick(Sender: TObject);
begin
  close
end;

procedure TfrmRenegociacaoContas.edtFornecedorExit(Sender: TObject);
begin
  if edtFornecedor.Text <> '' then
    begin
      SQL.executaSQlPorEmp(dm.cdsAux,'*','forne','and cdforn='+
      QuotedStr(edtFornecedor.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          edtFornecedor.Text:= '';
          f.Mensagem(false,'Fornecedor N�o Existe!');
      end;
    end;
end;

procedure TfrmRenegociacaoContas.edtContaExit(Sender: TObject);
begin
  if edtConta.Text <> '' then
    begin
      SQL.executaSql(dm.cdsAux,'select * from plcon where cdcont='+
      QuotedStr(edtConta.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          edtConta.Text:= '';
          f.Mensagem(false,'Codigo de Caixa N�o Existe!');
      end;
    end; 
end;

procedure TfrmRenegociacaoContas.edtFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmRenegociacaoContas.edtContaKeyPress(Sender: TObject;
  var Key: Char);
begin
   If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmRenegociacaoContas.btnRenegociarClick(Sender: TObject);
var
  I: Integer;
  cod : integer;
begin
  if edtNro.Value <= 0 then
  begin
    f.Mensagem(false,'Defina o n�mero de parcelas da renegocia��o!!');
    edtNro.setfocus;
    Abort;
  end;
  if (edtConta.Value = '0') or (edtConta.Value = '') then
  begin
    f.Mensagem(false,'Defina o plano de contas do caixa!!');
    edtConta.setfocus;
    Abort;
  end;
  frmRenegociacaoAux := TfrmRenegociacaoAux.Create(Application);
  frmRenegociacaoAux.cdsParcelas.Open;
  SQl.executaSQlPorEmp(frmRenegociacaoAux.cdsParcelas,'*','conta','and tipcon=''P'' and codcon=00000000');
  cod := StrToInt(sql.proxCod(dm.cdsAux,'codcon','conta'));
  for I := 0 to frmRenegociacaoContas.edtNro.AsInteger - 1 do
  begin
    frmRenegociacaoAux.cdsParcelas.Insert;
    frmRenegociacaoAux.cdsParcelasdtemit.Value := date;
    frmRenegociacaoAux.cdsParcelashistor.Value := 'Renegocia��o de Contas';
    frmRenegociacaoAux.cdsParcelasdtvenc.Value := IncMonth(edtVencimento.Date,I);
    frmRenegociacaoAux.cdsParcelasvlcont.Value := F.Arredondar(frmRenegociacaoContas.edtValor.Value / frmRenegociacaoContas.edtNro.Value,2);
    frmRenegociacaoAux.cdsParcelascdempr.Value := frmPrincipal.Configuracao.EmpresaCodigo;
    frmRenegociacaoAux.cdsParcelascodcon.Value := cod;
    frmRenegociacaoAux.cdsParcelastipcon.Value := 'P';
    frmRenegociacaoAux.cdsParcelastitulo.Value := 'RENEGOCIADA';
    frmRenegociacaoAux.cdsParcelasconcax.Value := frmRenegociacaoContas.edtConta.Text;
    frmRenegociacaoAux.cdsParcelascdclfo.Value := StrToInt(frmRenegociacaoContas.edtFornecedor.text);
    frmRenegociacaoAux.cdsParcelasstacon.Value := 'A';
    frmRenegociacaoAux.cdsParcelas.Post;
    cod := cod + 1;
  end;
  frmRenegociacaoAux.PodeInserir := False;
  frmRenegociacaoAux.cdsParcelasprocuraFornecedor.ReadOnly := true;
  frmRenegociacaoAux.tipo := 1;
  frmRenegociacaoAux.ShowModal;
end;

procedure TfrmRenegociacaoContas.btnSelecionaContasClick(Sender: TObject);
begin
  edtFornecedor.Clear;
//  ProcuraFornecedor;
  gridContas.DataSource := nil;
  frmSelecionarContas := TfrmSelecionarContas.create(Application);
  frmSelecionarContas.CodigoForm := 2;
  frmSelecionarContas.Tipo := 'P';
  frmSelecionarContas.showmodal;
end;

procedure TfrmRenegociacaoContas.cdsContasCalcFields(DataSet: TDataSet);
begin
  if InserindoRenegociacao = False then
  begin
    if cdsContasdtvenc.AsDateTime < date then
      cdsContasDIASATRASO.Value := F.DiasEntreDatas(cdsContasdtvenc.Text,datetostr(date))
    else cdsContasDIASATRASO.Value := -1 * F.DiasEntreDatas(datetostr(date),cdsContasdtvenc.Text);
    if cdsContasDIASATRASO.Value > 0 then cdsContasJUROSMULTA.value := ((cdsContasjurpag.value * cdsContasDIASATRASO.Value) + cdsContasmulpag.value)
      else cdsContasJUROSMULTA.value := 0;
  end;
end;

procedure TfrmRenegociacaoContas.RetirartodasasContasdaRelao1Click(
  Sender: TObject);
begin
  cdsContas.close;
  edtTotalContas.Clear;
  edtTotalJuros.Clear;
  edtTotalDevido.Clear;
  edtFornecedor.Clear;
//  ProcuraFornecedor;
  edtValor.Clear;
end;

procedure TfrmRenegociacaoContas.SelecionarContas1Click(Sender: TObject);
begin
  edtFornecedor.Clear;
//  ProcuraFornecedor;
  gridContas.DataSource := nil;
  frmSelecionarContas := TfrmSelecionarContas.create(Application);
  frmSelecionarContas.CodigoForm := 2;
  frmSelecionarContas.Tipo := 'P';
  frmSelecionarContas.showmodal;
end;

procedure TfrmRenegociacaoContas.tmr_abreselecaoTimer(Sender: TObject);
begin
  tmr_abreselecao.enabled := false;
  btnSelecionaContasClick(Sender);
end;

procedure TfrmRenegociacaoContas.tmr_VerificaContasTimer(Sender: TObject);
begin
  btnRenegociar.enabled := (cdsContas.active = true) and (cdsContas.recordcount > 0);
end;

procedure TfrmRenegociacaoContas.FormShow(Sender: TObject);
begin
  if tipo = 'P' then
  begin
     gridContas.Columns[0].FieldName := 'procuraFornecedor';
     gridContas.columns[0].Title.Caption := 'Fornecedor';
     edtFornecedor.Visible := true;
     Label6.Caption := 'Fornecedor';
  end else
  begin
{     gridContas.Columns[0].FieldName := 'procuraCliente';
     gridContas.columns[0].Title.Caption := 'Cliente';
     lbl_funcionario.Caption := 'Sele��o de Contas a Receber';
     lbNomeCliente.Caption := 'Cliente';
     edtCliente.Visible:= true;
}  end;
end;

procedure TfrmRenegociacaoContas.edtTotalDescontosExit(Sender: TObject);
var valor : real;
begin
  if edtTotalDescontos.Text <> '' then
  begin
    valor := 0;
    valor := (StrtoFloatDef(edtTotalJuros.Text,0)+StrtoFloatDef(edtTotalContas.Text,0))-StrtoFloatDef(edtTotalDescontos.Text,0);
    edtValor.Text := FloatToStr(valor);
    edtTotalDevido.Text := FloatToStr(valor);
  end;
end;

procedure TfrmRenegociacaoContas.edtTotalJurosExit(Sender: TObject);
var valor : real;
begin
  if edtTotalJuros.Text <> '' then
  begin
    valor := 0;
    valor := (StrtoFloatDef(edtTotalJuros.Text,0)+StrtoFloatDef(edtTotalContas.Text,0))-StrtoFloatDef(edtTotalDescontos.Text,0);
    edtValor.Text := FloatToStr(valor);
    edtTotalDevido.Text := FloatToStr(valor);
  end;
end;

end.
