unit untDeclaracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, XPStyleActnCtrls, ActnList, ActnMan,
  StdActns, ComCtrls, ToolWin, ActnCtrls, ActnMenus, StdCtrls,
  jpeg, DB, DBCtrls, Mask, Grids, inifiles,
  StdStyleActnCtrls, Winsock, SqlTimSt, DBClient, UrlMon, ShellApi,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  xmldom, XMLIntf, msxmldom, XMLDoc;


  const

  //Inicio Constantes usadas na função ValorPorExtenso
  Centenas: array[1..9] of string[12]=('cem','duzentos','trezentos','quatrocentos',
                                       'quinhentos','seiscentos','setecentos',
                                       'oitocentos','novecentos');
  Dezenas : array[2..9] of string[10]=('vinte','trinta','quarenta','cinquenta',
                                       'sessenta','setenta','oitenta','noventa');
  Dez     : array[0..9] of string[10]=('dez','onze','doze','treze','quatorze',
                                       'quinze','dezesseis','dezessete',
                                       'dezoito','dezenove');
  Unidades: array[1..9] of string[10]=('um','dois','três','quatro','cinco',
                                       'seis','sete','oito','nove');
  MoedaSingular = 'real';
  MoedaPlural   = 'reais';
  CentSingular  = 'centavo';
  CentPlural    = 'centavos';
  MilhaoSingular= 'milhão';
  MilhaoPlural  = 'milhões';
  BilhaoSingular= 'bilhão';
  BilhaoPlural  = 'bilhões';
  Zero          = 'zero';
  //Fim Constantes usadas na função ValorPorExtenso
type
  TFuncoes = class
  public
    function Codifica(Action, Src: String): String;
    function DataExtenso(Data: TDateTime; tipo: integer): String;
    function DiasEntreDatas(dataini, datafin: string): integer;
    function VerificaCGC(num: string): boolean;
    function VerificaCPF(num: string): boolean;
    function AbreForm(FormClasse: TFormClass; FForm: TForm; wtipo : Word):boolean;
    procedure posicionaPageControl(pg:TPageControl;p:integer);
    function quantRegistro(lbl: TLabel; cds: TClientDataSet;campos:string;tabela:string;sqlComplementar:String):String;
    function checaForm(Form : TForm):Boolean;
    procedure Mensagem(lbl : Boolean; msg : String);
    procedure OrdenaClientDataSet(CDS: TClientDataSet; Campo: TField);
    function Arredondar(Valor: Double; Dec: Integer): Double;
  published
  protected
  private
  end;

implementation

uses untMensagem, untDM, SqlExpr, Formulario, untManutencao, SQL;

procedure TFuncoes.posicionaPageControl(pg:TPageControl;p:integer);
{
  posiciona tabshet do page control
}
begin
    pg.ActivePageIndex := p;
end;

function TFuncoes.AbreForm(FormClasse: TFormClass; FForm: TForm; wtipo : Word):boolean;
{
  Cria e abre o form como modal ou não modal
}
var
  obForm : TObject;
begin
  Try 
    obForm := FForm;
      if (TForm(obForm) = Nil) Or (not TForm(obForm).HandleAllocated) Then begin
      ObForm := FormClasse.Create(Application.MainForm)
    end;
    Case  wtipo of
       1: TForm(obForm).ShowModal;
       2: TForm(obForm).Show;
    end;
  except
      on e:Exception do
        Mensagem(true,'Erro: '+e.Message);
  end;

end;

function TFuncoes.Codifica(Action, Src: String): String;
//Action = C: Criptografa
//Action = D: Descriptografa
Label Fim; //Função para criptografar e descriptografar string's
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;

function TFuncoes.DataExtenso(Data:TDateTime;tipo:integer): String;
{Retorna uma data por extenso}
//tipo 1: "Segunda-Feira, 01 de Janeiro de 2007"
//tipo 2: "Segunda-Feira"
//tipo 3: "Janeiro de 2007"
//tipo 4: "3 de Jan"
//tipo 5: "03 de Janeiro"
//tipo 6: "03"
//tipo 7: "Segunda, 03 de Janeiro"
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  DiaDaSemanaAbr : array [1..7] of String;
  Meses : array [1..12] of String;
  MesesAbreviado : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-Feira';
  DiaDasemana [3]:= 'Terça-Feira';
  DiaDasemana [4]:= 'Quarta-Feira';
  DiaDasemana [5]:= 'Quinta-Feira';
  DiaDasemana [6]:= 'Sexta-Feira';
  DiaDasemana [7]:= 'Sábado';
{ Dias da SemanaAbreviado }
  DiaDasemanaAbr [1]:= 'Domingo';
  DiaDasemanaAbr [2]:= 'Segunda';
  DiaDasemanaAbr [3]:= 'Terça';
  DiaDasemanaAbr [4]:= 'Quarta';
  DiaDasemanaAbr [5]:= 'Quinta';
  DiaDasemanaAbr [6]:= 'Sexta';
  DiaDasemanaAbr [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
{ Meses do ano abreviados }
  MesesAbreviado [1] := 'Jan';
  MesesAbreviado [2] := 'Fev';
  MesesAbreviado [3] := 'Mar';
  MesesAbreviado [4] := 'Abr';
  MesesAbreviado [5] := 'Mai';
  MesesAbreviado [6] := 'Jun';
  MesesAbreviado [7] := 'Jul';
  MesesAbreviado [8] := 'Ago';
  MesesAbreviado [9] := 'Set';
  MesesAbreviado [10]:= 'Out';
  MesesAbreviado [11]:= 'Nov';
  MesesAbreviado [12]:= 'Dez';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  if tipo = 1 then Result := DiaDaSemana[NoDia] + ', ' + IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano)
  else if tipo = 2 then Result := DiaDaSemana[NoDia]
  else if tipo = 3 then Result := Meses[Mes] + ' de ' + IntToStr(Ano)
  else if tipo = 4 then Result := InttoStr(Dia) + ' de ' + MesesAbreviado[Mes]
  else if tipo = 5 then Result := FormatFloat('00',Dia) + ' de ' + Meses[Mes]
  else if tipo = 6 then Result := FormatFloat('00',Dia)
  else if tipo = 7 then Result := DiaDaSemanaAbr[NoDia] + ', ' + FormatFloat('00',Dia) + ' de ' + Meses[Mes];
