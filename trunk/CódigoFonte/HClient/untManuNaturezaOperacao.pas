unit untManuNaturezaOperacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, StdCtrls, Grids,
  DBGrids, wwdblook, Wwdbdlg, DBCtrls, untDeclaracoes, ExtCtrls, FMTBcd,
  DBClient, Provider,  SqlExpr;

type
  TfrmManuNaturezaOperacao = class(TfrmManutencao)
    pgNatOpe: TPageControl;
    tsInicio: TTabSheet;
    dbgrd_naturezaoperacao: TDBGrid;
    Label2: TLabel;
    edt_procuradescricao: TEdit;
    dbckbx_alteraestoque: TDBCheckBox;
    dbckbx_geralancamento: TDBCheckBox;
    dbckbx_incluiIPI: TDBCheckBox;
    edt_procuracodigo: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrd_naturezaoperacaoColExit(Sender: TObject);
    procedure dbgrd_naturezaoperacaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgrd_naturezaoperacaoKeyPress(Sender: TObject;
      var Key: Char);
    procedure edt_procuracodigoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_procuradescricaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  F : TFuncoes;
    { Private declarations }
  public
   procedure verificaInsercao();
   function verificaDadosAntesGravar():Boolean;
    { Public declarations }
  end;

var
  frmManuNaturezaOperacao: TfrmManuNaturezaOperacao;

implementation

uses untDM;

{$R *.dfm}

procedure TfrmManuNaturezaOperacao.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsNtOpe);
  inherited;
  DataSource.DataSet := DM.cdsNtOpe;
end;

function TfrmManuNaturezaOperacao.verificaDadosAntesGravar: Boolean;
begin
   if dm.cdsNtOpecdntop.IsNull then
   begin
      f.Mensagem(false,'Preencha C�digo da Natureza de Opera��o!');
      result:= false;
   end else result:=true;
   if dm.cdsNtOpedescri.IsNull then
   begin
      f.Mensagem(false,'Preencha Descri��o da Natureza de Opera��o!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuNaturezaOperacao.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgNatOpe,0);
  end;
end;

procedure TfrmManuNaturezaOperacao.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuNaturezaOperacao.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuNaturezaOperacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuNaturezaOperacao.dbgrd_naturezaoperacaoColExit(
  Sender: TObject);
begin
  if dbgrd_naturezaoperacao.SelectedField.FieldName = dbckbx_alteraestoque.DataField then
    dbckbx_alteraestoque.Visible := False;
  if dbgrd_naturezaoperacao.SelectedField.FieldName = dbckbx_geralancamento.DataField then
    dbckbx_geralancamento.Visible := False;
  if dbgrd_naturezaoperacao.SelectedField.FieldName = dbckbx_incluiIPI.DataField then
    dbckbx_incluiIPI.Visible := False;
end;

procedure TfrmManuNaturezaOperacao.dbgrd_naturezaoperacaoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer = 
        (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);  
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = dbckbx_alteraestoque.DataField) then
    begin
      dbckbx_alteraestoque.Left := Rect.Left + dbgrd_naturezaoperacao.Left + 2;
      dbckbx_alteraestoque.Top := Rect.Top + dbgrd_naturezaoperacao.top + 2;
      dbckbx_alteraestoque.Width := Rect.Right - Rect.Left;
      dbckbx_alteraestoque.Height := Rect.Bottom - Rect.Top;
      // Tornando o DBCheckBox vis�vel
      dbckbx_alteraestoque.Visible := True;
    end;
    if (Column.Field.FieldName = dbckbx_geralancamento.DataField) then
    begin
      dbckbx_geralancamento.Left := Rect.Left + dbgrd_naturezaoperacao.Left + 2;
      dbckbx_geralancamento.Top := Rect.Top + dbgrd_naturezaoperacao.top + 2;
      dbckbx_geralancamento.Width := Rect.Right - Rect.Left;
      dbckbx_geralancamento.Height := Rect.Bottom - Rect.Top;
      // Tornando o DBCheckBox vis�vel
      dbckbx_geralancamento.Visible := True;
    end;
    if (Column.Field.FieldName = dbckbx_incluiIPI.DataField) then
    begin
      dbckbx_incluiIPI.Left := Rect.Left + dbgrd_naturezaoperacao.Left + 2;
      dbckbx_incluiIPI.Top := Rect.Top + dbgrd_naturezaoperacao.top + 2;
      dbckbx_incluiIPI.Width := Rect.Right - Rect.Left;
      dbckbx_incluiIPI.Height := Rect.Bottom - Rect.Top;
      // Tornando o DBCheckBox vis�vel
      dbckbx_incluiIPI.Visible := True;
    end;
  end else
  begin
    if (Column.Field.FieldName = dbckbx_alteraestoque.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.Text = 'S'];

      dbgrd_naturezaoperacao.Canvas.FillRect(Rect);
      DrawFrameControl(dbgrd_naturezaoperacao.Canvas.Handle, DrawRect, 
        DFC_BUTTON, DrawState);
    end;
    if (Column.Field.FieldName = dbckbx_geralancamento.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.Text = 'S'];

      dbgrd_naturezaoperacao.Canvas.FillRect(Rect);
      DrawFrameControl(dbgrd_naturezaoperacao.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
    if (Column.Field.FieldName = dbckbx_incluiIPI.DataField) then
    begin
      DrawRect := Rect;
      InflateRect(DrawRect,-1,-1);

      DrawState := ISChecked[Column.Field.Text = 'S'];

      dbgrd_naturezaoperacao.Canvas.FillRect(Rect);
      DrawFrameControl(dbgrd_naturezaoperacao.Canvas.Handle, DrawRect,
        DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TfrmManuNaturezaOperacao.dbgrd_naturezaoperacaoKeyPress(
  Sender: TObject; var Key: Char);
begin
if (key = Chr(9)) then Exit;
  if (dbgrd_naturezaoperacao.SelectedField.FieldName = dbckbx_alteraestoque.DataField) then
  begin
    dbckbx_alteraestoque.SetFocus;
    SendMessage(dbckbx_alteraestoque.Handle, WM_Char, word(Key), 0);
  end;
  if (dbgrd_naturezaoperacao.SelectedField.FieldName = dbckbx_geralancamento.DataField) then
  begin
    dbckbx_geralancamento.SetFocus;
    SendMessage(dbckbx_alteraestoque.Handle, WM_Char, word(Key), 0);
  end;
  if (dbgrd_naturezaoperacao.SelectedField.FieldName = dbckbx_incluiIPI.DataField) then
  begin
    dbckbx_geralancamento.SetFocus;
    SendMessage(dbckbx_incluiIPI.Handle, WM_Char, word(Key), 0);
  end;

end;

procedure TfrmManuNaturezaOperacao.edt_procuracodigoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    dm.cdsNtOpe.Locate('CDNTOP', VarArrayOf([edt_procuracodigo.text]), [loPartialKey]);
end;

procedure TfrmManuNaturezaOperacao.edt_procuradescricaoKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  dm.cdsNtOpe.Locate('DESCRI', VarArrayOf([edt_procuradescricao.text]), [loPartialKey,loCaseInsensitive]);
end;

end.
