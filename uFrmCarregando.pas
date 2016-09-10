unit uFrmCarregando;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.StdCtrls,
  FMX.Ani;

type
  TfrmCarregando = class(TForm)
    Brush1: TBrushObject;
    Layout1: TLayout;
    Layout2: TLayout;
    ImageViewer2: TImageViewer;
    Layout3: TLayout;
    AniIndicator1: TAniIndicator;
    procedure Label1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCarregando: TfrmCarregando;


implementation


{$R *.fmx}

uses uFrmEsqueciSenha;

procedure TfrmCarregando.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRedefinirSenha,frmRedefinirSenha);

  disposeof;

  frmRedefinirSenha.Show;
end;

procedure TfrmCarregando.Label1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRedefinirSenha,frmRedefinirSenha);

  //disposeof;
  DisposeOf;
  frmRedefinirSenha.Show;
end;

end.

