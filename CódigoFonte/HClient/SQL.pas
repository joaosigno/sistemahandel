unit SQL;

interface

uses DBClient, SysUtils, untDeclaracoes;

type
  TSQL = class
      function proxCod(cds:TClientDataSet;field:String;Tabela:String):String;
      procedure executaSql(cds:TClientDataSet;sql:String);
      procedure executaSQlPorEmp(cds:TClientDataSet;Fields:String;Tabela:String;SQl:String);
      private
        f:TFuncoes;
  end;

implementation

uses untPrincipal, untDM;

{ TSQL }

function TSQL.proxCod(cds: TClientDataSet; field, Tabela: String): String;
var cod: integer;
    numero: String;
begin
    numero:='';
    cod:=0;
    executaSql(cds,'select max('+field+') as cod from '+tabela+' where cdempr='+
        IntToStr(frmPrincipal.Configuracao.EmpresaCodigo)); 
    if cds.FieldByName('Cod').AsInteger < 900000 then
    begin
        Result := IntToStr(frmPrincipal.Configuracao.EmpresaCodigo)+'00000001';
    end else
    begin
        cod:= cds.FieldByName('cod').AsInteger;
        cod:= cod + 1;
        numero:= IntToSTr(cod);
        cod:= StrToInt(Copy(numero,8,9));
        Result:= IntToSTr(frmPrincipal.Configuracao.EmpresaCodigo)+Format('%8.8d',[(cod)]);
    end;

end;

procedure TSQL.executaSql(cds:TClientDataSet;sql:String);
{
  executa um sql
}
begin
    try
      cds.Close;
      cds.CommandText := sql;
      cds.Open;
    except
      on e:Exception do
          f.Mensagem(false,'Erro: '+e.Message);
    end;
end;

procedure TSQL.executaSQlPorEmp(cds: TClientDataSet; Fields, Tabela, SQl: String);
{
  executa um sql
}
begin
    try
      cds.Close;
      cds.CommandText := 'select '+fields+' from '+tabela+' where cdempr='+
            IntToStr(frmPrincipal.Configuracao.EmpresaCodigo)+' '+sql;
      cds.Open;
    except
      on e:Exception do
          f.Mensagem(true,'Erro: '+e.Message);
    end;
end;

end.
