import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Services/Notification%20Services/notification_services.dart';

import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Model/User.dart';

class LoginController extends GetxController {
  var isHidden = false;
  var isLoading = false;
  TextEditingController userCnicController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  Future loginApi(String cnic, String password) async {
    isLoading = true;

    update();
    print(cnic);
    print(password);

    final response = await Http.post(
      Uri.parse(Api.login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'cnic': cnic,
        'password': password,
      }),
    );

    var data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['data']['roleid'] == 3) {
      final User user = User(
          userId: data['data']['id'],
          subadminid: data['data']['subadminid'] ?? 0,
          residentid: data['data']['residentid'] ?? 0,
          firstName: data['data']['firstname'],
          lastName: data['data']['lastname'],
          cnic: data['data']['cnic'],
          roleId: data['data']['roleid'],
          roleName: data['data']['rolename'],
          address: data['data']['address'],
          bearerToken: data['Bearer']);

      MySharedPreferences.setUserData(user: user);
      // final NotificationServices notificationServices = NotificationServices();
      // final String? token = await notificationServices.getDeviceToken();
      // fcmtokenrefresh(user.userId!, token!, user.bearerToken!);
      if (user.address == "NA") {
        Get.offAndToNamed(residentaddressdetail, arguments: user);
      } else {
        Get.offAndToNamed(homescreen, arguments: user);
      }
    } else if (response.statusCode == 200 && data['data']['roleid'] == 5) {
      // isLoading=false;
      // update();
      final User user = User(
          userId: data['data']['residentid'],
          subadminid: data['data']['subadminid'] ?? 0,
          residentid: data['data']['residentid'] ?? 0,
          firstName: data['data']['firstname'],
          lastName: data['data']['lastname'],
          cnic: data['data']['cnic'],
          roleId: data['data']['roleid'],
          roleName: data['data']['rolename'],
          address: data['data']['address'],
          bearerToken: data['Bearer']);

      MySharedPreferences.setUserData(user: user);
      final NotificationServices notificationServices = NotificationServices();
      final String? token = await notificationServices.getDeviceToken();
      fcmtokenrefresh(user.userId!, token!, user.bearerToken!);
      if (user.address == "NA") {
        Get.offAndToNamed(residentaddressdetail, arguments: user);
      } else {
        Get.offAndToNamed(homescreen, arguments: user);
      }
    } else if (response.statusCode == 401) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      Get.snackbar(data['data'], 'Incorrect Cnic or Password!');
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
    } else if (response.statusCode == 500) {
      isLoading = false;
      update();
      Get.snackbar(
        "Error",
        'Server Error',
      );
    } else {
      isLoading = false;
      update();
      Get.snackbar(
        "Error",
        'Something went  Wrong',
      );
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  Future fcmtokenrefresh(int id, String fcmtoken, String bearertoken) async {
    print("Fcm token refresh Api   Hits ! ");

    try {
      final response = await Http.post(
        Uri.parse(Api.fcmTokenRefresh),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $bearertoken"
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'fcmtoken': fcmtoken,
        }),
      );
      print("Fcm token refresh Api Hits Successfully !");
    } catch (SocketException) {
      Get.snackbar('Error Message', 'No Internet Connection');
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
