unit Shl001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.CategoryButtons, Vcl.WinXCtrls;

type
  TFrmSchelm = class(TForm)
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    PnlArea: TPanel;
    imlIcons: TImageList;
    PnlSubMenu: TPanel;
    SplitSecundaria: TSplitView;
    CbDbx: TCategoryButtons;
    PnlMenuPrincipal: TPanel;
    SplitPrincipal: TSplitView;
    catMenuItems: TCategoryButtons;
    procedure catMenuItemsCategories0Items0Click(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSchelm: TFrmSchelm;

implementation

{$R *.dfm}

procedure TFrmSchelm.catMenuItemsCategories0Items0Click(Sender: TObject);
begin
  if (not(SplitSecundaria.Opened)) then
    SplitSecundaria.Open
  else
    SplitSecundaria.Close;
end;

procedure TFrmSchelm.imgMenuClick(Sender: TObject);
begin
  if (not(SplitPrincipal.Opened)) then
    SplitPrincipal.Open
  else
  begin
    SplitPrincipal.Close;
    SplitSecundaria.Close;
  end;
end;

end.
