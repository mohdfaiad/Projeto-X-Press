unit UntTitulos;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Rtti,
  System.Bindings.Outputs,
  System.Actions,

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.TabControl,
  FMX.Layouts,
  FMX.ListView.Types,
  FMX.ListView,
  FMX.Ani,
  FMX.Bind.GenData,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Memo,
  FMX.Effects,
  FMX.Gestures,
  FMX.ActnList,
  FMX.StdActns,
  FMX.Objects,
  FMX.ListBox,
  FMX.MediaLibrary.Actions,
  FMX.Bind.Editors,
  FMX.Bind.DBEngExt,

  Data.Bind.GenData,
  Data.Bind.EngExt,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Data.Bind.DBScope,
  Data.Db,
  Data.FireDACJSONReflect,

  MultiDetailAppearanceU;

type
  TfrmTitulos = class(TForm)
    toolTitulos: TToolBar;
    lytTitulos: TLayout;
    tabctrlTitulos: TTabControl;
    tbitemLisTitulos: TTabItem;
    spbBack: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    tbitemDetalhes: TTabItem;
    ToolBar1: TToolBar;
    spbVoltar: TSpeedButton;
    lsboxDetalhe: TListBox;
    lsitTituloSub: TListBoxItem;
    imgFoto: TImage;
    lstitAnoLancamento: TListBoxItem;
    Layout1: TLayout;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    spbEdicao: TSpeedButton;
    SpeedButton2: TSpeedButton;
    AcoesGeral: TActionList;
    actFotoBiblioteca: TTakePhotoFromLibraryAction;
    actFotoCamera: TTakePhotoFromCameraAction;
    SpeedButton1: TSpeedButton;
    spbSalvar: TSpeedButton;
    spbCancelar: TSpeedButton;
    lstPopUpFoto: TListBox;
    lstitNovaFoto: TListBoxItem;
    lstitBiblioteca: TListBoxItem;
    lstitCancelar: TListBoxItem;
    edtAno: TEdit;
    LinkControlToField1: TLinkControlToField;
    edtTitulo: TEdit;
    edtSubTitulo: TEdit;
    LinkControlToField2: TLinkControlToField;
    ShadowEffect1: TShadowEffect;
    spbNovo: TSpeedButton;
    lsvTitulos: TListView;
    LinkListControlToField1: TLinkListControlToField;
    lblTituloDet: TLabel;
    ToolBar3: TToolBar;
    spbExcluir: TSpeedButton;
    lblTituloT: TLabel;
    ListBox2: TListBox;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    LinkControlToField3: TLinkControlToField;
    procedure FormCreate(Sender: TObject);
    procedure spbVoltarClick(Sender: TObject);
    procedure spbEdicaoClick(Sender: TObject);
    procedure spbSalvarClick(Sender: TObject);
    procedure spbCancelarClick(Sender: TObject);
    procedure lstitNovaFotoClick(Sender: TObject);
    procedure lstitBibliotecaClick(Sender: TObject);
    procedure lstitCancelarClick(Sender: TObject);
    procedure spbNovoClick(Sender: TObject);
    procedure lsvTitulosDeletingItem(Sender: TObject; AIndex: Integer;
      var ACanDelete: Boolean);
    procedure lsvTitulosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure LinkListControlToField1FilledListItem(Sender: TObject;
      const AEditor: IBindListEditorItem);
  private
    { Private declarations }
    const
      sTitulos = 'TITULOS';

    procedure AtualizarBotoes;
    procedure HidePopup;
  public
    { Public declarations }
    procedure PressionouVoltar;
    procedure PressionouMenu;
  end;

implementation

uses uFrmPricipal;

{$R *.fmx}
{$R *.iPhone4in.fmx IOS}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.iPad.fmx IOS}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TfrmTitulos.HidePopup;
begin
  frmMain.HideBackground;
  lstPopUpFoto.AnimateFloat('position.y', lstPopUpFoto.Height * -1);
  lstPopUpFoto.Visible := False;
end;

procedure TfrmTitulos.FormCreate(Sender: TObject);
begin
  tabctrlTitulos.TabPosition := TTabPosition.None;
  tabctrlTitulos.ActiveTab   := tbitemLisTitulos;


  lstPopUpFoto.Width        := ClientWidth - 20;
  lstPopUpFoto.Position.X   := (ClientWidth - lstPopUpFoto.Width) / 2;
  lstPopUpFoto.Position.Y   := lstPopUpFoto.Height * -1;
  lstPopUpFoto.Visible      := False;

  AtualizarBotoes;
end;

procedure TfrmTitulos.LinkListControlToField1FilledListItem(Sender: TObject;
  const AEditor: IBindListEditorItem);
var
  LItem : TListViewItem;
begin
  LItem     := lsvTitulos.Items[AEditor.CurrentIndex];

end;

procedure TfrmTitulos.lstitBibliotecaClick(Sender: TObject);
begin
  HidePopup;
  actFotoBiblioteca.ExecuteTarget(Sender);
end;

procedure TfrmTitulos.lstitCancelarClick(Sender: TObject);
begin
  HidePopup;
  frmMain.HideBackground;
end;

procedure TfrmTitulos.lstitNovaFotoClick(Sender: TObject);
begin
  HidePopup;
  actFotoCamera.ExecuteTarget(Sender);
end;

procedure TfrmTitulos.lsvTitulosDeletingItem(Sender: TObject; AIndex: Integer;
  var ACanDelete: Boolean);
begin
  ACanDelete :=  False;
  lsvTitulos.BeginUpdate;
  if MessageDlg('Confirma exclusão de título?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0 ) = mrYes then
  begin

    //DM.qryTitulos.Locate('ID_TITULO', AIndex+1, []);

  end;
  lsvTitulos.EndUpdate;
end;

procedure TfrmTitulos.lsvTitulosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if not lsvTitulos.EditMode then
  begin
    AtualizarBotoes;
    tabctrlTitulos.Next;
  end;
end;

procedure TfrmTitulos.PressionouVoltar;
begin
  if tabctrlTitulos.ActiveTab = tbitemDetalhes then
    tabctrlTitulos.Previous();
end;

procedure TfrmTitulos.PressionouMenu;
begin

end;

procedure TfrmTitulos.spbVoltarClick(Sender: TObject);
begin
  tabctrlTitulos.Previous;
end;

procedure TfrmTitulos.spbCancelarClick(Sender: TObject);
begin

  AtualizarBotoes;
end;

procedure TfrmTitulos.spbEdicaoClick(Sender: TObject);
begin

  AtualizarBotoes;
  edtTitulo.SetFocus;
end;

procedure TfrmTitulos.spbNovoClick(Sender: TObject);
begin

  tabctrlTitulos.Next;
  AtualizarBotoes;
end;

procedure TfrmTitulos.spbSalvarClick(Sender: TObject);
var
  LDeltaList : TFDJSONDeltas;
  LDataList  : TFDJSONDataSets;
begin


  LDeltaList := TFDJSONDeltas.Create;
  LDataList := TFDJSONDataSets.Create;
  AtualizarBotoes;
end;

procedure TfrmTitulos.AtualizarBotoes;
begin


end;


end.
