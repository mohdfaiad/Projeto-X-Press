unit uFrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.StdCtrls, uFrmPrincipal,
  System.ImageList, FMX.ImgList;

type
  TfrmLogin = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    RoundRect1: TRoundRect;
    Edit1: TEdit;
    Layout4: TLayout;
    RoundRect2: TRoundRect;
    Edit2: TEdit;
    Layout5: TLayout;
    Button1: TButton;
    Layout7: TLayout;
    Button2: TButton;
    Rectangle1: TRectangle;
    PasswordEditButton1: TPasswordEditButton;
    ImageControl1: TImageControl;
    ImageList1: TImageList;
    Layout6: TLayout;
    Button3: TButton;
    procedure Label1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    nome :string;
    fPrincipal : TfrmMain;
  end;

var
  frmLogin: TfrmLogin;


implementation


{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

uses uFrmEsqueciSenha, uFrmCadastro;

procedure TfrmLogin.Button1Click(Sender: TObject);
  var
   LogIn : TfrmRedefinirSenha;
begin

  LogIn := TfrmRedefinirSenha.Create(nil);
       LogIn.ShowModal(procedure(ModalResult: TModalResult)
        begin
          if ModalResult = mrOK then
          begin
            ShowMessage('Welcome');
            login.DisposeOf;
          end;
          login.DisposeOf;
        end);
end;

procedure TfrmLogin.Button2Click(Sender: TObject);
begin

  if (Edit1.Text = '')  then
  begin
    ShowMessage('E-mail não informado.');
    Edit1.SetFocus;
    abort;
  end;

  if (Edit2.Text = '')  then
  begin
    ShowMessage('Senha não informada.');
    Edit2.SetFocus;
    abort;
  end;


  nome := Edit1.Text;

  //Chama a tela principal
  if not Assigned(fPrincipal) then
  fPrincipal := TfrmMain.Create(Self);

 fPrincipal.ShowModal(procedure(ModalResult: TModalResult)
  begin

  end);

end;

procedure TfrmLogin.Button3Click(Sender: TObject);
  var
   fCadastro : TfrmCadastro;
begin

  fCadastro  := TfrmCadastro.Create(nil);
       fCadastro .ShowModal(procedure(ModalResult: TModalResult)
        begin
          if ModalResult = mrOK then
          begin
            ShowMessage('Welcome');
            fCadastro .DisposeOf;
          end;
          fCadastro .DisposeOf;
        end);
end;

procedure TfrmLogin.Label1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRedefinirSenha,frmRedefinirSenha);

  frmRedefinirSenha.Show;
end;

end.
