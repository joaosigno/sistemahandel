unit untManutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ImgList, DB, Dao, DBCLient;

type

  TManutencaoDAO = class(TDao)
       
  end;

  TfrmManutencao = class(TForm)
    tbManutencao: TToolBar;
    imManutencao: TImageList;
    tbAnterior: TToolButton;
    tbPrimeiro: TToolButton;
    tbProximo: TToolButton;
    tbUltimo: TToolButton;
    DataSource: TDataSource;
    tbSepardor: TToolButton;
    tbAdicionar: TToolButton;
    tbExcluir: TToolButton;
    tbCancelar: TToolButton;
    tbGravar: TToolButton;
    ToolButton1: TToolButton;
    procedure tbGravarClick(Sender: TObject);
    procedure tbExcluirClick(Sender: TObject);
    procedure tbCancelarClick(Sender: TObject);
    procedure DataSourceStateChange(Sender: TObject);
    procedure tbPrimeiroClick(Sender: TObject);
    procedure tbAnteriorClick(Sender: TObject);
    procedure tbProximoClick(Sender: TObject);
    procedure tbUltimoClick(Sender: TObject);
    procedure tbAdicionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencao: TfrmManutencao;
  ManuDAO : TManutencaoDAO;

implementation

uses untDM, untVisualizaDados, Formulario;

{$R *.dfm}

procedure TfrmManutencao.tbGravarClick(Sender: TObject);
begin
  ManuDAO.gravar;
end;

procedure TfrmManutencao.tbExcluirClick(Sender: TObject);
begin
   case MessageDlg('ATENÇÃO: Deseja Excluir!' + #13 + 'o dado da tabela?', mtConfirmation ,[mbYes,mbNo], 0) of
        mryes: ManuDAO.excluir;
        mrno: ManuDAO.cancelar;
   end;
end;

procedure TfrmManutencao.tbCancelarClick(Sender: TObject);
begin
  ManuDAO.cancelar;
end;

procedure TfrmManutencao.DataSourceStateChange(Sender: TObject);
begin
  if DataSource.State in [dsEdit,dsInsert] then
  begin
      tbAnterior.Enabled := false;
      tbPrimeiro.Enabled := false;
      tbProximo.Enabled := false;
      tbUltimo.Enabled := false;
      tbAdicionar.Enabled := false;
      tbExcluir.Enabled := false;
      tbGravar.Enabled := true;
      tbCancelar.Enabled := true;
  end else
  begin
      tbAnterior.Enabled := true;
      tbPrimeiro.Enabled := true;
      tbProximo.Enabled := true;
      tbUltimo.Enabled := true;
      tbAdicionar.Enabled := true;
      tbExcluir.Enabled := true;
      tbGravar.Enabled := false;
      tbCancelar.Enabled := false;
  end;
end;

procedure TfrmManutencao.tbPrimeiroClick(Sender: TObject);
begin
  ManuDAO.NPrimeiro;
end;

procedure TfrmManutencao.tbAnteriorClick(Sender: TObject);
begin
  ManuDAO.NAnterior;
end;

procedure TfrmManutencao.tbProximoClick(Sender: TObject);
begin
  ManuDAO.NProximo;
end;

procedure TfrmManutencao.tbUltimoClick(Sender: TObject);
begin
  ManuDAO.NUltimo;
end;

procedure TfrmManutencao.tbAdicionarClick(Sender: TObject);
begin
    ManuDAO.inserir;
end;

procedure TfrmManutencao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DataSource.State in [dsEdit] then
  begin
     case MessageDlg('ATENÇÃO: Tem dados não salvos na tabela!' + #13 + 'Deseja salvá-los?', mtConfirmation, mbyesnocancel, 0) of
        mryes: ManuDAO.gravar;
        mrno: ManuDAO.cancelar;
        mrcancel:abort;
     end;
  end;
  ManuDAO.cancelar;
end;

end.
