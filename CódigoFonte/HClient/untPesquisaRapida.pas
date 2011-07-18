{Pedro L Saraiva}
unit untPesquisaRapida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, FMTBcd, SqlExpr,
  Provider, DBClient,clipbrd,SQL;

type
  TfrmPesquisaRapida = class(TForm)
    Label2: TLabel;
    Shape1: TShape;
    edtPesquisa: TEdit;
    rb1: TRadioButton;
    rb2: TRadioButton;
    gridPesquisa: TDBGrid;
    btnSeleciona: TButton;
    rb3: TRadioButton;
    StaticText1: TStaticText;
    dsPesquisa: TDataSource;
    rb4: TRadioButton;
    cdsProcuraRapida: TClientDataSet;
    procedure pesquisar;
    procedure btnSelecionaClick(Sender: TObject);
    procedure gridPesquisaDblClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atualizaGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure visible(rb1V:Boolean;rb1Nome:String;rb2V:boolean;
        rb2Nome:String;rb3V:boolean;rb3Nome:String;campos:String;tabela:string;sqlComplementar:String);
    procedure gridPesquisaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    sql : TSQL;
    codQry : integer;
    procedure CodPesquisa();
    { Private declarations }
  public
    pesq : string;
    c : integer;
   { Public declarations }
  end;

var
  frmPesquisaRapida: TfrmPesquisaRapida;

implementation

uses untDM, untPrincipal;

{$R *.dfm}

//0.Fornecedor
//1.Empresa
//2.GruposProdutos
//3.Profissoes
//4.Funcionarios
//5.Departamento
//6.Clientes
//7.Banco
//8.Cartão Fidelidade
//9.Cheque

