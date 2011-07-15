unit untHS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, RxGIF, ExtCtrls, DBClient,
  MConnect, SConnect, TrayIcon, Menus;

type
  TfrmHServer = class(TForm)
    pnlHS: TPanel;
    imgAutenticacao: TImage;
    Label1: TLabel;
    StaticText1: TStaticText;
    gridHS: TDBGrid;
    btnInciar: TBitBtn;
    btnFechar: TBitBtn;
    BitBtn1: TBitBtn;
    dsHS: TDataSource;
    HSPopup: TPopupMenu;
    procedure btnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  //TrayIcon: TCoolTrayIcon;
    { Public declarations }
  end;

var
  frmHServer: TfrmHServer;

implementation

uses untRDS, HS_TLB;

{$R *.dfm}

procedure TfrmHServer.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmHServer.FormCreate(Sender: TObject);
var
  Handle: HWND;
begin
  with frmHServer do
  begin
    Hint := 'GP Server Monitor';
    Icon := Application.Icon;
    PopupMenu := HSPopup;
    ShowHint := True;
    //StartMinimized := True;
   // Start;
  end;
end;

end.
