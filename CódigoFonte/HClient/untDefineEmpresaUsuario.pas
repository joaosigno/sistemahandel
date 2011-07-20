unit untDefineEmpresaUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, DBCtrls,
  StdCtrls, Mask, untDeclaracoes, ExtCtrls, RxDBComb;

type
  TfrmManuDefineEmpresaUsuario = class(TfrmManutencao)
    pgUsuario: TPageControl;
    tsInicio: TTabSheet;
    Label1: TLabel;
    dbeCodEmpr: TDBEdit;
    Label2: TLabel;
    dbeCodFunc: TDBEdit;
    dblcbFunc: TDBLookupComboBox;
    dbecbEmpresa: TDBLookupComboBox;
    Label3: TLabel;
    dbcbLogin: TDBComboBox;
    dbcbxPessoaJuridica: TDBCheckBox;
    imgPesquisar: TImage;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeCodEmprExit(Sender: TObject);
    procedure dbeCodEmprKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodFuncKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodFuncExit(Sender: TObject);
    procedure imgPesquisarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    F : TFuncoes;
    procedure verificaInsercao;
    function verificaDadosAntesGravar:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuDefineEmpresaUsuario: TfrmManuDefineEmpresaUsuario;

implementation

uses  untDM, untPrincipal, untPesquisaRapida;

{$R *.dfm}

procedure TfrmManuDefineEmpresaUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuDefineEmpresaUsuario.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsUsu);
  inherited;
  DataSource.DataSet := dm.cdsUsu;  
end;

function TfrmManuDefineEmpresaUsuario.verificaDadosAntesGravar: Boolean;
begin
  if dbeCodFunc.Text = '' then
   begin
      f.Mensagem(false,'Preencha Funcion�rio!');
      result:= false;
   end else result:=true;
   if dbeCodEmpr.Text = '' then
   begin
      f.Mensagem(false,'Preencha Empresa!');
      result:= false;
   end else result:=true;
   if dm.cdsUsuuciduser.AsInteger = 1then
   begin
      f.Mensagem(false,'N�o pode Alterar Usu�rio Handel!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuDefineEmpresaUsuario.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgUsuario,0);
     dbeCodFunc.SetFocus;
     dbeCodEmpr.Text := IntToStr(frmPrincipal.Configuracao.EmpresaCodigo);
  end;
end;

procedure TfrmManuDefineEmpresaUsuario.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuDefineEmpresaUsuario.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  inherited;
end;

procedure TfrmManuDefineEmpresaUsuario.dbeCodEmprExit(Sender: TObject);
begin
  if dbeCodEmpr.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','empre','and cdempr='+
      QuotedStr(dbeCodEmpr.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsUsucdempr.AsString:= '';
          f.Mensagem(false,'Empresa N�o Existe!');
      end;
    end; 

end;

procedure TfrmManuDefineEmpresaUsuario.dbeCodEmprKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;

end;

procedure TfrmManuDefineEmpresaUsuario.dbeCodFuncKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuDefineEmpresaUsuario.dbeCodFuncExit(Sender: TObject);
begin
   if dbeCodFunc.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','funci','and cdfunc='+
      QuotedStr(dbeCodFunc.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsUsucdfunc.AsString:= '';
          f.Mensagem(false,'Funcion�rio N�o Existe!');
      end;
    end;

end;

procedure TfrmManuDefineEmpresaUsuario.imgPesquisarClick(Sender: TObject);
begin
  frmPesquisaRapida := TfrmPesquisaRapida.Create(Application);
  frmPesquisaRapida.pesq := 'defineempresausuario';
  frmPesquisaRapida.ShowModal;
end;

procedure TfrmManuDefineEmpresaUsuario.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    case Key of
      VK_F7:
        imgPesquisar.OnClick(Sender);
    end;

end;

end.
