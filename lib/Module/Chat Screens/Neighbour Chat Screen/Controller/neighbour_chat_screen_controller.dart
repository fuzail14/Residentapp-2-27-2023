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
  final TextEditingController msg = TextEditingController();

  // bool isChat = false;
  // bool isSend=false;

  // StreamController<List<ViewConversationNeighbours>> conversationNeighboursStreamController =
  //     StreamController<List<ViewConversationNeighbours>>();
  //

  // List<ViewConversationNeighbours> v = [];
  //



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    user = data[0];
    resident = data[1];
    chatNeighbours = data[2];
    chatRoomId=data[3];


    // _initiatePusherSocketForMessaging();
    //
    //
    //
    // update();






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
      body: jsonEncode(<String, dynamic>
      {
        "loginuserid": userid,
        "chatuserid": chatuserid,


      }

      ),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);


      return ChatRoomModel.fromJson(data);

    } else {
      return ChatRoomModel.fromJson(data);
    }
  }


  // Future<List<ViewConversationNeighbours>> ViewConversationNeighboursApi(
  //     {required int chatroomid,
  //     required String token}) async {
  //   print(token);
  //
  //   final response = await Http.get(
  //     Uri.parse(Api.viewconversationsneighbours +
  //         "/" +
  //         chatroomid.toString() ),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': "Bearer $token"
  //     },
  //   );
  //   print(response.body);
  //   var data = jsonDecode(response.body.toString());
  //
  //   ;
  //
  //   if (response.statusCode == 200) {
  //
  //
  //     v = (data['data'] as List)
  //         .map((e) => ViewConversationNeighbours(
  //             lastmessage: e['lastmessage'],
  //             sender: e['sender'],
  //             reciever: e['reciever'],
  //             chatroomid: e['chatroomid'],
  //             created_at: e['created_at'],
  //             message: e['message'],
  //             success: e['success'],
  //             updated_at: e['updated_at']))
  //         .toList();
  //
  //     conversationNeighboursStreamController.sink.add(v);
  //
  //
  //
  //
  //     return v;
  //   }
  //   v = (data as List)
  //       .map((e) => ViewConversationNeighbours(
  //           sender: e['sender'],
  //           reciever: e['reciever'],
  //           lastmessage: e['lastmessage'],
  //           chatroomid: e['chatroomid'],
  //           created_at: e['created_at'],
  //           message: e['message'],
  //           success: e['success'],
  //           updated_at: e['updated_at']))
  //       .toList();
  //   conversationNeighboursStreamController.sink.add(v);
  //
  //   update();
  //
  //
  //
  //   return v;
  // }

  // Future conversationsApi({
  //   required String token,
  //   required int userid,
  //   required int residentid,
  //   required int chatroomid,
  //   required String message,
  // }) async {
  //   print(userid);
  //   print(residentid);
  //   msg.text = '';
  //   final response = await Http.post(
  //     Uri.parse(Api.conversations),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': "Bearer $token"
  //     },
  //     body: jsonEncode(<String, dynamic>{
  //       "sender": userid,
  //       "reciever": residentid,
  //       "chatroomid": chatroomid,
  //       "message": message,
  //     }),
  //   );
  //   print(response.body);
  //
  //
  //
  //   if (response.statusCode == 200) {
  //
  //
  //
  //
  //
  //   } else {
  //     Get.snackbar("Failed to send msg", "");
  //   }
  // }
  //



  //
  // Future ZegoCallApi({
  //   required String token,
  //   required int residentid,
  //
  // }) async {
  //
  //
  //   final response = await Http.get(
  //     Uri.parse(Api.zegocall+"/"+residentid.toString()),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': "Bearer $token"
  //     },
  //
  //   );
  //
  //
  //   if (response.statusCode == 200) {
  //
  //
  //     print("Success");
  //
  //   } else {
  //     Get.snackbar("Failed to send msg", "");
  //   }
  // }


  // Stream<QuerySnapshot<Map<String, dynamic>>> getUsersChats({required chatroomids}) {
  //   // Reference to the Firestore collection
  //   CollectionReference<Map<String, dynamic>> collectionReference =
  //   FirebaseFirestore.instance.collection('chats');
  //
  //   // Stream to filter documents based on a condition
  //
  //   Stream<QuerySnapshot<Map<String, dynamic>>> stream = collectionReference.where('chatroomid', isEqualTo: chatroomids)   .orderBy('createdat' , descending: true).snapshots();
  //
  //
  //   return stream;
  // }

  // Future<void> _initiatePusherSocketForMessaging() async {
  //   pusher = PusherClient(
  //       YOUR_APP_KEY,
  //       PusherOptions(
  //         host: 'http://192.168.10.3:8000',
  //         cluster: 'ap2',
  //         auth: PusherAuth(
  //           'http://192.168.10.3:8000',
  //           headers: {
  //             'Authorization': 'Bearer ${user.bearerToken}',
  //             'Content-Type': 'application/json'
  //           },
  //         ),
  //       ),
  //       autoConnect: false);
  //
  //   pusher.connect();
  //
  //   pusher.onConnectionStateChange((state) {
  //     print(
  //         "previousState: ${state!.previousState}, currentState: ${state.currentState}");
  //   });
  //
  //   pusher.onConnectionError((error) {
  //     print("error: ${error!.message}");
  //   });
  //
  //   Channel channel = pusher.subscribe('my-channel');
  //
  //   channel.bind('my-event', (PusherEvent? event) {
  //     // print('event data: ' + event!.data.toString());
  //
  //     update();
  //     var data = jsonDecode(event!.data.toString());
  //
  //     v.add(ViewConversationNeighbours(
  //         sender: data['message']['sender'],
  //         reciever: data['message']['reciever'],
  //         lastmessage: data['message']['lastmessage'],
  //         chatroomid: data['message']['chatroomid'],
  //         created_at: data['message']['created_at'],
  //         message: data['message']['message'],
  //         success: data['message']['success'],
  //         updated_at: data['message']['updated_at']));
  //
  //     conversationNeighboursStreamController.sink.add(v);
  //
  //     update();
  //   });
  // }



}
