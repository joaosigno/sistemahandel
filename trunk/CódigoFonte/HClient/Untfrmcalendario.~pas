unit Untfrmcalendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, RXClock, untDeclaracoes;

type
  TfrmCalendario = class(TForm)
    Image1: TImage;
    RxClock1: TRxClock;
    GroupBox1: TGroupBox;
    mcanterior: TMonthCalendar;
    GroupBox2: TGroupBox;
    mcposterior: TMonthCalendar;
    gbmesatual: TGroupBox;
    mcatual: TMonthCalendar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mcatualClick(Sender: TObject);
  private
     F: TFuncoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalendario: TfrmCalendario;

implementation

uses untPrincipal;

{$R *.dfm}

procedure TfrmCalendario.FormCreate(Sender: TObject);
begin
  mcatual.Date := date;
  mcanterior.Date := IncMonth(Date, -1);
  mcposterior.Date := IncMonth(Date, 1);
  gbmesatual.caption := F.dataextenso(date,1);
end;

procedure TfrmCalendario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmprincipal.acCalendario.enabled := true;
  Action := caFree;
end;

procedure TfrmCalendario.mcatualClick(Sender: TObject);
begin
  mcanterior.Date := IncMonth(mcatual.Date, -1);
  mcposterior.Date := IncMonth(mcatual.Date, 1);
  gbmesatual.Caption := F.dataextenso(mcatual.Date,1)
end;

end.
