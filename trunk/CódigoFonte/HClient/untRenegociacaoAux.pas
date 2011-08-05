unit untRenegociacaoAux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Grids, DBGrids, SQL, untDeclaracoes;

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
    cdsParcelascodcon: TIntegerField;
    cdsParcelascdempr: TIntegerField;
    cdsParcelastipcon: TStringField;
    cdsParcelastitulo: TStringField;
    cdsParcelasnotcon: TIntegerField;
    cdsParcelasdtemit: TDateField;
    cdsParcelasdtpaga: TDateField;
    cdsParcelasvalpag: TFloatField;
    cdsParcelasjurpag: TFloatField;
    cdsParcelasobscon: TStringField;
    cdsParcelasstacon: TStringField;
    cdsParcelascdvend: TIntegerField;
    cdsParcelasconcax: TStringField;
    cdsParcelasdescon: TFloatField;
    cdsParcelasmulpag: TFloatField;
    cdsParcelassemdup: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cdsParcelasBeforeInsert(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  F: TFuncoes;
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
var CodigoContasLog,CodigoContasnovasLog, hist: String;
    cod : integer;
begin
    case tipo of
    1:begin
        hist := 'T�tulos: ';
        frmRenegociacaoContas.InserindoRenegociacao := True;
        frmRenegociacaoContas.cdsContas.first;

        while not frmRenegociacaoContas.cdsContas.eof do
        begin
          if CodigoContasLog = '' then CodigoContasLog := frmRenegociacaoContas.cdsContastitulo.text + ' (V:' + FormatFloat('0.00',frmRenegociacaoContas.cdsContasvlcont.value) + ')'
          else CodigoContasLog := CodigoContasLog + ', ' + frmRenegociacaoContas.cdsContastitulo.Text + ' (V:' + FormatFloat('0.00',frmRenegociacaoContas.cdsContasvlcont.value) + ')';
          hist := hist + ' / ' + frmRenegociacaoContas.cdsContastitulo.AsString;
          frmRenegociacaoContas.cdsContas.Delete;
        end;
        cdsParcelas.first;
        cod:= StrToInt(SQl.proxCod(dm.cdsAux,'codcon','conta'));
        while not cdsParcelas.eof do
        begin
          frmRenegociacaoContas.cdsContas.Append;
          frmRenegociacaoContas.cdsContascodcon.value := cod;

          if CodigoContasnovasLog = '' then CodigoContasnovasLog := frmRenegociacaoContas.cdsContascodcon.text
          else CodigoContasnovasLog := CodigoContasnovasLog + ',' + frmRenegociacaoContas.cdsContascodcon.text;

          frmRenegociacaoContas.cdsContascdempr.Value := frmprincipal.Configuracao.EmpresaCodigo;
          if frmRenegociacaoContas.edtFornecedor.Text <> '' then
            frmRenegociacaoContas.cdsContascdclfo.value := strtoint(frmRenegociacaoContas.edtFornecedor.Text);
          if frmRenegociacaoContas.edtConta.Text <> '' then
            frmRenegociacaoContas.cdsContasconcax.value := frmRenegociacaoContas.edtConta.Text;
          frmRenegociacaoContas.cdsContasvlcont.ReadOnly := false;
          frmRenegociacaoContas.cdsContasvlcont.value := cdsParcelasvlcont.Value;
          frmRenegociacaoContas.cdsContasvlcont.ReadOnly := true;
          frmRenegociacaoContas.cdsContasdtvenc.ReadOnly := false;
          frmRenegociacaoContas.cdsContasdtvenc.value := cdsParcelasdtvenc.Value;
          frmRenegociacaoContas.cdsContasdtvenc.ReadOnly := true;
          frmRenegociacaoContas.cdsContastitulo.ReadOnly := false;
          frmRenegociacaoContas.cdsContastitulo.Value := 'RP'+IntToStr(cod);
          frmRenegociacaoContas.cdsContastitulo.ReadOnly := true;
          frmRenegociacaoContas.cdsContashistor.Value := 'Renegocia��o de Contas. ' + hist;
          frmRenegociacaoContas.cdsContasdtemit.Value := cdsParcelasdtemit.Value;
          frmRenegociacaoContas.cdsContastipcon.Value := cdsParcelastipcon.Value;
          frmRenegociacaoContas.cdsContasconcax.Value := cdsParcelasconcax.Value;
          frmRenegociacaoContas.cdsContasstacon.Value := cdsParcelasstacon.Value;
          frmRenegociacaoContas.cdsContas.Post;
          cdsParcelas.Next;
          cod:= cod + 1;
        end;
       try
          frmRenegociacaoContas.cdsContas.ApplyUpdates(0);
       except

       end;
        frmRenegociacaoContas.cdsContas.Close;
        frmRenegociacaoContas.InserindoRenegociacao := False;
        frmRenegociacaoContas.edtNomeConta.Text := '';
        frmRenegociacaoContas.edtNomeFornecedor.Text := '';
        frmRenegociacaoContas.edtNro.Text := '';
        frmRenegociacaoContas.edtTotalContas.Text := '';
        frmRenegociacaoContas.edtTotalDescontos.Text := '';
        frmRenegociacaoContas.edtTotalDevido.Text := '';
        frmRenegociacaoContas.edtTotalJuros.Text := '';
        frmRenegociacaoContas.edtValor.Text := '';
        frmRenegociacaoContas.edtVencimento.Text := '';
        frmRenegociacaoContas.edtFornecedor.Text := '';
        frmRenegociacaoContas.edtConta.Text := '';
    end;
    2: begin
       hist := 'T�tulos: ';
       frmRenegociacaoContas.InserindoRenegociacao := True;
        frmRenegociacaoContas.cdsContas.first;

        while not frmRenegociacaoContas.cdsContas.eof do
        begin
          if CodigoContasLog = '' then CodigoContasLog := frmRenegociacaoContas.cdsContastitulo.text + ' (V:' + FormatFloat('0.00',frmRenegociacaoContas.cdsContasvlcont.value) + ')'
          else CodigoContasLog := CodigoContasLog + ', ' + frmRenegociacaoContas.cdsContastitulo.Text + ' (V:' + FormatFloat('0.00',frmRenegociacaoContas.cdsContasvlcont.value) + ')';
          hist := hist + ' / ' + frmRenegociacaoContas.cdsContastitulo.AsString;
          frmRenegociacaoContas.cdsContas.Delete;
        end;
        cdsParcelas.first;
        cod:= StrToInt(SQl.proxCod(dm.cdsAux,'codcon','conta'));
        while not cdsParcelas.eof do
        begin
          frmRenegociacaoContas.cdsContas.Append;
          frmRenegociacaoContas.cdsContascodcon.value := cod;

          if CodigoContasnovasLog = '' then CodigoContasnovasLog := frmRenegociacaoContas.cdsContascodcon.text
          else CodigoContasnovasLog := CodigoContasnovasLog + ',' + frmRenegociacaoContas.cdsContascodcon.text;

          frmRenegociacaoContas.cdsContascdempr.Value := frmprincipal.Configuracao.EmpresaCodigo;
          if frmRenegociacaoContas.edtCliente.Text <> '' then
            frmRenegociacaoContas.cdsContascdclfo.value := strtoint(frmRenegociacaoContas.edtCliente.Text);
          if frmRenegociacaoContas.edtConta.Text <> '' then
            frmRenegociacaoContas.cdsContasconcax.value := frmRenegociacaoContas.edtConta.Text;
          frmRenegociacaoContas.cdsContasvlcont.ReadOnly := false;
          frmRenegociacaoContas.cdsContasvlcont.value := cdsParcelasvlcont.Value;
          frmRenegociacaoContas.cdsContasvlcont.ReadOnly := true;
          frmRenegociacaoContas.cdsContasdtvenc.ReadOnly := false;
          frmRenegociacaoContas.cdsContasdtvenc.value := cdsParcelasdtvenc.Value;
          frmRenegociacaoContas.cdsContasdtvenc.ReadOnly := true;
          frmRenegociacaoContas.cdsContastitulo.ReadOnly := false;
          frmRenegociacaoContas.cdsContastitulo.Value := 'RR'+IntToStr(cod);
          frmRenegociacaoContas.cdsContastitulo.ReadOnly := true;
          frmRenegociacaoContas.cdsContashistor.Value := 'Renegocia��o de Contas. ' + hist;
          frmRenegociacaoContas.cdsContasdtemit.Value := cdsParcelasdtemit.Value;
          frmRenegociacaoContas.cdsContastipcon.Value := cdsParcelastipcon.Value;
          frmRenegociacaoContas.cdsContasconcax.Value := cdsParcelasconcax.Value;
          frmRenegociacaoContas.cdsContasstacon.Value := cdsParcelasstacon.Value;
          frmRenegociacaoContas.cdsContas.Post;
          cdsParcelas.Next;
          cod:= cod + 1;
        end;
       try
          frmRenegociacaoContas.cdsContas.ApplyUpdates(0);
       except

       end;
        frmRenegociacaoContas.cdsContas.Close;
        frmRenegociacaoContas.InserindoRenegociacao := False;
        frmRenegociacaoContas.edtNomeConta.Text := '';
        frmRenegociacaoContas.edtNomeFornecedor.Text := '';
        frmRenegociacaoContas.edtNro.Text := '';
        frmRenegociacaoContas.edtTotalContas.Text := '';
        frmRenegociacaoContas.edtTotalDescontos.Text := '';
        frmRenegociacaoContas.edtTotalDevido.Text := '';
        frmRenegociacaoContas.edtTotalJuros.Text := '';
        frmRenegociacaoContas.edtValor.Text := '';
        frmRenegociacaoContas.edtVencimento.Text := '';
        frmRenegociacaoContas.edtCliente.Text := '';
        frmRenegociacaoContas.edtConta.Text := '';
    end;
  end;
  hist := '';
  Close;
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

procedure TfrmRenegociacaoAux.FormShow(Sender: TObject);
begin
  if tipo = 1 then
  begin
     DBGridKI1.Columns[0].FieldName := 'procuraFornecedor';
     DBGridKI1.columns[0].Title.Caption := 'Fornecedor';
  end;
  if tipo = 2 then
  begin
     DBGridKI1.Columns[0].FieldName := 'procuraCliente';
     DBGridKI1.columns[0].Title.Caption := 'Cliente';
  end;
end;

end.
