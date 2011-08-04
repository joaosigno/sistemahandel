unit untQuiosqueProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, Mask, DBCtrls, Grids, DBGrids, DBClient, SQL;

type
  TfrmQuiosqueProdutos = class(TForm)
    Image1: TImage;
    edtPesquisa: TEdit;
    Label1: TLabel;
    lblHora: TLabel;
    tmQuiosque: TTimer;
    dsProdutos: TDataSource;
    dbEstoque: TDBEdit;
    dbPrVenda: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbDecri: TDBText;
    dbTipo: TDBText;
    lblDescri: TLabel;
    cdsSequenciais: TClientDataSet;
    cdsSequenciaiscdsequ: TIntegerField;
    cdsSequenciaiscdempr: TIntegerField;
    cdsSequenciaisdtcada: TDateField;
    cdsSequenciaisultcom: TDateField;
    cdsSequenciaisultven: TDateField;
    cdsSequenciaiscdprod: TIntegerField;
    cdsSequenciaisdescri: TStringField;
    cdsSequenciaisprecus: TFloatField;
    cdsSequenciaisestatu: TFloatField;
    cdsSequenciaispreven: TFloatField;
    cdsSequenciaisvencim: TDateField;
    cdsSequenciaisquantTotal: TFloatField;
    cdsSequenciaisauxili: TFloatField;
    cdsSequenciaisSOMAAUXILIAR: TAggregateField;
    dsSequenciais: TDataSource;
    gridSequenciais: TDBGrid;
    lblGrade: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure tmQuiosqueTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure verificaGrade();
  private
  SQl : TSQL;
    { Private declarations }
  public
  NString : boolean; //não é string
    { Public declarations }
  end;

var
  frmQuiosqueProdutos: TfrmQuiosqueProdutos;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmQuiosqueProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
      VK_ESCAPE:
        close;
   end;
end;

procedure TfrmQuiosqueProdutos.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

procedure TfrmQuiosqueProdutos.tmQuiosqueTimer(Sender: TObject);
begin
  lblHora.Caption := TimeToStr(time);
end;

procedure TfrmQuiosqueProdutos.FormCreate(Sender: TObject);
begin
  dsProdutos.DataSet := dm.cdsProd;
  dm.cdsProd.Close;
  cdsSequenciais.Open;
end;

procedure TfrmQuiosqueProdutos.edtPesquisaChange(Sender: TObject);
var num : integer;
begin
  dm.cdsProd.Open;
  if not TryStrToInt(edtPesquisa.Text,num) then
  begin
    NString := false;
    if not dm.cdsProd.Locate('descri', VarArrayOf([edtPesquisa.Text]), [loPartialKey]) then
    begin
      lblDescri.Visible := true;
      dbDecri.Visible := false;
      dbEstoque.Visible := false;
      dbPrVenda.Visible := false;
      dbTipo.Visible := false;
      gridSequenciais.Visible := false;
      lblGrade.Visible := false;
    end else
    begin
      lblDescri.Visible := false;
      dbDecri.Visible := true;
      dbEstoque.Visible := true;
      dbPrVenda.Visible := true;
      dbTipo.Visible := true;
      verificaGrade;
    end;
  end else
  begin
    NString := True;

    lblDescri.Visible := true;
    dbDecri.Visible := false;
    dbEstoque.Visible := false;
    dbPrVenda.Visible := false;
    dbTipo.Visible := false;
  end;
end;

procedure TfrmQuiosqueProdutos.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if NString then
  begin
     case Key of
       VK_Return:
       begin
          if not dm.cdsProd.Locate('cdprod', VarArrayOf([edtPesquisa.Text]), [loPartialKey]) then
          begin
             lblDescri.Visible := true;
             dbDecri.Visible := false;
             dbEstoque.Visible := false;
             dbPrVenda.Visible := false;
             dbTipo.Visible := false;
             gridSequenciais.Visible := false;
             lblGrade.Visible := false;
             if not dm.cdsProd.Locate('codfab', VarArrayOf([edtPesquisa.Text]), [loPartialKey]) then
             begin
                 lblDescri.Visible := true;
                 dbDecri.Visible := false;
                 dbEstoque.Visible := false;
                 dbPrVenda.Visible := false;
                 dbTipo.Visible := false;
                 gridSequenciais.Visible := false;
                 lblGrade.Visible := false;
                 if not dm.cdsProd.Locate('refere', VarArrayOf([edtPesquisa.Text]), [loPartialKey]) then
                 begin
                    lblDescri.Visible := true;
                    dbDecri.Visible := false;
                    dbEstoque.Visible := false;
                    dbPrVenda.Visible := false;
                    dbTipo.Visible := false;
                    gridSequenciais.Visible := false;
                    lblGrade.Visible := false;
                 end else
                 begin
                    lblDescri.Visible := false;
                    dbDecri.Visible := true;
                    dbEstoque.Visible := true;
                    dbPrVenda.Visible := true;
                    dbTipo.Visible := true;
                    verificaGrade;
                 end;
             end else
             begin
                lblDescri.Visible := false;
                dbDecri.Visible := true;
                dbEstoque.Visible := true;
                dbPrVenda.Visible := true;
                dbTipo.Visible := true;
                verificaGrade;
             end;
          end else
          begin
             lblDescri.Visible := false;
             dbDecri.Visible := true;
             dbEstoque.Visible := true;
             dbPrVenda.Visible := true;
             dbTipo.Visible := true;
             verificaGrade;
          end;
       end;
     end;
  end;
   case Key of
      VK_ESCAPE:
        close;
   end;
end;

procedure TfrmQuiosqueProdutos.verificaGrade;
begin
  if dm.cdsProdtipcon.Value = 'G' then
  begin
      sql.executaSQlPorEmp(cdsSequenciais,'*','sqpro',' and cdprod='+IntToStr(dm.cdsProdcdprod.AsInteger));
      gridSequenciais.Visible := true;
      lblGrade.Visible := true;
  end else
  begin
      gridSequenciais.Visible := false;
      lblGrade.Visible := false;
  end;
end;

end.

