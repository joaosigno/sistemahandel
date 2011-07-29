unit untAlterarLoteContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, ExtCtrls, DB, Menus;

type
  TfrmAlterarLoteContas = class(TForm)
    Image1: TImage;
    lbl_funcionario: TLabel;
    gridContas: TDBGrid;
    btnSalvar: TButton;
    btnSelecionaContas: TButton;
    btnFechar: TButton;
    dbckbx_baixa: TDBCheckBox;
    dsContas: TDataSource;
    tmr_abreselecao: TTimer;
    PopupMenu: TPopupMenu;
    SelecionarContas1: TMenuItem;
    RetirartodasasContasdaRelao1: TMenuItem;
    Label1: TLabel;
    btnAutalizar: TButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnSelecionaContasClick(Sender: TObject);
    procedure gridContasColExit(Sender: TObject);
    procedure gridContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridContasKeyPress(Sender: TObject; var Key: Char);
    procedure tmr_abreselecaoTimer(Sender: TObject);
    procedure RetirartodasasContasdaRelao1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAutalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
  Tipo :  String;//R = receber; P = pagar
    { Public declarations }
  end;

var
  frmAlterarLoteContas: TfrmAlterarLoteContas;

implementation

uses untDM, untSelecionarContas;

{$R *.dfm}

procedure TfrmAlterarLoteContas.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAlterarLoteContas.btnSalvarClick(Sender: TObject);
begin
  if dm.cdsContas.active = true then
  begin
    if MessageDlg('Deseja realmente apagar a(s) conta(s) selecionada(s)?', mtConfirmation, [mbyes,mbno], 0) = mryes then
    begin
      dm.cdsContas.first;
      while not dm.cdsContas.eof do
      begin
        if dm.cdsContasSELECIONA.text = 'S' then
          dm.cdsContas.delete
        else dm.cdsContas.next;
      end;
    end;
    dm.cdsContas.ApplyUpdates(0);
  end;
end;

procedure TfrmAlterarLoteContas.btnSelecionaContasClick(Sender: TObject);
begin
  frmSelecionarContas := TfrmSelecionarContas.create(Application);
  frmSelecionarContas.CodigoForm := 1;
  frmSelecionarContas.Tipo := Tipo;
  frmSelecionarContas.showmodal;
  frmSelecionarContas.Free;
end;

procedure TfrmAlterarLoteContas.gridContasColExit(Sender: TObject);
begin
   if gridContas.SelectedField.FieldName = dbckbx_baixa.DataField then
    dbckbx_baixa.Visible := False;
end;

procedure TfrmAlterarLoteContas.gridContasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
        (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
 TDbGrid(Sender).Canvas.font.Color:= clblack; //aqui é definida a cor da fonte sem a selecao
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:=$000080FF; //aqui é definida a cor de seleção
      TDbGrid(Sender).Canvas.font.Color:= clwindow; //aqui é definida a cor da fonte com a selecao
      TDbGrid(Sender).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [FSBOLD]; //aqui é definida a a fonte negrito com a selecao
      FillRect(Rect);
    end;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = dbckbx_baixa.DataField) then
    begin
      dbckbx_baixa.Left := Rect.Left + gridContas.Left + 2;
      dbckbx_baixa.Top := Rect.Top + gridContas.top + 2;
      dbckbx_baixa.Width := Rect.Right - Rect.Left;
      dbckbx_baixa.Height := Rect.Bottom - Rect.Top;
      dbckbx_baixa.Visible := True;
    end;
  end else
  begin
    if (Column.Field.FieldName = dbckbx_baixa.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.Text = 'S'];

      gridContas.Canvas.FillRect(Rect);
      DrawFrameControl(gridContas.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TfrmAlterarLoteContas.gridContasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then Exit;
  if (gridContas.SelectedField.FieldName = dbckbx_baixa.DataField) then
  begin
    dbckbx_baixa.SetFocus;
    SendMessage(dbckbx_baixa.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TfrmAlterarLoteContas.tmr_abreselecaoTimer(Sender: TObject);
begin
  tmr_abreselecao.enabled := false;
  btnSelecionaContasClick(Sender);
end;

procedure TfrmAlterarLoteContas.RetirartodasasContasdaRelao1Click(
  Sender: TObject);
begin
  dm.cdsContas.Close;
end;

procedure TfrmAlterarLoteContas.FormCreate(Sender: TObject);
begin
  dsContas.DataSet := dm.cdsContas;
  dm.cdsContas.Close;
  
  dm.cdsContasprocuraFornecedor.ReadOnly := true;
  dm.cdsContasprocuraCliente.ReadOnly := true;
  dm.cdsContasnotcon.ReadOnly := true;
  dm.cdsContastitulo.ReadOnly := true;
end;

procedure TfrmAlterarLoteContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.cdsContasprocuraFornecedor.ReadOnly := false;
  dm.cdsContasprocuraCliente.ReadOnly := false;
  dm.cdsContasnotcon.ReadOnly := false;
  dm.cdsContastitulo.ReadOnly := false;
end;

procedure TfrmAlterarLoteContas.FormShow(Sender: TObject);
begin
   if tipo = 'P' then
  begin
     gridContas.Columns[0].FieldName := 'procuraFornecedor';
     gridContas.columns[0].Title.Caption := 'Fornecedor';
     Label1.Caption := 'Contas a Pagar';
  end else
  begin
     gridContas.Columns[0].FieldName := 'procuraCliente';
     gridContas.columns[0].Title.Caption := 'Cliente';
     Label1.Caption := 'Contas a Receber';
  end;
end;

procedure TfrmAlterarLoteContas.btnAutalizarClick(Sender: TObject);
begin
  if dm.cdsContas.active = true then
  begin
    if MessageDlg('Deseja realmente atualizar a(s) conta(s) selecionada(s)?', mtConfirmation, [mbyes,mbno], 0) = mryes then
    begin
      dm.cdsContas.first;
      while not dm.cdsContas.eof do
      begin
        if dm.cdsContasSELECIONA.text = 'S' then
        begin
          dm.cdsContas.Edit;
          dm.cdsContas.Post;
          dm.cdsContas.next;
        end else dm.cdsContas.next;
      end;
      dm.cdsContas.ApplyUpdates(0);
    end;
  end;
end;

end.