procedure TfrmPesquisaRapida.pesquisar;
var
auxSQL : String;
{
  Faz o select de acordo com radiobuton selecionado
}
begin
   case c of
   0:
   begin
       if (rb1.Checked) and (edtpesquisa.text <> '') then
            SQL.executaSQlPorEmp(cdsProcuraRapida,'cdforn,nmfant,rzsoci',
                  'forne',' and cdforn='+ QuotedStr(edtPesquisa.Text)+' order by cdforn ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSQlPorEmp(cdsProcuraRapida,'cdforn,nmfant,rzsoci',
                  'forne',' and nmfant like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by nmfant ');

        if (rb3.Checked) and (edtpesquisa.text <> '') then
           SQL.executaSQlPorEmp(cdsProcuraRapida,'cdforn,nmfant,rzsoci',
                  'forne', ' and rzsoci like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by rzsoci ');
  end;
  1:
  begin
      if (rb1.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSql(cdsProcuraRapida,'select cdempr,nmfant,rzsoci from empre'+
                ' where cdempr='+ QuotedStr(edtPesquisa.Text)+' order by cdempr ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSql(cdsProcuraRapida,'select cdempr,nmfant,rzsoci from empre'+
                  ' where nmfant like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by nmfant ');

        if (rb3.Checked) and (edtpesquisa.text <> '') then
           SQL.executaSql(cdsProcuraRapida,'select cdempr,nmfant,rzsoci from empre'+
                  ' where rzsoci like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by rzsoci ');
  end;
  2:
   begin
       if (rb1.Checked) and (edtpesquisa.text <> '') then
            SQL.executaSQlPorEmp(cdsProcuraRapida,'cdgrup,descri',
                  'grPro',' and cdgrup='+ QuotedStr(edtPesquisa.Text)+' order by cdgrup ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSQlPorEmp(cdsProcuraRapida,'cdgrup,descri',
                  'grPro',' and descri like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by descri ');
  end;
  3:
   begin
       if (rb1.Checked) and (edtpesquisa.text <> '') then
            SQL.executaSQlPorEmp(cdsProcuraRapida,'cdprof,descri',
                  'profi',' and cdprof='+ QuotedStr(edtPesquisa.Text)+' order by cdprof ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSQlPorEmp(cdsProcuraRapida,'cdprof,descri',
                  'profi',' and descri like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by descri ');
  end;
   4:
   begin
       if (rb1.Checked) and (edtpesquisa.text <> '') then
            SQL.executaSQlPorEmp(cdsProcuraRapida,'cdfunc,nome',
                  'funci',' and cdfunc='+ QuotedStr(edtPesquisa.Text)+' order by cdfunc ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSQlPorEmp(cdsProcuraRapida,'cdfunc,nome',
                  'funci',' and nome like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by nome ');
  end;
  5:
   begin
       if (rb1.Checked) and (edtpesquisa.text <> '') then
            SQL.executaSQlPorEmp(cdsProcuraRapida,'cddepa,descri',
                  'depar',' and cddepa='+ QuotedStr(edtPesquisa.Text)+' order by cddepa ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSQlPorEmp(cdsProcuraRapida,'cddepa,descri',
                  'depar',' and descri like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by descri ');
  end;
  6:
   begin
       if (rb1.Checked) and (edtpesquisa.text <> '') then
            SQL.executaSQlPorEmp(cdsProcuraRapida,'cdclie,nome',
                  'clien',' and cdclie='+ QuotedStr(edtPesquisa.Text)+' order by cdclie ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSQlPorEmp(cdsProcuraRapida,'cdclie,nome',
                  'clien',' and nome like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by nome ');
  end;
  7:
   begin
        if (rb1.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSql(cdsProcuraRapida,'select cdban,descri from banco'+
                ' where cdban='+ QuotedStr(edtPesquisa.Text)+' order by cdban ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSql(cdsProcuraRapida,'select cdban,descri from banco'+
                  ' where descri like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by descri ');
  end;
  8:
   begin
        if (rb1.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSql(cdsProcuraRapida,'select nrcart,nmcart from crfid'+
                ' where nrcart='+ QuotedStr(edtPesquisa.Text)+' order by nrcart ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSql(cdsProcuraRapida,'select nrcart,nmcart from crfid'+
                  ' where nmcart like '+
                          QuotedStr('%'+edtPesquisa.Text+'%')+' order by nmcart ');
  end;
  9:
   begin
        if (rb1.Checked) and (edtpesquisa.text <> '') then
          //auxSQL := 'PENDENTE';
          SQL.executaSql(cdsProcuraRapida,'select numchq,dtcada,valor,status,cmc7 from cheqs'+
                ' where numchq = '+
                          QuotedStr(edtPesquisa.Text)+' ');

        if (rb2.Checked) and (edtpesquisa.text <> '') then
          SQL.executaSql(cdsProcuraRapida,'select numchq,dtcada,valor,status,cmc7 from cheqs'+
                  ' where cmc7 = '+
                          QuotedStr(edtPesquisa.Text)+' ');
  end;

  end;
  atualizaGrid;
end;

procedure TfrmPesquisaRapida.gridPesquisaDblClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPesquisaRapida.edtPesquisaKeyPress(Sender: TObject; var Key: Char);
{
  Se rb1 for selecionado só deixa digitar números
}
begin
   if rb1.Checked then
  begin
    If not( key in['0'..'9',#8] ) then key := #0;
  end;
end;

procedure TfrmPesquisaRapida.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
{
  Chama o metodo pesquisar
}
begin
  pesquisar;
  case Key of
      13:
        close;
      VK_ESCAPE:
        close;
   end;
end;

procedure TfrmPesquisaRapida.FormShow(Sender: TObject);
{
  Da visibilidade aos radioButon, e coloca caption, e
  faz select inicial na qryPesquisaRapida
}
begin
    CodPesquisa;
    case c of
      0: visible(true,'Código',True,'Nome Fantaisa',true,'Razão Social',
        'cdforn,nmfant,rzsoci','forne',' order by cdforn');
      1:
      begin
          rb1.Visible := true;
          rb1.Caption := 'Código';
          rb2.Visible := true;
          rb2.Caption := 'Nome Fantasia';
          rb3.Visible := true;
          rb3.Caption := 'Razão Social';
          SQL.executaSql(cdsProcuraRapida,'select cdempr,nmfant,rzsoci from empre order by cdempr');
      end;
      2: visible(true,'Código',true,'Descrição',false,'','cdgrup,descri','grPro','order by cdgrup');
      3: visible(true,'Código',true,'Descrição',false,'','cdprof,descri','profi','order by cdprof');
      4: visible(true,'Código',true,'Nome',false,'','cdfunc,nome','funci','order by cdfunc');
      5: visible(true,'Código',true,'Descrição',false,'','cddepa,descri','depar','order by cddepa');
      6: visible(true,'Código',true,'Nome',false,'','cdclie,nome','clien','order by cdclie');
      7:
      begin
          rb1.Visible := true;
          rb1.Caption := 'Código';
          rb2.Visible := true;
          rb2.Caption := 'Descrição';
          SQL.executaSql(cdsProcuraRapida,'select cdban,descri from banco order by cdban');
      end;
      8:
      begin
          rb1.Visible := true;
          rb1.Caption := 'Nr.Cartão';
          rb2.Visible := true;
          rb2.Caption := 'Nome';
          SQL.executaSql(cdsProcuraRapida,'select nrcart,nmcart from crfid order by nrcart');
      end;
      9:
      begin
          rb1.Visible := true;
          rb1.Caption := 'Número Cheque';
          rb2.Visible := true;
          rb2.Caption := 'CMC7';
          SQL.executaSql(cdsProcuraRapida,'select numchq,dtcada,valor,status,cmc7 from cheqs order by dtcada');
      end;

    end;
    atualizaGrid;  
end;

procedure TfrmPesquisaRapida.rb1Click(Sender: TObject);
begin
  edtpesquisa.text := '';
  edtpesquisa.SetFocus;
end;

procedure TfrmPesquisaRapida.rb2Click(Sender: TObject);
begin
  edtpesquisa.text := '';
  edtpesquisa.SetFocus;
end;

procedure TfrmPesquisaRapida.rb3Click(Sender: TObject);
begin
  edtpesquisa.text := '';
  edtpesquisa.SetFocus;
end;

procedure TfrmPesquisaRapida.btnSelecionaClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPesquisaRapida.rb4Click(Sender: TObject);
begin
  edtpesquisa.text := '';
  edtpesquisa.SetFocus;
end;

procedure TfrmPesquisaRapida.FormClose(Sender: TObject;
  var Action: TCloseAction);
{
  Posiciona a tabela do form que chamou o Pesquisa Rapida, de acordo
  com o select feito na qryPesquisaRapida atraves do locate
}
begin
    case c of
      0:
      begin
          dm.cdsFor.Locate('CDFORN', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      1:
      begin
          dm.cdsEmp.Locate('CDEMPR', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      2:
      begin
          dm.cdsGRPro.Locate('CDGRUP', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      3:
      begin
          dm.cdsProfi.Locate('CDPROF', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      4:
      begin
          dm.cdsFunc.Locate('CDFUNC', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      5:
      begin
          dm.cdsDepa.Locate('CDDEPA', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      6:
      begin
          dm.cdsCli.Locate('CDCLIE', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      7:
      begin
          dm.cdsBanc.Locate('CDBAN', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
       8:
      begin
          dm.cdsCartFid.Locate('NRCART', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
      9:
      begin
          dm.cdsCheque.Locate('NUMCHQ', VarArrayOf([IntToStr(cdsProcuraRapida.Fields[0].AsInteger)]), [loPartialKey]);
      end;
    end;
    sql.Destroy;
end;

procedure TfrmPesquisaRapida.atualizaGrid;
{
  atualiza o grid, a quant de colunas e suas larguras
}
begin
    case c of
      0:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Nome Fantasia';
          gridPesquisa.Columns.Items[1].Width := 303;
          gridPesquisa.Columns.Items[2].Title.Caption := 'Razão Social';
          gridPesquisa.Columns.Items[2].Width := 303;
      end;
      1:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Nome Fantasia';
          gridPesquisa.Columns.Items[1].Width := 300;
          gridPesquisa.Columns.Items[2].Title.Caption := 'Razão Social';
          gridPesquisa.Columns.Items[2].Width := 300;
      end;
      2:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Descrição';
          gridPesquisa.Columns.Items[1].Width := 300;
      end;
       3:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Profissão';
          gridPesquisa.Columns.Items[1].Width := 300;
      end;
       4:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Nome';
          gridPesquisa.Columns.Items[1].Width := 300;
      end;
      5:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Descrição';
          gridPesquisa.Columns.Items[1].Width := 300;
      end;
      6:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Nome';
          gridPesquisa.Columns.Items[1].Width := 300;
      end;
      7:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Código';
          gridPesquisa.Columns.Items[0].Width := 70;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Descrição';
          gridPesquisa.Columns.Items[1].Width := 300;
      end;
      8:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Nr.Cartão';
          gridPesquisa.Columns.Items[0].Width := 150;
          gridPesquisa.Columns.Items[1].Title.Caption := 'Nome';
          gridPesquisa.Columns.Items[1].Width := 300;
      end;
      9:
      begin
          gridPesquisa.Columns.Items[0].Title.Caption := 'Nr. Cheque';
          gridPesquisa.Columns.Items[0].Width := 100;
          gridPesquisa.Columns.Items[0].Alignment := taCenter;
          gridPesquisa.Columns.Items[1].Title.Caption := 'dtcada';
          gridPesquisa.Columns.Items[1].Width := 100;
          gridPesquisa.Columns.Items[2].Title.Caption := 'valor';
          gridPesquisa.Columns.Items[2].Alignment := taLeftJustify;
          gridPesquisa.Columns.Items[2].Width := 100;
          gridPesquisa.Columns.Items[3].Title.Caption := 'status';
          gridPesquisa.Columns.Items[3].Width := 100;
          gridPesquisa.Columns.Items[4].Title.Caption := 'cmc7';
          gridPesquisa.Columns.Items[4].Width := 300;
      end;
    end;  
end;

procedure TfrmPesquisaRapida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_ESCAPE:
        close;  
   end;
end;

procedure TfrmPesquisaRapida.visible(rb1V:Boolean;rb1Nome:String;rb2V:boolean;
        rb2Nome:String;rb3V:boolean;rb3Nome:String;campos:String;tabela:string;sqlComplementar:String);
begin
     rb1.Visible := rb1V;
     rb1.Caption := rb1Nome;
     rb2.Visible := rb2V;
     rb2.Caption := rb2Nome;
     rb3.Visible := rb3V;
     rb3.Caption := rb3Nome;
     SQL.executaSQlPorEmp(cdsProcuraRapida,campos,tabela,sqlComplementar);
     atualizaGrid;
end;

procedure TfrmPesquisaRapida.gridPesquisaDrawColumnCell(Sender: TObject;
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

procedure TfrmPesquisaRapida.CodPesquisa;
begin
  if pesq = 'forne' then
    c:= 0;
  if pesq = 'empre' then
    c:=1;
  if pesq = 'grpro' then
    c:= 2;
  if pesq = 'profi' then
    c:= 3;
  if pesq = 'funci' then
    c:=4;
  if pesq = 'depar' then
    c:=5;
  if pesq = 'clien' then
    c:=6;
  if pesq = 'banco' then
    c:=7;
  if pesq = 'crfid' then
    c:=8;
  if pesq = 'cheqs' then
    c:=9;
end;

procedure TfrmPesquisaRapida.FormCreate(Sender: TObject);
begin
  sql := TSQL.Create();
end;

end.
