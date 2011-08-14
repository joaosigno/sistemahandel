unit untPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvExComCtrls, JvDBTreeView, DB, ImgList, Menus,
  StdCtrls, Mask, DBCtrls, SQL, untDeclaracoes;

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
    procedure Excluir1Click(Sender: TObject);
    procedure dbTVPlContasDblClick(Sender: TObject);
  private
  SQL : TSQL;
  F : TFuncoes;
    { Private declarations }
  public
  nod : string; // diz o codigo nod esta selecionado
  codForm : integer;
  //1. vizualiza��o
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
end;

procedure TfrmPlContas.btnOKClick(Sender: TObject);
var cod, str, cod2 : string;
    codInc, tamanho : integer;
begin
  str := '';
  if dsPlContas.State in [dsInsert] then
  begin
    {
      insere um codigo no plano de contas de acordo com sua conta m�e
    }
    sql.executaSql(dm.cdsAux,'select max(cdcont) as codigo from plcon where cdcoma= '+QuotedStr(dbeCodMae.Text));
    str := dm.cdsAux.FieldByName('codigo').Value;
    if str <> '' then
    begin
      cod := Copy (str, Length(str)-1, 2);
      codInc := StrTOInt(cod) + 1;
      tamanho := Length(str)-2;
      dbeCod.Text := Copy (str, 1, tamanho) + IntToSTr(codInc);
    end else
    begin
      dbeCod.Text := dbeCodMae.Text + '.01';
    end;
  end;
  dm.cdsPlanContas.Post;
  dm.cdsPlanContas.ApplyUpdates(0);
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
    dm.cdsPlanContas.Cancel;
    dm.cdsPlanContas.ApplyUpdates(0);
    frmPlContas.Height := dbTVPlContas.Height + 50;
end;

procedure TfrmPlContas.FormShow(Sender: TObject);
begin
  frmPlContas.Height := dbTVPlContas.Height + 50;
  if codForm = 1 then
  begin
    dbTVPlContas.PopupMenu := nil;
  end;
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
  nod := dm.cdsPlanContascdcont.Value;
  frmPlContas.Height := dbTVPlContas.Height + 50;
end;

procedure TfrmPlContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.cdsPlanContas.Cancel;
end;

procedure TfrmPlContas.Excluir1Click(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir a COnta Selecionada?',mtConfirmation,
            [mbYes,mbNo],0) = mryes then
  begin
    sql.executaSql(dm.cdsAux,'select * from plcon where cdcoma='+
                    QuotedStr(dm.cdsPlanContascdcont.Value));
    if dm.cdsAux.RecordCount = 0 then
    begin
        dm.cdsPlanContas.Delete;
        dm.cdsPlanContas.ApplyUpdates(0);
    end else
    begin
        f.Mensagem(false,'Imposs�vel de Escluir, Existem Filhos dessa Conta!');
    end;
  end;                  
end;

procedure TfrmPlContas.dbTVPlContasDblClick(Sender: TObject);
begin
  if codForm = 1 then
    close;
end;

end.
