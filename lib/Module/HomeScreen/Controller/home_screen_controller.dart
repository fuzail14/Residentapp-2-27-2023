import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:userapp/Constants/api_routes.dart';

import '../../../Routes/set_routes.dart';
import '../../../Services/Notification Services/notification_services.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../Login/Model/User.dart';
import '../Model/DiscussionRoomModel.dart';
import '../Model/residents.dart';
import '../View/home_screen.dart';

class HomeScreenController extends GetxController {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  var imageFile;

  var data = Get.arguments;
  late final User user;

  List<HomeScreenCard> servicesLi = [
    HomeScreenCard(
      heading: 'Complaint',
      description:
          'Resolve issues. Empower residents. Strengthen community bonds',
      iconPath: 'assets/file 3.png',
      type: 'services',
    ),
    HomeScreenCard(
      heading: 'Pre Approve Entry',
      description:
          'Seamless access. Secure entry. Hassle-free resident approvals.',
      iconPath: 'assets/noticeboard_icon.png',
      type: 'services',
    ),
    HomeScreenCard(
      heading: 'Family Members',
      description:
          'Inclusive communities. Easy family additions. Strengthening bonds',
      iconPath: 'assets/team 1.png',
      type: 'services',
    ),
  ];
  List<HomeScreenCard> eventsLi = [
    HomeScreenCard(
      heading: 'Society Events',
      description: 'Unforgettable gatherings. Engaging community events.',
      iconPath: 'assets/icons/event.svg',
      type: 'events',
    ),
    HomeScreenCard(
      heading: 'Notice Board',
      description:
          'Stay informed. Important updates. Community notices at fingertips',
      iconPath: 'assets/icons/noticeboard.svg',
      type: 'events',
    ),
  ];
  List<HomeScreenCard> chatsLi = [
    HomeScreenCard(
      heading: 'Neighbours',
      description: 'Connect with neighbors. Instant community communication',
      iconPath: 'assets/icons/chat.svg',
      type: 'chats',
    ),
    HomeScreenCard(
      heading: 'Discussion Forum',
      description: 'Engage. Discuss. Share. Community forum platform',
      iconPath: 'assets/icons/discussion_forum.svg',
      type: 'chats',
    ),
  ];
  List<HomeScreenCard> historyLi = [
    HomeScreenCard(
      heading: 'Complaint History',
      description: 'Track. Resolve. Improve. Complaint history tracker',
      iconPath: 'assets/icons/history.svg',
      type: 'history',
    ),
    HomeScreenCard(
      heading: 'Guest History',
      description: 'Guest visits. History. Enhanced security.',
      iconPath: 'assets/icons/history.svg',
      type: 'history',
    ),
  ];
  List<HomeScreenCard> billsLi = [
    HomeScreenCard(
      heading: 'Monthly Bills',
      description: 'Easy pay your Monthly Bills',
      iconPath: 'assets/icons/history.svg',
      type: 'bills',
    ),
  ];

