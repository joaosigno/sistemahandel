unit untManuClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untManutencao, DB, ImgList, ComCtrls, ToolWin, ToolEdit,
  RXDBCtrl, StdCtrls, DBCtrls, Mask, ExtCtrls, Grids, DBGrids, Buttons,untDeclaracoes,
  CurrEdit, DBClient;

type
  TfrmManuClientes = class(TfrmManutencao)
    pgClientes: TPageControl;
    tsBasicos: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    lblnomefantasia: TLabel;
    dbeNome: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbeNaturalde: TDBEdit;
    Label9: TLabel;
    dbeRG: TDBEdit;
    dbeCod: TDBEdit;
    dbcbxPessoaJuridica: TDBCheckBox;
    dbcbSexo: TDBComboBox;
    dbdeDtNascimento: TDBDateEdit;
    dbdateedtdatacadastro: TDBDateEdit;
    dbdeClienteDesd: TDBDateEdit;
    dbcbbxestadocivil: TDBComboBox;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dbeCep: TDBEdit;
    Label12: TLabel;
    dbeEndereco: TDBEdit;
    Label13: TLabel;
    dbeNum: TDBEdit;
    Label14: TLabel;
    dbeCidade: TDBEdit;
    Label15: TLabel;
    dbeBairro: TDBEdit;
    Label16: TLabel;
    dbeUF: TDBComboBox;
    Label17: TLabel;
    dbeTelefone: TDBEdit;
    Label18: TLabel;
    dbeCelular: TDBEdit;
    Label19: TLabel;
    dbeFax: TDBEdit;
    dbcdedtemail: TRxDBComboEdit;
    Label20: TLabel;
    tsFamilia: TTabSheet;
    Label21: TLabel;
    dbeNmPai: TDBEdit;
    Label22: TLabel;
    nmMae: TDBEdit;
    tsEmrpego: TTabSheet;
    Label23: TLabel;
    dbeEmpresa: TDBEdit;
    Label24: TLabel;
    dbeCargo: TDBEdit;
    Label25: TLabel;
    dbeCodProf: TDBEdit;
    dblcdProfi: TDBLookupComboBox;
    Label26: TLabel;
    dbeTelefoneEmp: TDBEdit;
    Label28: TLabel;
    dbeEndereEmpresa: TDBEdit;
    Label27: TLabel;
    dbeCepEmpr: TDBEdit;
    Label29: TLabel;
    bdeBAirroEmpre: TDBEdit;
    Label30: TLabel;
    dbeCIdadeEmpre: TDBEdit;
    Label31: TLabel;
    dbcbUfEmpresaDBComboBox1: TDBComboBox;
    tsReferencia: TTabSheet;
    Label32: TLabel;
    dbeRFC1: TDBEdit;
    Label33: TLabel;
    dbeRFC2: TDBEdit;
    Label34: TLabel;
    dbeRFC3: TDBEdit;
    Label35: TLabel;
    dbeRFP1: TDBEdit;
    Label36: TLabel;
    dbeRFP2: TDBEdit;
    Label37: TLabel;
    dbeRFP3: TDBEdit;
    Bevel2: TBevel;
    tsObs: TTabSheet;
    Label38: TLabel;
    dbmmObs: TDBMemo;
    tsDepAut: TTabSheet;
    Label39: TLabel;
    DbeConjugue: TDBEdit;
    Label40: TLabel;
    dbeTelefoneCOnjugue: TDBEdit;
    Bevel1: TBevel;
    dbcbAtivo: TDBCheckBox;
    tsOutros: TTabSheet;
    Label41: TLabel;
    dbeCodBanco: TDBEdit;
    dblcbBanco: TDBLookupComboBox;
    Label43: TLabel;
    abeAgencia: TDBEdit;
    Label44: TLabel;
    dbeConta: TDBEdit;
    Label42: TLabel;
    Label45: TLabel;
    gridDependentes: TDBGrid;
    gridAutorizados: TDBGrid;
    btnCadaDependentes: TBitBtn;
    dbeCPF: TRxDBComboEdit;
    dbeCodGrupo: TDBEdit;
    Label4: TLabel;
    dblcbGrupo: TDBLookupComboBox;
    Bevel3: TBevel;
    dbeLimite: TRxDBCalcEdit;
    Label46: TLabel;
    Bevel4: TBevel;
    dsAutorizados: TDataSource;
    dsDependentes: TDataSource;
    btnCadAutorizados: TBitBtn;
    btnEditaDependente: TBitBtn;
    btnExclDepe: TBitBtn;
    btnEditAut: TBitBtn;
    btnExcluirAut: TBitBtn;
    Bevel5: TBevel;
    Label47: TLabel;
    dbeCodCartFidelidade: TDBEdit;
    dblcbCartFidelidade: TDBLookupComboBox;
    procedure tbAdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSourceStateChange(Sender: TObject);
    procedure dbcbxPessoaJuridicaExit(Sender: TObject);
    procedure dbeCPFExit(Sender: TObject);
    procedure dbeCPFKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCepKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCelularKeyPress(Sender: TObject; var Key: Char);
    procedure dbeFaxKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelefoneCOnjugueKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodProfKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelefoneEmpKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCepEmprKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodBancoKeyPress(Sender: TObject; var Key: Char);
    procedure tbGravarClick(Sender: TObject);
    procedure dbeNomeExit(Sender: TObject);
    procedure dbeCodProfExit(Sender: TObject);
    procedure dbeCodBancoExit(Sender: TObject);
    procedure dbeCodGrupoExit(Sender: TObject);
    procedure btnCadaDependentesClick(Sender: TObject);
    procedure gridDependentesDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridAutorizadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnCadAutorizadosClick(Sender: TObject);
    procedure btnEditaDependenteClick(Sender: TObject);
    procedure btnExclDepeClick(Sender: TObject);
    procedure btnExcluirAutClick(Sender: TObject);
    procedure btnEditAutClick(Sender: TObject);
    procedure dbeCodCartFidelidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodCartFidelidadeExit(Sender: TObject);
  private
    F:TFuncoes;
    procedure verificaTipoCliente();
    procedure verificaInsercao();
    function verificaDadosAntesGravar():Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuClientes: TfrmManuClientes;

