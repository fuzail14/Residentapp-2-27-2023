import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
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
    isLoading=true;


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

        // update();
        final User user = User(
            userid: data['data']['id'],
            subadminid:data['data']['subadminid']??0,
            residentid:data['data']['residentid']??0  ,
            firstName: data['data']['firstname'],
            lastName: data['data']['lastname'],
            cnic: data['data']['cnic'],
            roleId: data['data']['roleid'],
            roleName: data['data']['rolename'],
            address: data['data']['address'],
            bearerToken: data['Bearer']);
// final FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
//
//     var d= firebaseFirestore
//         .collection("users")
//             .add({
//       'firstname': user.firstName,
//       'lastname':user.lastName,
//       'mobileno':'',
//       'address':user.address,
//       'cnic':user.cnic,
//       'roleid':user.roleId,
//       'rolename':user.roleName,
//       'password':'',
//       'fcmtoken':'',
//       'image':''
//
//
//     });
//         print(d);

        MySharedPreferences.setUserData(user: user);
        FirebaseMessaging.instance.getToken().then((value) {
          String? token = value;
          fcmtokenrefresh(user.userid!, token!, user.bearerToken!);
        });

        if (user.address == "NA") {
          Get.offAndToNamed(residentaddressdetail, arguments: user);
        } else {
          Get.offAndToNamed(homescreen, arguments: user);
        }

        Get.snackbar(
          "Login Successfully",
          "Welcome 😉 " +
              user.firstName.toString() +
              " " +
              user.lastName.toString(),
          backgroundColor: Colors.white,
        );
      }
      if (response.statusCode == 200 && data['data']['roleid'] != 3) {
        isLoading=false;
        update();
        Get.snackbar(
          "Your are not register to our system. contact admin !",
          '',
          backgroundColor: Colors.white,
        );
      }
      if (response.statusCode == 200 && data['data']['roleid'] == 5) {
        // isLoading=false;
        // update();
        final User user = User(
            userid: data['data']['id'],
            subadminid:data['data']['subadminid']??0,
            residentid:data['data']['residentid']??0  ,
            firstName: data['data']['firstname'],
            lastName: data['data']['lastname'],
            cnic: data['data']['cnic'],
            roleId: data['data']['roleid'],
            roleName: data['data']['rolename'],
            address: data['data']['address'],
            bearerToken: data['Bearer']);


        MySharedPreferences.setUserData(user: user);
        FirebaseMessaging.instance.getToken().then((value) {
          String? token = value;
          print('Fire Base token');
          print('--------');
          print(token);
          print(user.bearerToken);
          fcmtokenrefresh(user.userid!, token!, user.bearerToken!);
        });
        print(user.userid);
        print(response.statusCode);
        print(user.address);
        if (user.address == "NA") {
          Get.offAndToNamed(residentaddressdetail, arguments: user);
        } else {
          Get.offAndToNamed(homescreen, arguments: user);
        }

        Get.snackbar(
          "Login Successfully",
          "Welcome 😉 " +
              user.firstName.toString() +
              " " +
              user.lastName.toString(),
          backgroundColor: Colors.white,
        );
      }
      else if (response.statusCode == 401) {
        isLoading=false;
        update();
        var data = jsonDecode(response.body.toString());

        Get.snackbar(
            data['data'],
        'Incorrect Cnic or Password!'
        );

      }
      else if (response.statusCode == 403) {
        isLoading=false;
        update();
        var data = jsonDecode(response.body.toString());

        (data['errors'] as List)
            .map((e) => Get.snackbar(
          "Error",
          e.toString(),
        ))
            .toList();

      }
      else if (response.statusCode==500)
        {
          isLoading=false;
          update();
          Get.snackbar(
            "Error",'Server Error',
          );
        }

  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  Future fcmtokenrefresh(int id, String fcmtoken, String bearertoken)
  async {
    print("Fcm token refresh Api   Hits ! ");

    try {
      final response = await Http.post(
        Uri.parse(Api.fcmtokenrefresh),
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

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}
