unit untVisualizaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, Grids, DBGrids, StdCtrls, ImgList, ComCtrls,
  ToolWin, DbClient, DAO, Formulario, SQL, ComObj, untDeclaracoes;

type

  TVizualizaDadoDAO = class(TDao)
          FFormularioManutencao : String;
          FTabela : String;
          procedure showForm(lblVizualizaDados:String;cds:TClientDataSet;
                    FormManutencao:String;campos:String;tabela:string;sql:string);
  end;

  TfrmVizualizaDados = class(TForm)
    grid: TDBGrid;
    pnlVizualizaDados: TPanel;
    dataSource: TDataSource;
    Label3: TLabel;
    lblregistros: TLabel;
    ToolBar1: TToolBar;
    tbAdicionar: TToolButton;
    tbEditar: TToolButton;
    tbExcluir: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    imgVizualizaDados: TImageList;
    lblVizualizaDados: TLabel;
    pnlPesquisa: TPanel;
    imgPesquisar: TImage;
    Label2: TLabel;
    tmVizualizaDados: TTimer;
    cdsVizualizaDados: TClientDataSet;
    tbExcel: TToolButton;
    ToolButton2: TToolButton;
    procedure gridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure tbAdicionarClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmVizualizaDadosTimer(Sender: TObject);
    procedure gridTitleClick(Column: TColumn);
    procedure gridDblClick(Sender: TObject);
    procedure tbExcelClick(Sender: TObject);
  private
    F: TFuncoes;
    procedure showFormManutencao;
    procedure geraExcel(cds:TClientDataSet);
  { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVizualizaDados: TfrmVizualizaDados;
  VD : TVizualizaDadoDAO;

implementation

uses untDM, untPrincipal, untManutencao, untPesquisaRapida,
  untManuFornecedores;

{$R *.dfm}

procedure TfrmVizualizaDados.gridDrawColumnCell(Sender: TObject;
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

procedure TfrmVizualizaDados.tbAdicionarClick(Sender: TObject);
begin
  VD.inserir;
  showFormManutencao;
end;

procedure TfrmVizualizaDados.tbEditarClick(Sender: TObject);
begin
  VD.editar;
  showFormManutencao;
end;

procedure TfrmVizualizaDados.tbExcluirClick(Sender: TObject);
begin
    case MessageDlg('ATEN��O: Deseja Excluir!' + #13 + 'o dado da tabela?',
                                        mtConfirmation ,[mbYes,mbNo], 0) of
        mryes:  VD.excluir;
        mrno: VD.cancelar;
     end;
end;

procedure TfrmVizualizaDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vd.Free;
  frmVizualizaDados.free;
end;

procedure TfrmVizualizaDados.showFormManutencao;
var
   fc: TFormClass;
   f: TForm;
begin
     fc:= TFormClass (FindClass (vd.FFormularioManutencao));
     f:= fc.Create (Application);
     f.ShowModal;
     f.Free;
end;

procedure TfrmVizualizaDados.imgPesquisarClick(Sender: TObject);
begin
  frmPesquisaRapida := TfrmPesquisaRapida.Create(Application);
  frmPesquisaRapida.pesq := vd.FTabela;
  frmPesquisaRapida.ShowModal;
end;

procedure TfrmVizualizaDados.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
      VK_F7:
        imgPesquisar.OnClick(Sender);
    end;
end;

procedure TfrmVizualizaDados.tmVizualizaDadosTimer(Sender: TObject);
begin
  cdsVizualizaDados.Close;
  cdsVizualizaDados.Open;
  lblregistros.Caption := Format('%9.9d',[(cdsVizualizaDados.RecordCount)]);
end;

procedure TfrmVizualizaDados.gridTitleClick(Column: TColumn);
var
    campo:string;
begin
    campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
    application.processmessages; // para considerar algo que aconte�a no dbgrid durante a entrada nesta procedure
    if vd.FTabela = 'empre' then
    begin
      vd.SQL.executaSql(vd.BancoNavegacao,'select * from empre order by '+campo);
    end else
    if vd.FTabela = 'banco' then
    begin
      vd.SQL.executaSql(vd.BancoNavegacao,'select * from banco order by '+campo);
    end else
    begin
      vd.SQL.executaSQlPorEmp(vd.BancoNavegacao,'*',vd.FTabela,' order by '+ campo);
    end;
End;

{ TVizualizaDadoDAO }

procedure TVizualizaDadoDAO.showForm(lblVizualizaDados: String;
  cds: TClientDataSet; FormManutencao: String; campos, tabela, sql: string);
begin
  Vd := TVizualizaDadoDAO.Create(cds);
  vd.FTabela := tabela;
  frmVizualizaDados := TfrmVizualizaDados.Create(Application);
  FormDAO := TFormulario.Create(tabela);
  formDAO.montaGrid();
  frmVizualizaDados.Caption := lblVizualizaDados;
  frmVizualizaDados.lblVizualizaDados.Caption := lblVizualizaDados;
  frmVizualizaDados.dataSource.DataSet := cds;
  if (vd.FTabela = 'empre') or (vd.FTabela = 'banco')  then
  begin
    vd.SQL.executaSql(cds,'select '+campos+' from '+tabela
                      +' '+sql);
    vd.SQL.executaSql(frmVizualizaDados.cdsVizualizaDados,'select '+campos+' from '+tabela
                      +' '+sql);
  end else
  begin
    VD.SQL.executaSQlPorEmp(cds,campos,vd.FTabela,sql);
    vd.SQL.executaSQlPorEmp(frmVizualizaDados.cdsVizualizaDados,campos,vd.FTabela,sql);
  end;  
  vd.FFormularioManutencao := FormManutencao;
  frmVizualizaDados.show;
end;

procedure TfrmVizualizaDados.gridDblClick(Sender: TObject);
begin
  VD.editar;
  showFormManutencao;
end;

procedure TfrmVizualizaDados.geraExcel(cds: TClientDataSet);
var coluna, linha: integer;excel: variant;valor: string;
begin
   try
      excel:=CreateOleObject('Excel.Application');
      excel.Workbooks.add(1);
   except
      f.Mensagem(false,'Vers�o do Ms-Excel Incompat�vel!');
   end;
   Cds.First;
   try
     for linha:=0 to Cds.RecordCount-1 do
     begin
        for coluna:=1 to CDS.FieldCount do // eliminei a coluna 0 da rela��o doExcel
        begin
           valor:= CDS.Fields[coluna-1].AsString;
           excel.cells [linha+2,coluna]:=valor;
        end;
     cds.Next;
     end;
     for coluna:=1 to Cds.FieldCount do // eliminei a coluna 0 da rela��o do Excel
     begin
        valor:= cds.Fields[coluna-1].DisplayLabel;
        excel.cells[1,coluna]:=valor;
     end;
     excel.columns.AutoFit; // esta linha � para fazer com que o Excel dimencione asc�lulas adequadamente.
     excel.visible:=true;
   except
      f.Mensagem(false,'Aconteceu um erro desconhecido durante aconvers�o'+
              'da tabela para o Ms-Excel');
   end;
end;

procedure TfrmVizualizaDados.tbExcelClick(Sender: TObject);
begin
   geraExcel(vd.BancoNavegacao);
end;

end.

