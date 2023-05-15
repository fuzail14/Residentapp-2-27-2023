import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../../Constants/api_routes.dart';

class ResetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  var isHidden = false;
  Future resetPasswordApi({
    required int familymemberid,
    required String bearerToken,
    required String password,
  }) async {
    Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};

    var request = Http.MultipartRequest('POST', Uri.parse(Api.resetPassword));
    request.headers.addAll(headers);

    request.fields['password'] = password;
    request.fields['id'] = familymemberid.toString();
    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.body.toString());
      passwordController.clear();


      Get.snackbar('Success', data['message'].toString());


      update();
    } else if (response.statusCode == 403) {
      Get.snackbar('Error', response.body.toString());
    } else {
      Get.snackbar('Error', 'Server Error');
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;

    update();
  }
}
