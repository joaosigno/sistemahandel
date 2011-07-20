unit untManuCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, ToolEdit, RXDBCtrl,untDeclaracoes, ExtCtrls, CurrEdit;

type
  TfrmManuCheques = class(TfrmManutencao)
    pgCheques: TPageControl;
    tsCheques: TTabSheet;
    Label1: TLabel;
    dbeCod: TDBEdit;
    Label2: TLabel;
    dbeNumBanco: TDBEdit;
    Label3: TLabel;
    dbeAgencia: TDBEdit;
    Label4: TLabel;
    dbeNumChq: TDBEdit;
    Label5: TLabel;
    dbeNumConta: TDBEdit;
    Label6: TLabel;
    dbeC3: TDBEdit;
    Label7: TLabel;
    dbeEmitente: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    dbeCMC7: TDBEdit;
    Label16: TLabel;
    dbcbEmitido: TDBCheckBox;
    tsChqObs: TTabSheet;
    DBMemo1: TDBMemo;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbdtCadastro: TDBDateEdit;
    dbDtVencimento: TDBDateEdit;
    ddbcbStatus: TDBComboBox;
    dbeCodCli: TDBEdit;
    dblkpcbCliente: TDBLookupComboBox;
    dbeValor: TRxDBCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbGravarClick(Sender: TObject);
    function Valida_CMC7(Entrada:String) : Boolean;
    Function SoNumero(Texto : String) : String;
    Function Modulo10(Valor: String): String;
    function IsDigit(Texto: string): boolean;
    function LeftStr(Const Str: String; Size: Word): String;
    function MidStr(Const Str: String; From, Size: Word): String;
    function RightStr(Const Str: String; Size: Word): String;
    Function CalculaC3(numero: string): String;
    procedure dbeCMC7Exit(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure dbeCMC7KeyPress(Sender: TObject; var Key: Char);
    procedure tbAdicionarClick(Sender: TObject);
    procedure dbcbEmitidoClick(Sender: TObject);
    procedure dbeEmitenteExit(Sender: TObject);
    procedure dblkpcbClienteExit(Sender: TObject);

  private
    { Private declarations }
    F:TFuncoes;
    procedure verificaInsercao();
    function verificaDadosAntesGravar():Boolean;
  public
    { Public declarations }
  end;

var
  frmManuCheques: TfrmManuCheques;

implementation

uses untPrincipal, untDM;

{$R *.dfm}

procedure TfrmManuCheques.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgCheques,0);
     dbeCMC7.SetFocus;
  end;
end;

function TfrmManuCheques.verificaDadosAntesGravar: Boolean;
begin
    if dbeValor.Text = '' then
   begin
      f.Mensagem(false,'Preencha Valor!');
      result:= false;
   end else result:=true;
   if dbeEmitente.Text = '' then
   begin
     f.Mensagem(false,'Preencha Emitente!');
      result:= false;
   end else result:=true;
   if ddbcbStatus.Text = '' then
   begin
     f.Mensagem(false,'Preencha Status');
      result:= false;
   end else result:=true;
end;

function TfrmManuCheques.Modulo10(Valor: String): string;
{
   Rotina usada para cálculo de alguns dígitos verificadores
   Pega-se cada um dos dígitos contidos no parâmetro VALOR, da direita para a
   esquerda e multiplica-se por 2121212...
   Soma-se cada um dos subprodutos. Caso algum dos subprodutos tenha mais de um
   dígito, deve-se somar cada um dos dígitos. (Exemplo: 7*2 = 14 >> 1+4 = 5)
   Divide-se a soma por 10.
   Faz-se a operação 10-Resto da divisão e devolve-se o resultado dessa operação
   como resultado da função Modulo10.
   Obs.: Caso o resultado seja maior que 9, deverá ser substituído por 0 (ZERO).
}
var
   Auxiliar : string;
   Contador, Peso : integer;
   Digito : integer;
begin
   Auxiliar := '';
   Peso := 2;
   for Contador := Length(Valor) downto 1 do
   begin
      Auxiliar := IntToStr(StrToInt(Valor[Contador]) * Peso) + Auxiliar;
      if Peso = 1 then
         Peso := 2
      else
         Peso := 1;
   end;

   Digito := 0;
   for Contador := 1 to Length(Auxiliar) do
   begin
      Digito := Digito + StrToInt(Auxiliar[Contador]);
   end;
   Digito := 10 - (Digito mod 10);
   if (Digito > 9) then
      Digito := 0;
   Result := IntToStr(Digito);
end;

function TfrmManuCheques.Valida_CMC7(Entrada:String) : Boolean;
var
  campo1, campo2, campo3 : String;
