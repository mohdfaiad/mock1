unit Menu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.SearchBox, FMX.ListBox, FMX.Layouts;

type
  TMenuBox = class(TForm)
    lbxMenu: TListBox;
    listItemFindHotel: TListBoxItem;
    listItemReservaionList: TListBoxItem;
    listItemGroupHeader: TListBoxGroupHeader;
    ListBoxItem18: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    listItemTopPage: TListBoxItem;
    StyleBook1: TStyleBook;
    procedure listItemFindHotelClick(Sender: TObject);
    procedure listItemReservaionListClick(Sender: TObject);
    procedure listItemTopPageClick(Sender: TObject);
  private
    { private �錾 }
  public
    { public �錾 }
    procedure SetMyParent(objParent: TFmxObject);
  end;

var
  MenuBox: TMenuBox;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}

uses
  MGFormFactory;

{ TMenuBox }

// �e�Z�b�g
procedure TMenuBox.SetMyParent(objParent: TFmxObject);
begin
  lbxMenu.Parent := objParent;
  lbxMenu.Visible:= True;
end;

// top page
procedure TMenuBox.listItemTopPageClick(Sender: TObject);
begin
  g_FormFactory.HideMenu;
  g_FormFactory.Open_TopPage
end;

// find a hospital
procedure TMenuBox.listItemFindHotelClick(Sender: TObject);
begin
  g_FormFactory.HideMenu;
  g_FormFactory.Open_SearchHospitalDialog;
end;

// �\�񃊃X�g
procedure TMenuBox.listItemReservaionListClick(Sender: TObject);
begin
  g_FormFactory.HideMenu;
  g_FormFactory.Open_ReservationList;
end;

end.
