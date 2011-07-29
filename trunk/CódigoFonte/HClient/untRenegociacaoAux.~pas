unit untRenegociacaoAux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Grids, DBGrids, SQL;

type
  TfrmRenegociacaoAux = class(TForm)
    DBGridKI1: TDBGrid;
    btnOk: TButton;
    btnCancelar: TButton;
    cdsParcelas: TClientDataSet;
    dsParcelas: TDataSource;
    cdsParcelascdclfo: TIntegerField;
    cdsParcelasvlcont: TFloatField;
    cdsParcelasdtvenc: TDateField;
    cdsParcelasprocuraCliente: TStringField;
    cdsParcelasprocuraFornecedor: TStringField;
    cdsParcelashistor: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
  SQl : TSQL;
  PodeInserir: boolean;
  tipo: integer;
    //1 : pagar
    //2 : receber
    { Public declarations }
  end;

var
  frmRenegociacaoAux: TfrmRenegociacaoAux;

implementation

uses untDM, untRenegociacaoContas, untPrincipal;

{$R *.dfm}

procedure TfrmRenegociacaoAux.FormCreate(Sender: TObject);
begin
  cdsParcelasprocuraCliente.LookupDataSet := dm.cdsCli;
  cdsParcelasprocuraFornecedor.LookupDataSet := dm.cdsFor;
  PodeInserir := True;
end;

procedure TfrmRenegociacaoAux.btnOkClick(Sender: TObject);
var CodigoContasLog,CodigoContasnovasLog: String;
begin
case tipo of
    1:begin
        frmRenegociacaoContas.InserindoRenegociacao := True;
        frmRenegociacaoContas.cdsContas.first;
        while not frmRenegociacaoContas.cdsContas.eof do
        begin
          if CodigoContasLog = '' then CodigoContasLog := frmRenegociacaoContas.cdsContastitulo.text + ' (V:' + FormatFloat('0.00',frmRenegociacaoContas.cdsContasvlcont.value) + ')'
          else CodigoContasLog := CodigoContasLog + ', ' + frmRenegociacaoContas.cdsContastitulo.Text + ' (V:' + FormatFloat('0.00',frmRenegociacaoContas.cdsContasvlcont.value) + ')';
          frmRenegociacaoContas.cdsContas.Delete;
        end;
        cdsParcelas.first;
        while not cdsParcelas.eof do
        begin
          frmRenegociacaoContas.cdsContas.Append;
          frmRenegociacaoContas.cdsContascodcon.value := StrToInt(SQl.proxCod(frmRenegociacaoContas.cdsContas,'codcon','conta'));

          if CodigoContasnovasLog = '' then CodigoContasnovasLog := frmRenegociacaoContas.cdsContascodcon.text
          else CodigoContasnovasLog := CodigoContasnovasLog + ',' + frmRenegociacaoContas.cdsContascodcon.text;

          frmRenegociacaoContas.cdsContascdempr.Value := frmprincipal.Configuracao.EmpresaCodigo;
          if frmRenegociacaoContas.edtFornecedor.Text <> '' then
            frmRenegociacaoContas.cdsContascdclfo.value := strtoint(frmRenegociacaoContas.edtFornecedor.Text);
          if frmRenegociacaoContas.edtConta.Text <> '' then
            frmRenegociacaoContas.cdsContasconcax.value := frmRenegociacaoContas.edtConta.Text;
          frmRenegociacaoContas.cdsContasvlcont.value := cdsParcelasvlcont.Value;
          frmRenegociacaoContas.cdsContasdtvenc.value := cdsParcelasdtvenc.Value;
          frmRenegociacaoContas.cdsContastitulo.Value := '0';
          frmRenegociacaoContas.cdsContashistor.Value := 'Renegociação de Contas';
          frmRenegociacaoContas.cdsContas.Post;
          cdsParcelas.Next;
        end;
       try
          frmRenegociacaoContas.cdsContas.ApplyUpdates(0);
       except

       end;
        frmRenegociacaoContas.cdsContas.Close;
        frmRenegociacaoContas.InserindoRenegociacao := False;
        Close;
    end;
end;
end;

procedure TfrmRenegociacaoAux.cdsParcelasBeforeInsert(DataSet: TDataSet);
begin
     if PodeInserir = False then
        Abort;
end;

procedure TfrmRenegociacaoAux.btnCancelarClick(Sender: TObject);
begin
  close;
end;

end.
