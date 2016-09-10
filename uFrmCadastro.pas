unit uFrmCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.StdCtrls,
  FMX.DateTimeCtrls;

type
  TfrmCadastro = class(TForm)
    Brush1: TBrushObject;
    Layout1: TLayout;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    Edit1: TEdit;
    RoundRect2: TRoundRect;
    Edit2: TEdit;
    Layout3: TLayout;
    RoundRect3: TRoundRect;
    Edit3: TEdit;
    Layout4: TLayout;
    RoundRect4: TRoundRect;
    Edit4: TEdit;
    Layout5: TLayout;
    RoundRect5: TRoundRect;
    Edit5: TEdit;
    Layout6: TLayout;
    Layout7: TLayout;
    Button2: TButton;
    RoundRect6: TRoundRect;
    Edit6: TEdit;
    DateEdit1: TDateEdit;
    Layout8: TLayout;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;


implementation


{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

uses uFrmEsqueciSenha;

procedure TfrmCadastro.Button1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TfrmCadastro.Button2Click(Sender: TObject);
begin
  ShowMessage('Cadastro Realizado com sucesso');
  self.Close;
end;

procedure TfrmCadastro.Edit6Enter(Sender: TObject);
begin
  Edit6.TextPrompt := '';
  DateEdit1.Visible := True;
end;

procedure TfrmCadastro.Edit6Exit(Sender: TObject);
begin
  if (DateEdit1.IsEmpty) then
  begin
    Edit6.TextPrompt := 'Data de Nascimento';
  end;
end;

end.
