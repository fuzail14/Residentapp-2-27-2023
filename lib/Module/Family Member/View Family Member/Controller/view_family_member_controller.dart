import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/Model/Familymember.dart';

import '../../../../Constants/api_routes.dart';
import '../../../HomeScreen/Model/residents.dart';
import '../../../Login/Model/User.dart';

class ViewFamilyMemberController extends GetxController{

  late final User userdata;
  late final Residents resident;
  var data = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata=data[0];
    resident=data[1];

  }
  viewResidentsApi(
      int subadminiid,
      int residentid,
      String token) async {
    print(subadminiid.toString());
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewfamilymember + "/" +subadminiid.toString()+"/"+residentid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
print(data);

    if (response.statusCode == 200) {
      return Familymember.fromJson(data);

    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }






}