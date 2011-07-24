unit DAO;

interface

uses DBClient, SQL, DB, Classes, SqlExpr, inifiles, Forms, SysUtils,
     untDeclaracoes;

type
  TDao = class
     constructor Create(BancoNavegacao: TClientDataSet);
     destructor Destroy();
     procedure inserir();
     procedure gravar();
     procedure excluir();
     procedure editar();
     procedure cancelar();
     procedure NPrimeiro();
     procedure NAnterior();
     procedure NProximo();
     procedure NUltimo();
     procedure AbrirBancoNavegacao();
     procedure fecharBancoNavegacao();
     private
         FBancoNavegacao : TClientDataSet;
     protected

     public
         F : TFuncoes;
         SQL : TSQL;
         property BancoNavegacao : TClientDataSet read FBancoNavegacao write FBancoNavegacao;
  end;

   TFornecedor = class(TDAO)
    
  end;

var D : TDao;  

implementation

{ TDao }

procedure TDao.AbrirBancoNavegacao;
begin
     FBancoNavegacao.Open;
end;

procedure TDao.cancelar;
begin
     FBancoNavegacao.Cancel;
end;

constructor TDao.Create(BancoNavegacao: TClientDataSet);
begin
  FBancoNavegacao := BancoNavegacao;
  AbrirBancoNavegacao;
  SQL := TSQL.Create;
end;

destructor TDao.Destroy();
begin
  fecharBancoNavegacao;
  FBancoNavegacao := nil;
  SQl.Destroy;
end;

procedure TDao.editar;
begin
     FBancoNavegacao.Edit;

end;

procedure TDao.excluir;
begin
  FBancoNavegacao.Delete;
  FBancoNavegacao.ApplyUpdates(0);
end;

procedure TDao.fecharBancoNavegacao;
begin
     FBancoNavegacao.Close;
end;

procedure TDao.gravar;
begin
    FBancoNavegacao.ApplyUpdates(0);
    FBancoNavegacao.refresh;
end;

procedure TDao.inserir;
begin
    FBancoNavegacao.Append;
end;

procedure TDao.NAnterior;
begin
    FBancoNavegacao.Prior;
end;

procedure TDao.NPrimeiro;
begin
    FBancoNavegacao.First;
end;

procedure TDao.NProximo;
begin
    FBancoNavegacao.Next;
end;

procedure TDao.NUltimo;
begin
    FBancoNavegacao.Last;
end;

end.