implementation

uses untDM, untPrincipal, untManuDepAut;

{$R *.dfm}

{ TfrmManuClientes }

procedure TfrmManuClientes.verificaInsercao;
begin
  if DataSource.State in [dsInsert] then
  begin
     f.posicionaPageControl(pgClientes,0);
     dbeNome.SetFocus;
  end;
end;

procedure TfrmManuClientes.tbAdicionarClick(Sender: TObject);
begin
  inherited;
  verificaInsercao;
end;

procedure TfrmManuClientes.FormShow(Sender: TObject);
begin
  inherited;
  verificaInsercao;
  verificaTipoCliente;
  if DataSource.State in [dsEdit] then
  begin
    ManuDAO.SQL.executaSQlPorEmp(dm.cdsAutori,'*','depaut',' and cdclien='+QuotedStr(dbeCod.Text)
             +' and tipo=''DP''');
    ManuDAO.SQL.executaSQlPorEmp(dm.cdsDepen,'*','depaut',' and cdclien='+QuotedStr(dbeCod.Text)
            +' and tipo=''AT''');
  end;          
end;

procedure TfrmManuClientes.FormCreate(Sender: TObject);
begin
  ManuDAO := TManutencaoDAO.Create(dm.cdsCli);
  inherited;
  DataSource.DataSet := dm.cdsCli;
  dsAutorizados.DataSet := dm.cdsAutori;
  dsDependentes.DataSet := dm.cdsDepen;
end;

procedure TfrmManuClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ManuDAO.Free;
end;

procedure TfrmManuClientes.DataSourceStateChange(Sender: TObject);
begin
  inherited;
  if DataSource.State in [dsInsert] then
  begin
      pgClientes.Pages[4].TabVisible := false;
  end else pgClientes.Pages[4].TabVisible := true;
end;

procedure TfrmManuClientes.verificaTipoCliente;
begin
  if dbcbxPessoaJuridica.Checked = true then
  begin
    dm.cdsClicpf.EditMask := '99.999.999/9999-99;1; ';
  end else
  begin
    dm.cdsClicpf.EditMask := '999.999.999-99;1; ';
  end;
