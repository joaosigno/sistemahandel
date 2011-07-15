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
  try
     FBancoNavegacao.Open;
  except
     on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.cancelar;
begin
  try
     FBancoNavegacao.Cancel;
  except
     on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
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
  try
     FBancoNavegacao.Edit;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.excluir;
begin
  try
    FBancoNavegacao.Delete;
    FBancoNavegacao.ApplyUpdates(-1);
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.fecharBancoNavegacao;
begin
  try
     FBancoNavegacao.Close;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.gravar;
begin
  try
    FBancoNavegacao.ApplyUpdates(0);
    FBancoNavegacao.refresh;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;        
end;

procedure TDao.inserir;
begin
  try
    FBancoNavegacao.Append;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.NAnterior;
begin
  try
    FBancoNavegacao.Prior;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.NPrimeiro;
begin
  try
    FBancoNavegacao.First;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.NProximo;
begin
  try
    FBancoNavegacao.Next;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

procedure TDao.NUltimo;
begin
  try
    FBancoNavegacao.Last;
  except
    on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
  end;
end;

end.
