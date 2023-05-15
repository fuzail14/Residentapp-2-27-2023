class Api {
  static const String imageBaseUrl = 'http://192.168.2.45:8080/storage/';
  static const String baseUrl = 'http://192.168.2.45:8080/api/';
  static const String login = baseUrl + "login";
  static const String logout = baseUrl + "logout";
  static const String reportToAdmin = baseUrl + "reporttoadmin";
  static const String adminReports = baseUrl + "adminreports";
  static const String updateReportStatus = baseUrl + "updatereportstatus";
  static const String historyReports = baseUrl + "historyreports";
  static const String viewAllNotices = baseUrl + "viewallnotices";
  static const String viewEvents = baseUrl + "event/events";
  static const String getGatekeepers = baseUrl + "getgatekeepers";
  static const String getVisitorsTypes = baseUrl + "getvisitorstypes";
  static const String addPreApproveEntry = baseUrl + "addpreapproventry";
  static const String viewPreApproveEntryReports =
      baseUrl + "viewpreapproveentryreports";
  static const String fcmTokenRefresh = baseUrl + "fcmtokenrefresh";
  static const String preApproveEntryHistories =
      baseUrl + "preapproveentryhistories";
  static const String viewAllSocieties =
      baseUrl + "society/viewsocietiesforresidents";
  static const String viewAllPhases = baseUrl + "viewphasesforresidents";
  static const String blocks = baseUrl + "blocks";
  static const String streets = baseUrl + "streets";
  static const String viewPropertiesForResidents =
      baseUrl + "viewpropertiesforresidents";
  static const String registerresident = baseUrl + "registerresident";
  static const String signup = baseUrl + "registeruser";
  static const String loginResidentDetails = baseUrl + "loginresidentdetails";
  static const String loginBuildingResidentDetails =
      baseUrl + "loginbuildingresidentdetails";
  static const String loginResidentUpdateAddress =
      baseUrl + "loginresidentupdateaddress";
  static const String viewAllFloors = baseUrl + "viewfloorsforresidents";
  static const String viewAllApartments =
      baseUrl + "viewapartmentsforresidents";
  static const String registerBuildingResident =
      baseUrl + "registerbuildingresident";
  static const String addFamilyMember = baseUrl + "addfamilymember";
  static const String viewFamilyMember = baseUrl + "viewfamilymember";
  static const String chatGatekeepers = baseUrl + "chatgatekeepers";
  static const String chatNeighbours = baseUrl + "chatneighbours";
  static const String viewConversationsNeighbours =
      baseUrl + "viewconversationsneighbours";
  static const String conversations = baseUrl + "conversations";
  static const String createChatRoom = baseUrl + "createchatroom";
  static const String fetchChatroomUsers = baseUrl + "fetchchatroomusers";
  static const String housesApartmentMeasurements =
      baseUrl + "housesapartmentmeasurements";

  /* For Apartments */

  static const String allSocietyBuildings = baseUrl + "allsocietybuildings";
  static const String viewSocietyBuildingFloors =
      baseUrl + "viewsocietybuildingfloors";
  static const String viewSocietyBuildingApartments =
      baseUrl + "viewsocietybuildingapartments";

  static const String zegoCall = baseUrl + "zegocall";

  static const String allDiscussionChats = baseUrl + "alldiscussionchats";
  static const String createDiscussionRoom = baseUrl + "creatediscussionroom";
  static const String discussionChats = baseUrl + "discussionchats";
  static const String resetPassword = baseUrl + "resetpassword";
  static const String monthlyBills = baseUrl + "monthlybills";
  static const String viewLocalBuildingFloors =
      baseUrl + "viewlocalbuildingfloors";
  static const String viewLocalBuildingApartments =
      baseUrl + "viewlocalbuildingapartments";
  static const String payBill = baseUrl + "paybill";
  static const String monthlyBillUpdateOverDueDateStatus =
      baseUrl + "monthlybillupdateoverduedatestatus";
  static const String searchPreapproveEntry = baseUrl + "searchpreapproventry";
}
