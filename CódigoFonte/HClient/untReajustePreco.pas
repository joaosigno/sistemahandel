unit untReajustePreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ToolEdit, Mask, CurrEdit, ExtCtrls,
  wwdblook, Wwdbdlg, SQL, untDeclaracoes, DAO;

type
  TfrmReajustePreco = class(TForm)
    gridProdutos: TDBGrid;
    dsProd: TDataSource;
    btn_VisualizarDados: TButton;
    btn_Reajuste: TButton;
    btn_fechar: TButton;
    Bevel1: TBevel;
    Label12: TLabel;
    rbVenda: TRadioButton;
    edtReajuste: TRxCalcEdit;
    Label15: TLabel;
    cbGrade: TCheckBox;
    rbCusto: TRadioButton;
    lbl_rota: TLabel;
    Image1: TImage;
    Label1: TLabel;
    pesquisaGrupo: TwwDBLookupComboDlg;
    lblgrupo: TLabel;
    Label2: TLabel;
    pesquisaMarca: TwwDBLookupComboDlg;
    lblMarca: TLabel;
    Label3: TLabel;
    lblFornecedor: TLabel;
    pesquisaFornecedor: TwwDBLookupComboDlg;
    rbAcrescimo: TCheckBox;
    rbDesconto: TCheckBox;
    Label4: TLabel;
    cbTipo: TComboBox;
    procedure btn_fecharClick(Sender: TObject);
    procedure gridProdutosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure pesquisaGrupoChange(Sender: TObject);
    procedure pesquisaMarcaChange(Sender: TObject);
    procedure pesquisaFornecedorChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_VisualizarDadosClick(Sender: TObject);
    procedure btn_ReajusteClick(Sender: TObject);
    procedure rbAcrescimoClick(Sender: TObject);
    procedure rbDescontoClick(Sender: TObject);
  private
  SQL : TSQL;
  F : TFuncoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReajustePreco: TfrmReajustePreco;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

procedure TfrmReajustePreco.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReajustePreco.gridProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clblack; //aqui � definida a cor da fonte sem a selecao
  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color:=$000080FF; //aqui � definida a cor de sele��o
      TDbGrid(Sender).Canvas.font.Color:= clwindow; //aqui � definida a cor da fonte com a selecao
      TDbGrid(Sender).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [FSBOLD]; //aqui � definida a a fonte negrito com a selecao
      FillRect(Rect);
    end;

    TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmReajustePreco.FormCreate(Sender: TObject);
begin
  dm.cdsProd.Close;
  dsProd.DataSet := dm.cdsProd;
  dm.cdsGRPro.Open;
  dm.cdsMcPro.Open;
  dm.cdsFor.Open;
  pesquisaGrupo.LookupTable := dm.cdsGRPro;
  pesquisaMarca.LookupTable := dm.cdsMcPro;
  pesquisaFornecedor.LookupTable := dm.cdsFor;
end;

procedure TfrmReajustePreco.pesquisaGrupoChange(Sender: TObject);
begin
   lblgrupo.Caption := dm.cdsGRProdescri.AsString;
end;

procedure TfrmReajustePreco.pesquisaMarcaChange(Sender: TObject);
begin
     lblMarca.Caption := dm.cdsMcProdescri.AsString;
end;

procedure TfrmReajustePreco.pesquisaFornecedorChange(Sender: TObject);
begin
  lblFornecedor.Caption := dm.cdsFornmfant.AsString;
end;

procedure TfrmReajustePreco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.cdsGRPro.Close;
  dm.cdsMcPro.Close;
  dm.cdsFor.Close;
end;

procedure TfrmReajustePreco.btn_VisualizarDadosClick(Sender: TObject);
var strsql : string;
begin
  strsql := 'select * from produ where cdempr='+IntToStr(frmPrincipal.Configuracao.EmpresaCodigo);

  if (pesquisaGrupo.Text <> '') then
    strsql := strsql +' and cdgrup='+QuotedStr(pesquisaGrupo.Text);
  if (pesquisaMarca.Text <> '') then
    strsql := strsql +' and cdmarc='+QuotedStr(pesquisaMarca.Text);
  if (pesquisaFornecedor.Text <> '') then
    strsql := strsql +' and cdforn='+QuotedStr(pesquisaFornecedor.Text);

  if (cbTipo.Text = 'Produto') then
    strsql := strsql +' and tipopr=''P''';

 if (cbTipo.Text = 'Servi�o') then
    strsql := strsql +' and tipopr=''S'''; 

   strsql := strsql + ' order by cdprod';

  sql.executaSql(dm.cdsProd,strsql);

  if dm.cdsProd.RecordCount >0 then
  begin
     btn_Reajuste.Enabled := true;
  end else btn_Reajuste.Enabled := false;
