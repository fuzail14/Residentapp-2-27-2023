import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Module/HomeScreen/Model/residents.dart';

import '../../../Constants/api_routes.dart';
import '../../Chat Availbility/Model/ChatNeighbours.dart';
import '../../Chat Availbility/Model/ChatRoomModel.dart' as ch;
import '../../Login/Model/User.dart';

class ProfileController extends GetxController {
  var data = Get.arguments;
  late final User userdata;
  late final ch.ChatRoomModel chatRoomModel;
  late Data chatNeighbours;
  late Residents resident;
  late Future<ch.ChatRoomModel> futureChatRoomData;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];
    chatNeighbours = data[2];
    chatRoomModel = data[3];

    futureChatRoomData = createChatRoomApi(
        token: userdata.bearerToken!,
        userid: userdata.userId!,
        chatUserId: chatNeighbours.residentid!);

    print(userdata.userId);
    print(resident.residentid);
    print(chatNeighbours.lastname);
    print(chatRoomModel.data!.first.id);
  }

  chatRoomStatusApi({
    required String token,
    required int id,
    required String status,
    required int userId,
    required int chatUserId,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.chatRoomStatus),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "status": status,
        "sender": userId,
        "receiver": chatUserId,
      }),
    );

    if (response.statusCode == 200) {
      futureChatRoomData = createChatRoomApi(
          token: userdata.bearerToken!,
          userid: userdata.userId!,
          chatUserId: chatNeighbours.residentid!);
      update();
    } else {}
  }

  sendCatRequestStatusApi({
    required String token,
    required int id,
    required String status,
    required int userId,
    required int chatUserId,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.sendChatRequest),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "status": status,
        "sender": userId,
        "receiver": chatUserId,
      }),
    );

    if (response.statusCode == 200) {
      futureChatRoomData = createChatRoomApi(
          token: userdata.bearerToken!,
          userid: userdata.userId!,
          chatUserId: chatNeighbours.residentid!);
      update();
    } else {}
  }

  Future<ch.ChatRoomModel> createChatRoomApi({
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

      return ch.ChatRoomModel.fromJson(data);
    } else {
      return ch.ChatRoomModel.fromJson(data);
    }
  }
}
