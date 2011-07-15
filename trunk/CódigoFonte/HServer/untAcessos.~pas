unit untAcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, ExtCtrls;

type
  TfrmAcessos = class(TForm)
    qryVerificaAcessos: TZQuery;
    qryVerificaAcessoscdusuario: TIntegerField;
    qryVerificaAcessosusunome: TStringField;
    qryVerificaAcessosnomefantasia: TStringField;
    dsAcessos: TDataSource;
    gridAcessos: TDBGrid;
    Button1: TButton;
    tmAcessos: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tmAcessosTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcessos: TfrmAcessos;

implementation

uses untRDM;

{$R *.dfm}

procedure TfrmAcessos.FormCreate(Sender: TObject);
begin
    qryVerificaAcessos.Active := true;
    tmAcessos.Enabled := true;
end;

procedure TfrmAcessos.FormDestroy(Sender: TObject);
begin
    qryVerificaAcessos.Active := false;
    tmAcessos.Enabled := false;
end;

procedure TfrmAcessos.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAcessos.tmAcessosTimer(Sender: TObject);
begin
  qryVerificaAcessos.Active := false;
  qryVerificaAcessos.Active := true;
end;

end.
