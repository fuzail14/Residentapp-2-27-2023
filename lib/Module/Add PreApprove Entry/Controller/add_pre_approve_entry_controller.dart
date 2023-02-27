import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Routes/set_routes.dart';
import '../../../Constants/api_routes.dart';
import '../../HomeScreen/Model/residents.dart';
import '../../Login/Model/User.dart';
import '../Model/GateKeeper.dart';

class AddPreApproveEntryController extends GetxController {
  late final User userdata;
  late final Residents resident;
  var data = Get.arguments;
  String? gateKeeperdropdownvalue;
  String? visitorTypedropdownvalue = 'Guest';
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

  setVisitortype(bool status) {
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
    getGateKeeperlist();
    print(userdata);
  }

  setVisitorTypeDropDownvalue(val) {
    visitorTypedropdownvalue = val;
    update();
  }

  getGateKeeperlist() async {
    gateKeeperList =
        await getGateKeepersApi(resident.subadminid!, userdata.bearerToken!);
    isData = true;
    update();
  }

  final formKey = new GlobalKey<FormState>();
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
    gateKeeperdropdownvalue = newValue;

    update();
  }

  setVisitorTypeDropDown(newValue) {
    visitorTypedropdownvalue = newValue;

    update();
  }

  Future<List<GateKeeper>> getGateKeepersApi(
      int subadminid, String token) async {
    List<GateKeeper> li = [];
    print('getGateKeepersApi hit');

    final response = await Http.get(
      Uri.parse(Api.getgatekeepers + "/" + subadminid.toString()),
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

  Future addPreApprovEntryApi({
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
      Uri.parse(Api.addpreapproventry),
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