end;

procedure TfrmManuClientes.dbcbxPessoaJuridicaExit(Sender: TObject);
begin
  verificaTipoCliente;
end;

procedure TfrmManuClientes.dbeCPFExit(Sender: TObject);
begin
 if DataSource.State in [dsInsert] then
  begin
      if dbeCPF.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','Clien',' and cpf='+
        QuotedStr(dbeCPF.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsClicpf.AsString := '';
            f.Mensagem(false,'CPF/CNPJ Ja está Gravado!');
        end;
      end;  
  end;

   if dbcbxPessoaJuridica.Checked = True then
    begin
      if not F.VerificaCGC(dbeCPF.Text) then dm.cdsClicpf.AsString := '';
    end else
    begin
      if not F.VerificaCPF(dbeCPF.Text) then dm.cdsClicpf.AsString := '';
    end;

end;

procedure TfrmManuClientes.dbeCPFKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;

  if dbcbxPessoaJuridica.Checked = True then
  begin
    if not F.VerificaCGC(dbeCPF.Text) then dbeCPF.Color := $004D61EE else dbeCPF.Color := clLime;
  end else
  begin
    if not F.VerificaCPF(dbeCPF.Text) then dbeCPF.Color := $004D61EE else dbeCPF.Color := clLime;
  end;


end;

function TfrmManuClientes.verificaDadosAntesGravar: Boolean;
begin
    if dbeNome.Text = '' then
   begin
      f.Mensagem(false,'Preencha Nome!');
      result:= false;
   end else result:=true;
   if dblcbGrupo.Text = '' then
   begin
     f.Mensagem(false,'Preencha Grupo de Clientes!');
      result:= false;
   end else result:=true;
   if dbeLimite.Text = '' then
   begin
     f.Mensagem(false,'Preencha Limite de Crédito de Clientes!');
      result:= false;
   end else result:=true;
end;

procedure TfrmManuClientes.dbeCepKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeCelularKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeFaxKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeTelefoneCOnjugueKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeCodProfKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeTelefoneEmpKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeCepEmprKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeCodBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
   If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.tbGravarClick(Sender: TObject);
begin
  if verificaDadosAntesGravar = false then
    Abort else
  if DataSource.State in [dsInsert] then
  begin
     dm.cdsClicdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
     dbeCod.Text := ManuDAO.SQL.proxCod(dm.cdsAux,'cdclie','clien');
  end;
  inherited;

end;

procedure TfrmManuClientes.dbeNomeExit(Sender: TObject);
begin
  if DataSource.State IN [dsInsert] then
  begin
      if dbeNome.Text <> '' then
      begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','clien',' and nome='+
        QuotedStr(dbeNome.Text));
        if dm.cdsAux.RecordCount <> 0 then
        begin
            dm.cdsClinome.AsString:= '';
            f.Mensagem(false,'Nome Ja esta Gravado!');
        end;
       end; 
  end;

end;