end;

procedure TfrmReajustePreco.btn_ReajusteClick(Sender: TObject);
var ProAlt : integer;
begin
  ProAlt := 0;
  if (rbVenda.Checked) or (rbCusto.Checked) then
  begin
    if edtReajuste.Value = 0 then
    begin
      f.Mensagem(false,'Voc� precisa preencher o campo de percentual de reajuste!');
      abort;
    end;
    if MessageDlg('Voc� tem certeza que quer efetuar o reajuste de pre�os?', mtConfirmation, [mbyes,mbno], 0) = mryes then
    begin
      dm.cdsProd.First;
      while not dm.cdsProd.eof do
      begin
         dm.cdsProd.Edit;
        if (rbVenda.checked) and (rbacrescimo.Checked) then dm.cdsProdpreven.Value :=
                         StrToFloat(FormatFloat('0.00',(dm.cdsProdpreven.Value / 100) * (100 + edtReajuste.Value)))
        else if (rbVenda.checked) and (rbdesconto.Checked) then dm.cdsProdpreven.Value :=
                         StrToFloat(FormatFloat('0.00',(dm.cdsProdpreven.Value / 100) * (100 - edtReajuste.Value)))
        else if (rbCusto.checked) and (rbacrescimo.Checked) then dm.cdsProdprecus.Value :=
                         StrToFloat(FormatFloat('0.00',(dm.cdsProdprecus.Value / 100) * (100 + edtReajuste.Value)))
        else if (rbCusto.checked) and (rbdesconto.Checked) then dm.cdsProdprecus.Value :=
                          StrToFloat(FormatFloat('0.00',(dm.cdsProdprecus.Value / 100) * (100 - edtReajuste.Value)));
        dm.cdsProd.Post;
        if cbGrade.Checked then
        begin
          SQL.executaSQlPorEmp(dm.cdsSequenciais,'*','sqpro',' and cdprod='+IntToStr(dm.cdsProdcdprod.Value));
          dm.cdsSequenciais.first;
          while not dm.cdsSequenciais.eof do
          begin
            dm.cdsSequenciais.edit;
            if (rbVenda.checked) and (rbAcrescimo.Checked) then dm.cdsSequenciaispreven.Value := StrToFloat(FormatFloat('0.00',(dm.cdsSequenciaispreven.Value / 100) * (100 + edtReajuste.Value)))
            else if (rbVenda.checked) and (rbDesconto.Checked) then dm.cdsSequenciaispreven.Value := StrToFloat(FormatFloat('0.00',(dm.cdsSequenciaispreven.Value / 100) * (100 - edtReajuste.Value)))
            else if (rbCusto.checked) and (rbAcrescimo.Checked) then dm.cdsSequenciaisprecus.Value := StrToFloat(FormatFloat('0.00',(dm.cdsSequenciaisprecus.Value / 100) * (100 + edtReajuste.Value)))
            else if (rbCusto.checked) and (rbDesconto.Checked) then dm.cdsSequenciaisprecus.Value := StrToFloat(FormatFloat('0.00',(dm.cdsSequenciaisprecus.Value / 100) * (100 - edtReajuste.Value)));
            dm.cdssequenciais.post;
            dm.cdssequenciais.next;
          end;
        end;
        if cbGrade.Checked then
        begin
           dm.cdsSequenciais.ApplyUpdates(0);
        end;   
        ProAlt := ProAlt+1;
        dm.cdsProd.Next;
      end;
      dm.cdsProd.ApplyUpdates(0);
     MessageDlg('Reajuste de pre�os completo !' + #13 + #13 + 'Foram atualizados: ' + inttostr(ProAlt) + ' registro(s).', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmReajustePreco.rbAcrescimoClick(Sender: TObject);
begin
    rbDesconto.checked := not rbAcrescimo.checked;
end;

procedure TfrmReajustePreco.rbDescontoClick(Sender: TObject);
begin
    rbAcrescimo.checked := not rbDesconto.checked;
end;

end.
