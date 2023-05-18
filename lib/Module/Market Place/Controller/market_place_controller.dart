import 'dart:convert';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:http/http.dart' as Http;
import 'package:get/get.dart';

import 'package:userapp/Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/MarketPlace.dart';

class MarketPlaceController extends GetxController {
  late final User userdata;
  var resident;
  dynamic snapshotData;

  dynamic residentData;

  var data = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];
  }

  Future<MarketPlace> viewProducts(
      {required int societyid, required String token}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewProducts + "/" + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return MarketPlace.fromJson(data);
    }

    return MarketPlace.fromJson(data);
  }

  Future<MarketPlace> viewSellProductsResidnet(
      {required int residentid, required String token}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewSellProductsResidnet + "/" + residentid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return MarketPlace.fromJson(data);
    }

    return MarketPlace.fromJson(data);
  }

  makeACall(String MobileNo) async {
    String number = MobileNo; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
