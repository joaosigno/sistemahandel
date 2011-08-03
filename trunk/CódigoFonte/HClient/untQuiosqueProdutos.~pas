unit untQuiosqueProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, Mask, DBCtrls;

type
  TfrmQuiosqueProdutos = class(TForm)
    Image1: TImage;
    edtPesquisa: TEdit;
    Label1: TLabel;
    lblHora: TLabel;
    tmQuiosque: TTimer;
    dsProdutos: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbDecri: TDBText;
    dbTipo: TDBText;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmQuiosqueTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
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

procedure TfrmQuiosqueProdutos.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case Key of
      VK_ESCAPE:
        close;
   end;
end;

procedure TfrmQuiosqueProdutos.tmQuiosqueTimer(Sender: TObject);
begin
  lblHora.Caption := TimeToStr(time);
end;

procedure TfrmQuiosqueProdutos.FormCreate(Sender: TObject);
begin
  dsProdutos.DataSet := dm.cdsProd;
  dm.cdsProd.Close;
end;

procedure TfrmQuiosqueProdutos.edtPesquisaChange(Sender: TObject);
begin
  dm.cdsProd.Open;
  dm.cdsProd.Locate('descri', VarArrayOf([edtPesquisa.Text]), [loPartialKey]);
end;

end.
