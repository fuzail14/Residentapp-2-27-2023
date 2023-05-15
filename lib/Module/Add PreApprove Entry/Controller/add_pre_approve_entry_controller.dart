import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Module/Add%20PreApprove%20Entry/View/add_pre_aprove_entry.dart';
import 'package:userapp/Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../HomeScreen/Model/residents.dart';
import '../../HomeScreen/View/home_screen.dart';
import '../../Login/Model/User.dart';
import '../Model/gatekeeper.dart';

class AddPreApproveEntryController extends GetxController {
  final formKey = new GlobalKey<FormState>();
  // List<HomeScreenCard> li=[
  //   HomeScreenCard(heading: 'Complaint', description: 'Resolve issues. Empower residents. Strengthen community bonds', iconPath: 'assets/icons/complaint.svg',type: 'services',),
  //   HomeScreenCard(heading: 'Pre Approve Entry', description: 'Seamless access. Secure entry. Hassle-free resident approvals.', iconPath: 'assets/icons/preapprove_entry.svg',type: 'services',),
  //   HomeScreenCard(heading: 'Family Members', description: 'Inclusive communities. Easy family additions. Strengthening bonds', iconPath: 'assets/icons/complaint.svg',type: 'services',),
  //
  //   HomeScreenCard(heading: 'Society Events', description: 'Unforgettable gatherings. Engaging community events.', iconPath: 'assets/icons/event.svg',type: 'events',),
  //   HomeScreenCard(heading: 'Notice Board', description: 'Stay informed. Important updates. Community notices at fingertips', iconPath: 'assets/icons/noticeboard.svg',type: 'events',),
  //
  //   HomeScreenCard(heading: 'Neighbours', description: 'Connect with neighbors. Instant community communication', iconPath: 'assets/icons/chat.svg',type: 'chats',),
  //   HomeScreenCard(heading: 'Discussion Forum', description: 'Engage. Discuss. Share. Community forum platform', iconPath: 'assets/icons/discussion_forum.svg',type: 'chats',),
  //
  //   HomeScreenCard(heading: 'Complaint History', description: 'Track. Resolve. Improve. Complaint history tracker', iconPath: 'assets/icons/history.svg',type: 'history',),
  //   HomeScreenCard(heading: 'Guest History', description: 'Guest visits. History. Enhanced security.', iconPath: 'assets/icons/history.svg',type: 'history',),
  //
  //
  //
  //   HomeScreenCard(heading: 'Monthly Bills', description: 'Easy pay your Monthly Bills', iconPath: 'assets/icons/history.svg',type: 'bills',),
  //
  //
  // ];



  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? imageFile;
  TextEditingController arrivaldate = TextEditingController();
  TextEditingController guestVehicleNo = TextEditingController();
  TextEditingController arrivaltime = TextEditingController();

  var data = Get.arguments;
  late final User userdata;
  late final Residents resident;

  String? gateKeeperDropDownValue;
  String? visitorTypeDropDownValue = 'Guest';
  List<GateKeeper> gateKeeperList = [];
  List<String> visitorTypesList = ['Guest', 'Delivery', 'Cab', 'Visiting Help'];

  bool isData = false;
  bool isGateKeeper = false;
  bool isVisitorType = false;

  List<Map<String, dynamic>> visitorTypes = [
    {"id": 1, "name": "Cab", "status": false, "icon": "assets/cab_icon.svg"},
    {
      "id": 2,
      "name": "Delivery",
      "status": false,
      "icon": "assets/delivery_icon.svg"
    },
    {
      "id": 3,
      "name": "Guest",
      "status": false,
      "icon": "assets/guest_icon.svg"
    },
    {
      "id": 4,
      "name": "Visiting Help",
      "status": false,
      "icon": "assets/visiting_help_icon.svg"
    }
  ];

  setVisitorType(bool status) {
    status = true;
    print(visitorTypes);
    update();
    return status;
  }

  isSetGateKeeper() {
    isGateKeeper = true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];
    getGateKeeperList();
    print(userdata);
  }

  setVisitorTypeDropDownValue(val) {
    visitorTypeDropDownValue = val;
    update();
  }

  getGateKeeperList() async {
    gateKeeperList =
        await getGateKeepersApi(resident.subadminid!, userdata.bearerToken!);
    isData = true;
    update();
  }


  Future StartDate(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) {
      picked.toString();
      arrivaldate.text = picked.toString().split(' ')[0];

      update();
    } else {
      arrivaldate.text = DateTime.now().toString().split(' ')[0];
      update();
    }
  }

  Future GuestTime(context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    print('time.$picked');
    var currentTime =
        '${picked!.hour.toString().padLeft(2, '0')}:${picked.minute.toString()}';
    // .padLeft(2, '0')}:${picked.period.toString().split('.')[1]}';

    currentTime.toString();
    arrivaltime.text = currentTime.toString().split(' ')[0].trim();
    update();
  }

  setGateKeeperDropDown(newValue) {
    gateKeeperDropDownValue = newValue;

    update();
  }

  setVisitorTypeDropDown(newValue) {
    visitorTypeDropDownValue = newValue;

    update();
  }

  Future<List<GateKeeper>> getGateKeepersApi(
      int subadminid, String token) async {
    List<GateKeeper> li = [];
    print('getGateKeepersApi hit');

    final response = await Http.get(
      Uri.parse(Api.getGatekeepers + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    print(data);

    if (response.statusCode == 200) {
      li = (data['data'] as List)
          .map((e) => GateKeeper(
              e["gatekeeperid"],
              e["subadminid"],
              e["gateno"],
              e["firstname"],
              e["lastname"],
              e["cnic"],
              e["address"],
              e["mobileno"],
              e["roleid"],
              e["rolename"],
              e["image"]))
          .toList();

      print(li);

      return li;
    }

    return li;
  }

  Future addPreApproveEntryApi({
    required String token,
    required int gatekeeperid,
    required int userid,
    required String visitortype,
    required String name,
    required String description,
    required String cnic,
    required String mobileno,
    required String vechileno,
    required String arrivaldate,
    required String arrivaltime,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.addPreApproveEntry),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "gatekeeperid": gatekeeperid,
        "userid": userid,
        "visitortype": visitortype,
        "name": name,
        "description": description,
        "cnic": cnic,
        "mobileno": mobileno,
        "vechileno": vechileno,
        "arrivaldate": arrivaldate,
        "arrivaltime": arrivaltime,
        "status": 0,
        "statusdescription": "unapproved",
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.offAndToNamed(preapproveentryscreen, arguments: [userdata, resident]);

      Get.snackbar(" PreApprove Entry Successfully", "");
    } else {
      Get.snackbar("Failed to Add PreApprove Entry", "");
    }
  }
}