procedure TfrmManuClientes.dbeCodProfExit(Sender: TObject);
begin
    if dbeCodProf.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','profi','and cdprof='+
      QuotedStr(dbeCodProf.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsClicdprof.AsString:= '';
          f.Mensagem(false,'Profissão Não Existe!');
      end;
    end; 

end;

procedure TfrmManuClientes.dbeCodBancoExit(Sender: TObject);
begin
    if dbeCodBanco.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from banco where cdban='+
      QuotedStr(dbeCodBanco.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsClicdbanc.AsString:= '';
          f.Mensagem(false,'Banco Não Existe!');
      end;
    end;  
end;

procedure TfrmManuClientes.dbeCodGrupoExit(Sender: TObject);
begin
   if dbeCodGrupo.Text <> '' then
    begin
      ManuDAO.SQL.executaSQlPorEmp(dm.cdsAux,'*','grcli','and cdgrup='+
      QuotedStr(dbeCodGrupo.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsClicdbanc.AsString:= '';
          f.Mensagem(false,'Grupo de Clientes Não Existe!');
      end;
    end;

end;

procedure TfrmManuClientes.btnCadaDependentesClick(Sender: TObject);
begin
  dm.executaSqlPorEmpresa(dm.cdsDepen,'*'
                      ,'depaut',' and cdclien='+QuotedStr(dbeCod.Text)+' and tipo=''DP''');
  frmManuDepAut := tfrmManuDepAut.create(application);
  frmManuDepAut.c :=0;
  dm.cdsDepen.Append;
  dm.cdsDepentipo.AsString := 'DP';
  dm.cdsDepencdclien.AsInteger := dm.cdsClicdclie.AsInteger;
  dm.cdsDepencdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
  frmManuDepAut.ShowModal;
  frmManuDepAut.Free;
end;

procedure TfrmManuClientes.gridDependentesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

end;

procedure TfrmManuClientes.gridAutorizadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

end;

procedure TfrmManuClientes.btnCadAutorizadosClick(Sender: TObject);
begin
  dm.executaSqlPorEmpresa(dm.cdsAutori,'*'
                      ,'depaut',' and cdclien='+QuotedStr(dbeCod.Text)+' and tipo=''AT''');
  frmManuDepAut := tfrmManuDepAut.create(application);
  frmManuDepAut.c :=1;
  dm.cdsAutori.Append;
  dm.cdsAutoritipo.AsString := 'AT';
  dm.cdsAutoricdclien.AsInteger := dm.cdsClicdclie.AsInteger;
  dm.cdsAutoricdempr.AsInteger := frmPrincipal.Configuracao.EmpresaCodigo;
  frmManuDepAut.ShowModal;
  frmManuDepAut.Free;

end;

procedure TfrmManuClientes.btnEditaDependenteClick(Sender: TObject);
begin
  dm.cdsDepen.Edit;
  frmManuDepAut := tfrmManuDepAut.create(application);
  frmManuDepAut.c :=0;
  frmManuDepAut.ShowModal;
  frmManuDepAut.Free;

  dm.executaSqlPorEmpresa(dm.cdsDepen,'*'
                      ,'depaut',' and cdclien='+QuotedStr(dbeCod.Text)+' and tipo=''DP''');
end;

procedure TfrmManuClientes.btnExclDepeClick(Sender: TObject);
begin
  case MessageDlg('ATENÇÃO: Deseja Excluir!' + #13 + 'o dado da tabela?', mtConfirmation ,[mbYes,mbNo], 0) of
        mryes:
        begin
          dm.cdsDepen.Delete;
          dm.cdsDepen.ApplyUpdates(0);
        end;
        mrno: dm.cdsDepen.Cancel;
   end;
end;

procedure TfrmManuClientes.btnExcluirAutClick(Sender: TObject);
begin
   case MessageDlg('ATENÇÃO: Deseja Excluir!' + #13 + 'o dado da tabela?', mtConfirmation ,[mbYes,mbNo], 0) of
        mryes:
        begin
          dm.cdsAutori.Delete;
          dm.cdsAutori.ApplyUpdates(0);
        end;
        mrno: dm.cdsAutori.Cancel;
   end;

end;

procedure TfrmManuClientes.btnEditAutClick(Sender: TObject);
begin
  frmManuDepAut := tfrmManuDepAut.create(application);
  frmManuDepAut.c :=1;
  dm.cdsAutori.Edit;
  frmManuDepAut.ShowModal;
  frmManuDepAut.Free;

 dm.executaSqlPorEmpresa(dm.cdsAutori,'*'
                      ,'depaut',' and cdclien='+QuotedStr(dbeCod.Text)+' and tipo=''AT''');
end;

procedure TfrmManuClientes.dbeCodCartFidelidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
    If not( key in['0'..'9',#8] ) then key := #0;
end;

procedure TfrmManuClientes.dbeCodCartFidelidadeExit(Sender: TObject);
begin
  if dbeCodCartFidelidade.Text <> '' then
    begin
      ManuDAO.SQL.executaSql(dm.cdsAux,'select * from crfid where nrcart='+
      QuotedStr(dbeCodCartFidelidade.Text));
      if dm.cdsAux.RecordCount = 0 then
      begin
          dm.cdsClicdcrfi.AsString:= '';
          f.Mensagem(false,'Cartão Fidelidade Não Existe!');
      end;
    end;

end;

end.
