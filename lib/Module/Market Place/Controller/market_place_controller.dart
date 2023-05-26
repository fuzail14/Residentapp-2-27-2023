import 'dart:convert';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:http/http.dart' as Http;
import 'package:get/get.dart';

import 'package:userapp/Constants/api_routes.dart';
import '../../Chat Availbility/Model/ChatRoomModel.dart';
import '../../Chat Availbility/Model/ChatRoomUsers.dart';
import '../../Login/Model/User.dart';
import '../Model/MarketPlace.dart';

class MarketPlaceController extends GetxController {
  late final User userdata;
  var resident;
  dynamic snapshotData;

  dynamic userresidentData;
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

    var data = jsonDecode(response.body.toString());

    print('data');
    print(data['resident']);

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

  Future<ChatRoomUsers> fetchchatroomusers(
      {required int userid,
      required int chatuserid,
      required String token}) async {
    print('idds');
    print(userid);
    print(chatuserid);

    final response = await Http.get(
      Uri.parse(Api.fetchChatroomUsers +
          "/" +
          userid.toString() +
          "/" +
          chatuserid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());
    print('response ${response.statusCode}');

    if (response.statusCode == 200) {
      print(data);

      return ChatRoomUsers.fromJson(data);
    }
    return ChatRoomUsers.fromJson(data);
  }

  Future<ChatRoomModel> createChatRoomApi({
    required String token,
    required int userid,
    required int chatuserid,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.createChatRoom),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "loginuserid": userid,
        "chatuserid": chatuserid,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return ChatRoomModel.fromJson(data);
    } else {
      return ChatRoomModel.fromJson(data);
    }
  }
}
