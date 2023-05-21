import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../Login/Model/User.dart';

class AddEmergencyController extends GetxController {
  var user = Get.arguments;
  late final User userdata;
  var resident;
  bool isLoading = false;
  String emergencyValue = 'Fire';
  List emergencyList = ['Fire', 'Thief', 'Medical Emergencies', 'Other'];

  @override
  void onInit() {
    super.onInit();
    userdata = this.user[0];
    resident = this.user[1];
  }

  final formKey = new GlobalKey<FormState>();
  TextEditingController problemController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();

  EmergencyDropDownVlaue(val) {
    emergencyValue = val;
    update();
  }

  Future addEmergencyApi({
    required int residentid,
    required int societyid,
    required int subadminid,
    required String token,
    required String problem,
    required String Description,
  }) async {
    print(token);

    isLoading = true;
    update();

    final response = await Http.post(
      Uri.parse(Api.addEmergency),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "residentid": residentid,
        "societyid": societyid,
        "subadminid": subadminid,
        "problem": problem,
        "description": Description,
        "status": "0",
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      // isLoading=false;
      update();
      var data = jsonDecode(response.body);
      print(data);
      print(response.statusCode);

      Get.offAndToNamed(homescreen, arguments: userdata);

      Get.snackbar(
        "Emergency Problem Reported",
        "",
        duration: Duration(seconds: 5),
      );
    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      (data['errors'] as List)
          .map((e) => Get.snackbar(
                "Error",
                e.toString(),
              ))
          .toList();
    } else {
      Get.snackbar("Failed to Report Emergency Problem", "");
    }
  }
}