begin
  Entrada := SoNumero(Entrada);
  campo1 := Copy(entrada,1,7);
  campo2 := Copy(entrada,9,10);
  campo3 := Copy(entrada,20,10);
  Result := True;
  if Modulo10(campo1) <> Copy(Entrada,19,1) then
     Result := False
  Else
  if Modulo10(campo2) <> Copy(Entrada,8,1) then
     Result := False
  Else
  if Modulo10(campo3) <> Copy(Entrada,30,1) then
     Result := False;
end;

Function TfrmManuCheques.SoNumero(Texto : String) : String;
//
// Filtra todos os numeros de uma string
//
var
Ind    : Integer;
TmpRet : String;
begin
TmpRet := '';
for Ind := 1 to Length(Texto) do
    begin
    if IsDigit(Copy(Texto,Ind,1)) then
       begin
       TmpRet := TmpRet + Copy(Texto, Ind, 1);
       end;
    end;
Result := TmpRet;
end;

function TfrmManuCheques.IsDigit(Texto: string): boolean;
begin
 result := true;
 try
    StrToInt(Texto);
 except
    result := false;
 end;
end;

function TfrmManuCheques.LeftStr(Const Str: String; Size: Word): String;
begin
  LeftStr := Copy(Str, 1, Size)
end;

function TfrmManuCheques.MidStr(Const Str: String; From, Size: Word): String;
begin
  MidStr := Copy(Str, From, Size)
end;

function TfrmManuCheques.RightStr(Const Str: String; Size: Word): String;
begin
  if Size > Length(Str) then Size := Length(Str) ;
  RightStr := Copy(Str, Length(Str)-Size+1, Size)
end;

  	

Function TfrmManuCheques.CalculaC3(numero: string): String;
var
  x, resto, tam, digito : integer;
  d, d_aux : string;
begin
  digito:= 0;

  d_aux    := SoNumero(numero);
  tam      := length(d_aux);
  d        := copy(d_aux,0,tam);

  for x:= 1 to length(d) do
  begin
    digito:= digito + (StrToInt(d[x])*(length(d)+2-x));
  end;

  digito   := digito * 10;
  resto    := digito mod 11;
  digito   := resto;
  resto    := digito mod 10;
  Result   := IntToStr(resto);
end;



procedure TfrmManuCheques.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsCheque);
  inherited;
  DataSource.DataSet := dm.cdsCheque;
end;

procedure TfrmManuCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuCheques.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
    dm.cdsChequecdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
    dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdchq','cheqs');
  end;

  inherited;

end;

procedure TfrmManuCheques.dbeCMC7Exit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','cheqs',' and cmc7='+
        QuotedStr(dbeCMC7.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsChequecmc7.AsString:= '';
            f.Mensagem(false,'CMC7 já foi gravado!');
            dbeCMC7.SetFocus;
        end
        else
          if Valida_CMC7(dbeCMC7.Text) = false then
            begin
              ShowMessage('Número de cheque inválido');
              dbeCMC7.SetFocus;
            end
             else
            begin
              //ShowMessage('Cheque válido');
              dbeNumBanco.Text  := LeftStr(dbeCMC7.Text,3);
              dbeAgencia.Text   := MidStr(dbeCMC7.Text,4,4);
              dbeNumChq.Text    := MidStr(dbeCMC7.Text,12,6);
              dbeNumConta.Text  := MidStr(dbeCMC7.Text,23,6);
              dbeC3.Text        := CalculaC3(dbeNumChq.Text);
              dbeValor.SetFocus;
            end;
  end;

end;

procedure TfrmManuCheques.dbeValorExit(Sender: TObject);
begin
  dbeEmitente.SetFocus;
end;

procedure TfrmManuCheques.dbeCMC7KeyPress(Sender: TObject; var Key: Char);
begin
  //inherited;
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuCheques.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuCheques.dbcbEmitidoClick(Sender: TObject);
begin
 if dbcbEmitido.Checked = true then
  begin
    dbeCodCli.Enabled := false;
    dblkpcbCliente.Enabled := false;
    dbcbEmitido.ValueChecked := 'N';
  end
    else
  begin
    dbeCodCli.Enabled := true;
    dblkpcbCliente.Enabled := true;
    dbcbEmitido.ValueChecked := 'S';
  end;

end;

procedure TfrmManuCheques.dbeEmitenteExit(Sender: TObject);
begin
  dblkpcbCliente.SetFocus;
end;

procedure TfrmManuCheques.dblkpcbClienteExit(Sender: TObject);
begin
 ddbcbStatus.SetFocus;
end;

end.
