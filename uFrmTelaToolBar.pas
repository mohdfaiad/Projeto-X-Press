unit uFrmTelaToolBar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.StdCtrls;

type
  TfrmTelaToolBar = class(TForm)
    Brush1: TBrushObject;
    Layout1: TLayout;
    ToolBar1: TToolBar;
    spbBack: TSpeedButton;
    Label1: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaToolBar: TfrmTelaToolBar;


implementation


{$R *.fmx}

uses uFrmEsqueciSenha;

procedure TfrmTelaToolBar.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRedefinirSenha,frmRedefinirSenha);

  disposeof;

  frmRedefinirSenha.Show;
end;

procedure TfrmTelaToolBar.Label1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRedefinirSenha,frmRedefinirSenha);

  //disposeof;
  DisposeOf;
  frmRedefinirSenha.Show;
end;

end.
