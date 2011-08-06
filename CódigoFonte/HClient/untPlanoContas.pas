unit untPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvDBTreeView, DB, ImgList, Menus,
  StdCtrls, Mask, DBCtrls;

type
  TfrmPlContas = class(TForm)
    dsPlContas: TDataSource;
    dbTVPlContas: TJvDBTreeView;
    imglst_treecaixa: TImageList;
    ppmPlContasCaixa: TPopupMenu;
    Inserir1: TMenuItem;
    Alterar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    gbPlContas: TGroupBox;
    btnOK: TButton;
    btnCancel: TButton;
    dbeCod: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbeNome: TDBEdit;
    Label3: TLabel;
    dbeCodMae: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Inserir1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure dbTVPlContasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlContas: TfrmPlContas;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmPlContas.FormCreate(Sender: TObject);
begin
  dsPlContas.DataSet := dm.cdsPlanContas;
  dm.cdsPlanContas.Open;
{  dbTVPlContas.PopupMenu := nil;
  dbTVPlContas.PopupMenu := ppmPlContasCaixa;}
end;

procedure TfrmPlContas.btnOKClick(Sender: TObject);
begin
  frmPlContas.Height := dbTVPlContas.Height + 50;
end;

procedure TfrmPlContas.Inserir1Click(Sender: TObject);
var codmae: string;
begin
  codmae := dm.cdsPlanContascdcont.Value;
  frmPlContas.Height := dbTVPlContas.Height + 230;
  gbPlContas.Caption := 'Inserir';
  dm.cdsPlanContas.Insert;
  dbeNome.SetFocus;
  dm.cdsPlanContascdcoma.Value := codmae;
end;

procedure TfrmPlContas.btnCancelClick(Sender: TObject);
begin
    frmPlContas.Height := dbTVPlContas.Height + 50;
end;

procedure TfrmPlContas.FormShow(Sender: TObject);
begin
    frmPlContas.Height := dbTVPlContas.Height + 50;
end;

procedure TfrmPlContas.Alterar1Click(Sender: TObject);
begin
  frmPlContas.Height := dbTVPlContas.Height + 230;
  gbPlContas.Caption := 'Editar';
  dm.cdsPlanContas.Edit;
  dbeNome.SetFocus;
end;

procedure TfrmPlContas.dbTVPlContasClick(Sender: TObject);
begin
  dm.cdsPlanContas.Cancel;
  dbTVPlContas.Refresh;
  frmPlContas.Height := dbTVPlContas.Height + 50;
end;

procedure TfrmPlContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.cdsPlanContas.Cancel;
end;

end.
