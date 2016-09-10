unit uFrmEsqueciSenha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.StdCtrls;

type
  TfrmRedefinirSenha = class(TForm)
    Brush1: TBrushObject;
    Layout1: TLayout;
    Layout3: TLayout;
    RoundRect1: TRoundRect;
    Edit1: TEdit;
    Layout4: TLayout;
    ToolBar1: TToolBar;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRedefinirSenha: TfrmRedefinirSenha;

implementation

{$R *.fmx}

procedure TfrmRedefinirSenha.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmRedefinirSenha.Button2Click(Sender: TObject);
begin
  if (Edit1.Text = '') then
  begin
    ShowMessage('Favor informar um e-email');
    Edit1.SetFocus;
    abort;
  end
  else
  begin
    ShowMessage('A nova senha foi enviada para o e-mail informado.');
    self.Close;
  end;

end;

end.