end;

function TFuncoes.VerificaCGC(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
  try
  n1:=StrToInt(num[1]);
  n2:=StrToInt(num[2]);
  n3:=StrToInt(num[4]);
  n4:=StrToInt(num[5]);
  n5:=StrToInt(num[6]);
  n6:=StrToInt(num[8]);
  n7:=StrToInt(num[9]);
  n8:=StrToInt(num[10]);
  n9:=StrToInt(num[12]);
  n10:=StrToInt(num[13]);
  n11:=StrToInt(num[14]);
  n12:=StrToInt(num[15]);
  d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
  d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
  d2:=11-(d2 mod 11);
  if d2>=10 then d2:=0;
  calculado:=inttostr(d1)+inttostr(d2);
  digitado:=num[17]+num[18];
    if calculado=digitado then
      Result:=true
        else
          Result:=false;
  except
    Result:=false;
  end;
end;

function TFuncoes.VerificaCPF(num: string): boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  try
  n1:=StrToInt(num[1]);
  n2:=StrToInt(num[2]);
  n3:=StrToInt(num[3]);
  n4:=StrToInt(num[5]);
  n5:=StrToInt(num[6]);
  n6:=StrToInt(num[7]);
  n7:=StrToInt(num[9]);
  n8:=StrToInt(num[10]);
  n9:=StrToInt(num[11]);
  d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
  d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:=11-(d2 mod 11);
  if d2>=10 then d2:=0;
  calculado:=inttostr(d1)+inttostr(d2);
  digitado:=num[13]+num[14];
  if calculado=digitado then
    Result:=true
      else
        Result:=false;
  except
    Result:=false;
  end;
end;

function TFuncoes.quantRegistro(lbl: TLabel; cds: TClientDataSet;campos:string;tabela:string;sqlComplementar:String):String;
begin
  dm.executaSqlPorEmpresa(cds,campos,tabela,sqlComplementar);
  lbl.Caption := IntToStr(cds.RecordCount);
  Result := lbl.Caption;
end;

function TFuncoes.checaForm(Form: TForm): Boolean;
var
I:Integer;
begin
    result := false;
    for I := 0 to Screen.FormCount -1 do
    if Screen.Forms[i] = Form then
    begin
    result := true;
    Break;
    end;
end;

procedure TFuncoes.Mensagem(lbl: Boolean; msg: String);
begin
   frmMensagem := TfrmMensagem.Create(Application);
   frmMensagem.lblmsg.visible := lbl;
   frmMensagem.mmMensagem.Lines.Add(msg);
   frmMensagem.ShowModal;
   frmMensagem.Free;
end;

function TFuncoes.DiasEntreDatas(dataini, datafin: string): integer;
var a,b,c:tdatetime;
  ct,s:integer;
begin
  if StrToDate(DataFin) < StrtoDate(DataIni) then
    begin
      Result := 0;
      exit;
    end;
  ct := 0;
  s := 1;
  a := strtodate(dataFin);
  b := strtodate(dataIni);
  if a > b then
    begin
      c := a;
      a := b;
      b := c;
      s := 1;
    end;
  a := a + 1;
  while (dayofweek(a)<>2) and (a <= b) do
    begin
      if dayofweek(a) in [1..7] then
        begin
          inc(ct);
        end;
      a := a + 1;
    end;
  ct := ct + round((7*System.int((b-a)/7)));
  a := a + (7*System.int((b-a)/7));
  while a <= b do
    begin
      if dayofweek(a) in [1..7] then
        begin
          inc(ct);
        end;
      a := a + 1;
    end;
  if ct < 0 then
    begin
      ct := 0;
    end;
  result := s*ct;
end;

procedure TFuncoes.OrdenaClientDataSet(CDS: TClientDataSet; Campo: TField);
var
  nomeindice: string;
  opcoesindice: Tindexoptions;
begin
  if CDS.IndexName = copy('ixasc' + Campo.FieldName,1,30) then
  begin
    NomeIndice := copy('ixdesc' + Campo.FieldName,1,30);
    opcoesindice := [ixDescending, ixCaseInsensitive];
  end else
  begin
    NomeIndice := copy('ixasc' + Campo.FieldName,1,30);
    opcoesindice := [ixCaseInsensitive];
  end;
  try
    if CDS.IndexDefs.IndexOf(NomeIndice) = -1 then
    CDS.IndexDefs.Add(NomeIndice, Campo.FieldName, Opcoesindice);
    CDS.IndexName := NomeIndice;
    CDS.IndexDefs.Update;
    CDS.First;
  except 
  end;
end;

function TFuncoes.Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;
begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=System.Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;

end.


