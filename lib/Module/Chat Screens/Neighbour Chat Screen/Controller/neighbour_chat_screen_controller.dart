import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../../Constants/api_routes.dart';
import '../../../Chat Availbility/Model/ChatNeighbours.dart' as ChatNeighbours;
import '../../../Chat Availbility/Model/ChatRoomModel.dart';
import '../../../HomeScreen/Model/residents.dart';
import '../../../Login/Model/User.dart';

class NeighbourChatScreenController extends GetxController {
  var data = Get.arguments;
  late final User user;
  late final ChatRoomModel chatRoomModel;
  late int chatRoomId;
  late final Residents resident;
  late final ChatNeighbours.Data chatNeighbours;

  String? chatType;

  final TextEditingController msg = TextEditingController();

  //
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    user = data[0];
    resident = data[1];
    chatNeighbours = data[2];
    chatRoomId = data[3];
    chatType = data[4];

    print(chatType);
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

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return ChatRoomModel.fromJson(data);
    } else {
      return ChatRoomModel.fromJson(data);
    }
  }
}

enum ChatTypes { NeighbourChat, MarketPlaceChat, MarketPlaceProductDetails }