  getFromCamera(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    } else {}
  }

  @override
  void onInit() {
    // TODO: implement
    //  onInit

    super.onInit();

    NotificationServices notificationServices = NotificationServices();
    notificationServices.requestNotification();
    notificationServices.fireBaseInit();
    notificationServices.setupInteractMessage();
    notificationServices.getDeviceToken();

    print('Home Screen Controller Data');
    this.user = data;
    print(user.userId);
    print(user.bearerToken);
  }

  Future<Residents> loginResidentDetails(
      {required int userid, required String token}) async {
    print("${userid.toString()}");
    print(token);

    final response = await Http.get(
      Uri.parse(Api.loginResidentDetails + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    var e = data['data'];

    var societyData = data['data']['societydata'];

    var societyId = societyData[0]['societyid'];
    var superAdminId = societyData[0]['superadminid'];

    //print(societyId);
    //print('superAdminId $superAdminId');


    final Residents residents = Residents(
        id: e['id'],
        residentid: e['residentid'],
        subadminid: e['subadminid'],
        superadminid: superAdminId,
        societyid: societyId,
        country: e["country"],
        state: e["state"],
        city: e["city"],
        houseaddress: e["houseaddress"],
        vechileno: e["vechileno"],
        residenttype: e["residenttype"],
        propertytype: e["propertytype"],
        committeemember: e["committeemember"],
        status: e["status"],
        createdAt: e["createdAt"],
        updatedAt: e["updatedAt"]);

    if (response.statusCode == 200) {
      return residents;
    }

    return residents;
  }

  payment() async {
    // var digest;
    String dateandtime = DateFormat("yyyyMMddHHmmss").format(DateTime.now());
    String dexpiredate = DateFormat("yyyyMMddHHmmss")
        .format(DateTime.now().add(Duration(days: 1)));
    String tre = "T" + dateandtime;
    String pp_Amount = "100000";
    String pp_BillReference = "billRef";
    String pp_Description = "Description";
    String pp_Language = "EN";
    String pp_MerchantID = "MC52072";
    String pp_Password = "1zu282w8e3";

    String pp_ReturnURL =
        "https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction";
    String pp_ver = "1.1";
    String pp_TxnCurrency = "PKR";
    String pp_TxnDateTime = dateandtime.toString();
    String pp_TxnExpiryDateTime = dexpiredate.toString();
    String pp_TxnRefNo = tre.toString();
    String pp_TxnType = "MWALLET";
    String ppmpf_1 = "4456733833993";
    String IntegeritySalt = "s8v30w3y0x";
    String and = '&';
    String superdata = IntegeritySalt +
        and +
        pp_Amount +
        and +
        pp_BillReference +
        and +
        pp_Description +
        and +
        pp_Language +
        and +
        pp_MerchantID +
        and +
        pp_Password +
        and +
        pp_ReturnURL +
        and +
        pp_TxnCurrency +
        and +
        pp_TxnDateTime +
        and +
        pp_TxnExpiryDateTime +
        and +
        pp_TxnRefNo +
        and +
        pp_TxnType +
        and +
        pp_ver +
        and +
        ppmpf_1;

    // var key = utf8.encode(IntegeritySalt);
    // var bytes = utf8.encode(superdata);
    // var hash2 = Hmac(sha256, key);
    // var digest = hash2.convert(bytes);
    // var hash = digest.toString();
    // data["pp_SecureHash"] = hash;

    var key = utf8.encode(IntegeritySalt);
    var bytes = utf8.encode(superdata);
    var hmacSha256 = new Hmac(sha256, key);
    Digest sha256Result = hmacSha256.convert(bytes);

    var url =
        'https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction';

    var response = await Http.post(Uri.parse(url), body: {
      "pp_Version": pp_ver,
      "pp_TxnType": pp_TxnType,
      "pp_Language": pp_Language,
      "pp_MerchantID": pp_MerchantID,
      "pp_Password": pp_Password,
      "pp_TxnRefNo": tre,
      "pp_Amount": pp_Amount,
      "pp_TxnCurrency": pp_TxnCurrency,
      "pp_TxnDateTime": dateandtime,
      "pp_BillReference": pp_BillReference,
      "pp_Description": pp_Description,
      "pp_TxnExpiryDateTime": dexpiredate,
      "pp_ReturnURL": pp_ReturnURL,
      "pp_SecureHash": sha256Result.toString(),
      "ppmpf_1": "03075383136"
    });

    print("response=>");
    print(response.body);
    print(response.body);
  }

  logoutApi({required String token}) async {
    print(token);

    final response = await Http.post(
      Uri.parse(Api.logout),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      print("logout successfully");
      print(data);
      MySharedPreferences.deleteUserData();
      // await FirebaseMessaging.instance.deleteToken();
      Get.offAllNamed(loginscreen);
    } else {
      print(data);
    }
  }

  Future<DiscussionRoomModel> createChatRoomApi({
    required String token,
    required int subadminid,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.createDiscussionRoom),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "subadminid": subadminid,
      }),
    );
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.body);

      return DiscussionRoomModel.fromJson(data);
    } else {
      return DiscussionRoomModel.fromJson(data);
    }
  }
}
