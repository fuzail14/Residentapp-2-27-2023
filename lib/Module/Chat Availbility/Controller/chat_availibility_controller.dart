import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Constants/api_routes.dart';

import '../../Login/Model/User.dart';
import '../Model/ChatNeighbours.dart';
import '../Model/ChatRoomModel.dart';

class ChatAvailbilityController extends GetxController {
  var data = Get.arguments;
  late final User userdata;
  var resident;

  late Future<ChatRoomModel> futureChatRoomData;
  late Future<ChatNeighbours> futureChatNeighboursData;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];

    futureChatNeighboursData = viewChatNeighbours(
        subadminid: resident.subadminid!, token: userdata.bearerToken!);
  }

  Future<ChatNeighbours> viewChatNeighbours(
      {required int subadminid, required String token}) async {
    final response = await Http.get(
      Uri.parse(Api.chatNeighbours + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ChatNeighbours.fromJson(data);
    }

    return ChatNeighbours.fromJson(data);
  }

  Future<ChatNeighbours> viewChatNeighbours2(
      {required int subadminid, required String token}) async {
    final response = await Http.get(
      Uri.parse(Api.chatNeighbours + "/" + subadminid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ChatNeighbours.fromJson(data);
    }

    return ChatNeighbours.fromJson(data);
  }

  Future<ChatRoomModel> createChatRoomApi({
    required String token,
    required int userid,
    required int chatUserId,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.createChatRoom),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "sender": userid,
        "receiver": chatUserId,
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
