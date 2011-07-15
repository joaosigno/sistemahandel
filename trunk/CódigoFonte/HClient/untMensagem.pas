{Pedro L Saraiva}
unit untMensagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RxGIF;

type
  TfrmMensagem = class(TForm)
    btnOK: TBitBtn;
    imgAtencao: TImage;
    mmMensagem: TMemo;
    lblmsg: TLabel;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.dfm}


procedure TfrmMensagem.btnOKClick(Sender: TObject);
begin
  close;
end;

end.
