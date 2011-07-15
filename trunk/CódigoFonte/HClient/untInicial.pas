unit untInicial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Effects;

type
  TfrmInicial = class(TForm)
    imInicial: TImage;
    pnlInicial: TPanel;
    lblIncial: TLabel;
    tmInicial: TTimer;
    FrmABInicial: TFormAlphaBlended;
    procedure FormCreate(Sender: TObject);
    procedure tmInicialTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInicial: TfrmInicial;
  contagem: integer;

implementation

{$R *.dfm}

procedure TfrmInicial.FormCreate(Sender: TObject);
{
  inicia a variavel contagem com 1
}
begin
   contagem := 1;
end;

procedure TfrmInicial.tmInicialTimer(Sender: TObject);
{
  vai incrementando a contagem a + 1 e modificando
  a label no tempo determinado no timer
}
begin
  randomize;
  tmInicial.enabled := false;
  case contagem of
    1:begin
      lblIncial.Caption := 'Conectando ao Banco de Dados...'
    end;
    2:begin
      lblIncial.Caption := 'Carregando dados de Clientes...'
    end;
    3:begin
      lblIncial.Caption := 'Carregando dados de Fornecedores...'
    end;
    4:begin
      lblIncial.Caption := 'Carregando dados de Compras...'
    end;
    5:begin
      lblIncial.Caption := 'Carregando dados de Cheques...'
    end;
    6:begin
      lblIncial.Caption := 'Carregando dados de Contas a Receber...'
    end;
    7:begin
      lblIncial.Caption := 'Carregando dados de Contas a Pagar...'
    end;
    8:begin
      lblIncial.Caption := 'Carregando dados de Vendas...'
    end;
    9:begin
      lblIncial.Caption := 'Atualizando Configurações...'
    end;
   10:close;
  end;
  contagem := contagem + 1;
  tmInicial.enabled := true;
end;

end.
