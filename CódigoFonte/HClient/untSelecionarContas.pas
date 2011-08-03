unit untSelecionarContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolEdit, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids,
  RXCtrls, wwdblook, Wwdbdlg, SQL, untDeclaracoes, DB, DBClient, Menus, clipbrd;

type
  TfrmSelecionarContas = class(TForm)
    gridContas: TDBGrid;
    Bevel4: TBevel;
    lbl_funcionario: TLabel;
    Image2: TImage;
    btnOK: TButton;
    btnCancelar: TButton;
    dbckbx_baixa: TDBCheckBox;
    edtNomePessoa: TEdit;
    lbNomeCliente: TLabel;
    edtTitulo: TEdit;
    Label2: TLabel;
    Bevel2: TBevel;
    edtNroDocumento: TEdit;
    Label5: TLabel;
    cbTodasDatas: TCheckBox;
    edtDataInicial: TDateEdit;
    lbDatas2: TLabel;
    edtDataFinal: TDateEdit;
    lbInfo: TRxLabel;
    edtFornecedor: TwwDBLookupComboDlg;
    tmrVerificaConta: TTimer;
    cdsContas: TClientDataSet;
    dsSelecionaContas: TDataSource;
    cdsContascodcon: TIntegerField;
    cdsContascdempr: TIntegerField;
    cdsContastipcon: TStringField;
    cdsContascdclfo: TIntegerField;
    cdsContastitulo: TStringField;
    cdsContasnotcon: TIntegerField;
    cdsContasdtemit: TDateField;
    cdsContasvlcont: TFloatField;
    cdsContasdtvenc: TDateField;
    cdsContasSOMAVALOR: TAggregateField;
    cdsContasATRASO: TIntegerField;
    PopupMenu: TPopupMenu;
    Marcartodasascontas1: TMenuItem;
    Desmarcartodasascontas1: TMenuItem;
    cdsContasprocuraCliente: TStringField;
    cdsContasprocuraFornecedor: TStringField;
    Button1: TButton;
    cdsContassemdup: TStringField;
    Label10: TLabel;
    Label1: TLabel;
    cdsContasAUXSELECAO: TStringField;
    edtCliente: TwwDBLookupComboDlg;
    procedure FormCreate(Sender: TObject);
    procedure edtFornecedorChange(Sender: TObject);
    procedure edtFornecedorExit(Sender: TObject);
    procedure tmrVerificaContaTimer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cdsContasCalcFields(DataSet: TDataSet);
    procedure Desmarcartodasascontas1Click(Sender: TObject);
    procedure pesquisaContas();
    procedure FormShow(Sender: TObject);
    procedure gridContasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridContasKeyPress(Sender: TObject; var Key: Char);
    procedure gridContasTitleClick(Column: TColumn);
    procedure Marcartodasascontas1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure gridContasColExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtClienteChange(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
  private
  SQL : TSQL;
  F : TFuncoes;
    { Private declarations }
  public
  Tipo :  String;//R = receber; P = pagar
  CodigoForm: integer;
     //1 : frmContasAlteraLote
    //2 : frmContasRenegocioacao
    //3 : frmPagamentoContas
    { Public declarations }
  end;

var
  frmSelecionarContas: TfrmSelecionarContas;

implementation

uses untDM, untRenegociacaoContas;

{$R *.dfm}

procedure TfrmSelecionarContas.FormCreate(Sender: TObject);
begin
  dsSelecionaContas.DataSet := cdsContas;

  sql.executaSQlPorEmp(dm.cdsFor,'*','forne',' order by nmfant');
  sql.executaSQlPorEmp(dm.cdsCli,'*','clien',' order by nome');
  edtFornecedor.LookupTable := dm.cdsFor;
  edtCliente.LookupTable := dm.cdsCli;
  cdsContasprocuraCliente.LookupDataSet := dm.cdsCli;
  cdsContasprocuraFornecedor.LookupDataSet := dm.cdsFor;
  edtDataInicial.date := date;
  edtDataFinal.date := date;

end;

procedure TfrmSelecionarContas.edtFornecedorChange(Sender: TObject);
begin
  edtNomePessoa.Text := dm.cdsFornmfant.AsString;
end;

procedure TfrmSelecionarContas.edtFornecedorExit(Sender: TObject);
begin
  if edtFornecedor.Text <> '' then
    begin
      SQL.executaSQlPorEmp(dm.cdsAux,'*','forne','and cdforn='+
      QuotedStr(edtFornecedor.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          edtFornecedor.Text:= '';
          edtNomePessoa.Text := '';
          f.Mensagem(false,'Fornecedor Não Existe!');
      end;
    end;
end;

procedure TfrmSelecionarContas.tmrVerificaContaTimer(Sender: TObject);
begin
  edtDatainicial.enabled := cbTodasDatas.checked;
  edtDataFinal.enabled := cbTodasDatas.checked;
  try
    if (cdsContas.Active = true) and (not cdsContas.isempty) then
    begin
      lbInfo.caption := inttostr(cdsContas.recordcount) + ' conta(s) mostrada(s), no total de R$ ' + formatfloat('0.00',cdsContasSOMAVALOR.Value);
    end else lbInfo.caption := '0 conta(s) mostrada(s), no total de R$ 0,00';
  except
    lbInfo.caption := '0 conta(s) mostrada(s), no total de R$ 0,00';
  end;
end;

procedure TfrmSelecionarContas.btnOKClick(Sender: TObject);
var
  SelecionouConta: Boolean;
begin
  SelecionouConta := False;
  case CodigoForm of
    1:begin
      SQL.executaSQlPorEmp(dm.cdsContas,'*','conta',' and tipcon=''P'' and codcon= -1');
      dm.cdsContas.Close;
      cdsContas.First;
      while not cdsContas.eof do
      begin
        if cdsContasAUXSELECAO.value = 'S' then dm.cdsContas.CommandText :=
        dm.cdsContas.CommandText + ' or codcon = ' + inttostr(cdsContascodcon.value);
        cdsContas.next;
      end;
      dm.cdsContas.CommandText := dm.cdsContas.CommandText + ' order by dtvenc';
      dm.cdsContas.Open;
      close;
    end;
    2:begin
      SQL.executaSQlPorEmp(frmRenegociacaoContas.cdsContas,'*','conta',' and tipcon=''P'' and codcon= -1');
      frmRenegociacaoContas.cdsContas.Close;
      cdsContas.first;
      while not cdsContas.eof do
      begin
        if cdsContasAUXSELECAO.value = 'S' then
        begin
          frmRenegociacaoContas.cdsContas.CommandText :=
            frmRenegociacaoContas.cdsContas.CommandText + ' or codcon = ' + inttostr(cdsContascodcon.value);
          frmRenegociacaoContas.edtFornecedor.Text := cdsContascdclfo.Text;
        end;
        cdsContas.next;
      end;
      frmRenegociacaoContas.cdsContas.CommandText := frmRenegociacaoContas.cdsContas.CommandText + ' order by DTVENC';
      frmRenegociacaoContas.cdsContas.Open;
//      frmContasPagarRenegociacao.ProcuraFornecedor;
      frmRenegociacaoContas.edtTotalContas.Clear;
      frmRenegociacaoContas.edtTotalJuros.Clear;
      frmRenegociacaoContas.edtTotalDevido.Clear;
      while not frmRenegociacaoContas.cdsContas.eof do
      begin
        frmRenegociacaoContas.edtTotalJuros.Value := frmRenegociacaoContas.edtTotalJuros.Value +
          frmRenegociacaoContas.cdsContasJUROSMULTA.value;
        frmRenegociacaoContas.cdsContas.Next;
      end;
      frmRenegociacaoContas.edtTotalContas.value := frmRenegociacaoContas.cdsContasSOMAVALOR.VAlue;
      frmRenegociacaoContas.edtTotalDevido.value := frmRenegociacaoContas.edtTotalContas.value + frmRenegociacaoContas.edtTotalJuros.Value;
      frmRenegociacaoContas.edtValor.Value := frmRenegociacaoContas.edtTotalDevido.value;
      frmRenegociacaoContas.cdsContas.First;
      Clipboard.AsText := frmRenegociacaoContas.cdsContas.CommandText;
      frmRenegociacaoContas.gridContas.DataSource := frmRenegociacaoContas.dsRenegociacao;
      close;
    end;
  end;

end;

procedure TfrmSelecionarContas.cdsContasCalcFields(DataSet: TDataSet);
begin
  if cdsContasdtvenc.AsDateTime < date then
    cdsContasATRASO.Value := F.DiasEntreDatas(cdsContasdtvenc.Text,datetostr(date))
  else cdsContasATRASO.Value := -1 * F.DiasEntreDatas(datetostr(date),cdsContasdtvenc.Text);
end;

procedure TfrmSelecionarContas.Desmarcartodasascontas1Click(
  Sender: TObject);
begin
  if cdsContas.active = false then abort;
  cdsContas.first;
  while not cdsContas.eof do
  begin
    cdsContas.edit;
    cdsContasAUXSELECAO.Value := 'N';
    cdsContas.post;
    cdsContas.next;
  end;
end;

procedure TfrmSelecionarContas.pesquisaContas;
var
  dataini, datafim,sql1: string;
begin
  try
    strtodate(edtDatainicial.text);
    strtodate(edtDatafinal.text);
    dataini := FormatDateTime('yyyy/mm/dd',edtDatainicial.Date);
    datafim := FormatDateTime('yyyy/mm/dd',edtDatafinal.Date);
//    cdsContas.close;
    if edtNroDocumento.text <> '' then sql1:=sql1 + ' AND notcon LIKE ' + QuotedStr(edtNroDocumento.text);
    if edtTitulo.text <> '' then sql1:=sql1 + ' AND titulo LIKE ''%'+ edtTitulo.text+'%''';
    if edtFornecedor.text <> '' then sql1:=sql1 + ' AND cdclfo = ' + QuotedStr(edtFornecedor.text);
    if edtCliente.text <> '' then sql1:=sql1 + ' AND cdclfo = ' + QuotedStr(edtCliente.text);
    if cbTodasDatas.checked = true then sql1:= sql1 + ' AND (DTVENC >= ''' + dataini + ''' AND DTVENC <=''' + datafim + ''')';
    case CodigoForm of
      1,2{,4}:sql1 := sql1 + ' AND valpag = 0';
      {3:begin
        dts_contapagar.CommandText := dts_contapagar.CommandText + ' AND TOTALPAGO = 0';
        dts_contapagar.CommandText := dts_contapagar.CommandText + ' AND (CDCONTAPAGAR <> -1';
        frmPagamentoContas.cdsFiltroContaPagar.first;
        while not frmPagamentoContas.cdsFiltroContaPagar.eof do
        begin
          dts_contapagar.CommandText :=
            dts_contapagar.CommandText + ' AND CDCONTAPAGAR <> ' + inttostr(frmPagamentoContas.cdsFiltroContaPagarCDCONTAPAGAR.value);
          frmPagamentoContas.cdsFiltroContaPagar.next;
        end;
        dts_contapagar.CommandText := dts_contapagar.CommandText + ')';
      end;}
    end;
    sql1 := sql1 + ' order by DTVENC';
//    cdsContas.open;
    if Tipo = 'P' then
      SQL.executaSQlPorEmp(cdsContas,'*','conta',' and tipcon=''P'' '+sql1)
    else if Tipo = 'R' then
      SQL.executaSQlPorEmp(cdsContas,'*','conta',' and tipcon=''R'' '+sql1)
  except

  end;

end;

procedure TfrmSelecionarContas.FormShow(Sender: TObject);
begin
  if tipo = 'P' then
  begin
     gridContas.Columns[0].FieldName := 'procuraFornecedor';
     gridContas.columns[0].Title.Caption := 'Fornecedor';
     lbl_funcionario.Caption := 'Seleção de Contas a Pagar';
     edtFornecedor.Visible := true;
     lbNomeCliente.Caption := 'Fornecedor';
  end else
  begin
     gridContas.Columns[0].FieldName := 'procuraCliente';
     gridContas.columns[0].Title.Caption := 'Cliente';
     lbl_funcionario.Caption := 'Seleção de Contas a Receber';
     lbNomeCliente.Caption := 'Cliente';
     edtCliente.Visible:= true;
  end;
  
  PesquisaContas;

  if CodigoForm = 2 then
  begin
    cdsContas.Close;
  end;
end;

procedure TfrmSelecionarContas.gridContasDrawColumnCell(Sender: TObject;
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


  If cdsContassemdup.Value = 'S' then // condição
    gridContas.Canvas.Brush.Color := $00BCC4FA; 
  gridContas.DefaultDrawDataCell(Rect, gridContas.columns[datacol].field, State);

  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = dbckbx_baixa.DataField) then
    begin
      dbckbx_baixa.Left := Rect.Left + gridContas.Left + 2;
      dbckbx_baixa.Top := Rect.Top + gridContas.top + 2;
      dbckbx_baixa.Width := Rect.Right - Rect.Left;
      dbckbx_baixa.Height := Rect.Bottom - Rect.Top;
      // Tornando o DBCheckBox visível
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
  if (Column.Field.FieldName = 'ATRASO') then
  begin
    if Column.Field.AsInteger > 0 then
    begin
      gridContas.Canvas.Font.Color:= clred;
      gridContas.Canvas.FillRect(Rect);
      gridContas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end else
    begin
      gridContas.Canvas.Font.Color:= clgreen;
      gridContas.Canvas.FillRect(Rect);
      gridContas.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
end;

procedure TfrmSelecionarContas.gridContasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then Exit;
  if (gridContas.SelectedField.FieldName = dbckbx_baixa.DataField) then
  begin
    dbckbx_baixa.SetFocus;
    SendMessage(dbckbx_baixa.Handle, WM_Char, word(Key), 0);
  end;
end;

procedure TfrmSelecionarContas.gridContasTitleClick(Column: TColumn);
begin
  F.OrdenaClientDataSet(cdsContas,Column.Field);
end;

procedure TfrmSelecionarContas.Marcartodasascontas1Click(Sender: TObject);
begin
  if cdsContas.active = false then abort;
  cdsContas.first;
  while not cdsContas.eof do
  begin
    cdsContas.edit;
    cdsContasAUXSELECAO.Value := 'S';
    cdsContas.post;
    cdsContas.next;
  end;
end;

procedure TfrmSelecionarContas.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSelecionarContas.gridContasColExit(Sender: TObject);
begin
   if gridContas.SelectedField.FieldName = dbckbx_baixa.DataField then
    dbckbx_baixa.Visible := False;
end;

procedure TfrmSelecionarContas.Button1Click(Sender: TObject);
begin
  if (CodigoForm = 2)  then
  begin
     if (edtCliente.Text = '') and (Tipo='R') then
     begin
         f.Mensagem(false,'Preencha Cliente!');
         abort;
     end;
     if (edtFornecedor.Text = '') and (Tipo='P') then
     begin
         f.Mensagem(false,'Preencha Fornecedor!');
         abort;
     end;
  end;
  pesquisaContas;
end;

procedure TfrmSelecionarContas.edtClienteChange(Sender: TObject);
begin
    edtNomePessoa.Text := dm.cdsClinome.AsString;
end;

procedure TfrmSelecionarContas.edtClienteExit(Sender: TObject);
begin
    if edtCliente.Text <> '' then
    begin
      SQL.executaSQlPorEmp(dm.cdsAux,'*','clien','and cdclie='+
      QuotedStr(edtCliente.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          edtCliente.Text:= '';
          edtNomePessoa.Text := '';
          f.Mensagem(false,'Cliente Não Existe!');
      end;
    end;
end;

end.
