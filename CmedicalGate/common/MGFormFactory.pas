unit MGFormFactory;

interface

uses
  FMX.Forms,
  MainForm,
  Reservation, ReservationDetails, ReservationList,
  SearchHospital, SearchResult;

type
  TMGFormFactroy = class
  private
    procedure ShowDialog(form:TForm);
  public
    procedure Open_TopPage;
    procedure HideMenu;

    procedure Open_Reservation(hospNm: String);
    procedure Open_ReservationList;
    procedure Open_ReservationDetails();
    procedure Open_SearchHospitalDialog();
    procedure Open_HospitalListDialog;
  end;

var
  g_FormFactory: TMGFormFactroy;

implementation

{ TMGFormFactroy }

// show or showmodalのどちらを使うべきか不明なので、メソッド抽出しておく
procedure TMGFormFactroy.ShowDialog(form:TForm);
begin
  form.Show;
end;

(* TopPage *)
procedure TMGFormFactroy.Open_TopPage();
begin
  ShowDialog(frmMain);
end;

(* Menu隠す *)
procedure TMGFormFactroy.HideMenu;
begin
  frmMain.mlvMenu.HideMaster;
end;


(* 予約実施 *)
procedure TMGFormFactroy.Open_Reservation(hospNm: String);
begin
  if not Assigned(frmReservation) then
      frmReservation := TfrmReservation.Create(Application);
  frmReservation.SetHospitalProp(hospNm);
  ShowDialog(frmReservation);
end;

(* 予約一覧 *)
procedure TMGFormFactroy.Open_ReservationList();
begin
  if not Assigned(frmReservationList) then
      frmReservationList := TfrmReservationList.Create(Application);
  ShowDialog(frmReservationList);
end;

(* 予約詳細 *)
procedure TMGFormFactroy.Open_ReservationDetails();
begin
  if not Assigned(frmReservationDetails) then
      frmReservationDetails := TfrmReservationDetails.Create(Application);
  ShowDialog(frmReservationDetails);
end;

(* 病院検索 *)
procedure TMGFormFactroy.Open_SearchHospitalDialog();
begin
  if not Assigned(frmSearchHospital) then
    frmSearchHospital := TfrmSearchHospital.Create(Application);
  ShowDialog(frmSearchHospital);
end;

(* 病院検索結果一覧 *)
procedure TMGFormFactroy.Open_HospitalListDialog();
begin
  if not Assigned(frmSearchResult) then
    frmSearchResult := TfrmSearchResult.Create(Application);
  ShowDialog(frmSearchResult);
end;

initialization
  g_FormFactory := TMGFormFactroy.Create();

finalization
  g_FormFactory.Free;

end.
