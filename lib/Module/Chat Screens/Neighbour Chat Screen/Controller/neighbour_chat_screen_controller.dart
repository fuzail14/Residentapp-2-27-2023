import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
// import 'package:flutter_callkit_incoming/entities/android_params.dart';
// import 'package:flutter_callkit_incoming/entities/call_event.dart';
// import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
// import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:pusher_client/pusher_client.dart';
import 'package:userapp/Module/Audio%20Call%20Screen/View/audio_call_screen.dart';

import '../../../../Constants/api_routes.dart';
import '../../../../main.dart';

import '../../../Chat Availbility/Model/ChatNeighbours.dart' as ChatNeighbours;
import '../../../Chat Availbility/Model/ChatRoomModel.dart';
import '../../../HomeScreen/Model/residents.dart';
import '../../../Login/Model/User.dart';

import '../Model/ViewConversationNeighbours.dart';

class NeighbourChatScreenController extends GetxController {
  var data = Get.arguments;
  final ScrollController sc = ScrollController();
  late final User userdata;
  late final ChatRoomModel chatRoomModel;
late int chatRoomid;
  bool isChat = false;
  late final Residents resident;

  List<ViewConversationNeighbours> v = [];
  final TextEditingController msg = TextEditingController();
  late final ChatNeighbours.Data chatneighbours;
  StreamController<List<ViewConversationNeighbours>>conversationneighboursstreamController =
      StreamController<List<ViewConversationNeighbours>>();

  Future<void> _initiatePusherSocketForMessaging() async {
    pusher = PusherClient(
        YOUR_APP_KEY,
        PusherOptions(
          host: 'http://192.168.10.3:8000',
          cluster: 'ap2',
          auth: PusherAuth(
            'http://192.168.10.3:8000',
            headers: {
              'Authorization': 'Bearer ${userdata.bearerToken}',
              'Content-Type': 'application/json'
            },
          ),
        ),
        autoConnect: false);

    pusher.connect();

    pusher.onConnectionStateChange((state) {
      print(
          "previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });

    pusher.onConnectionError((error) {
      print("error: ${error!.message}");
    });

    Channel channel = pusher.subscribe('my-channel');

    channel.bind('my-event', (PusherEvent? event) {
      // print('event data: ' + event!.data.toString());

      update();
      var data = jsonDecode(event!.data.toString());

      v.add(ViewConversationNeighbours(
          sender: data['message']['sender'],
          reciever: data['message']['reciever'],
          lastmessage: data['message']['lastmessage'],
          chatroomid: data['message']['chatroomid'],
          created_at: data['message']['created_at'],
          message: data['message']['message'],
          success: data['message']['success'],
          updated_at: data['message']['updated_at']));

      conversationneighboursstreamController.sink.add(v);

      update();
    });
  }






  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    userdata = data[0];
    resident = data[1];
    chatneighbours = data[2];
    chatRoomid=data[3];

    _initiatePusherSocketForMessaging();


    // CallKitParams callKitParams = CallKitParams(
    //   id: userdata.userid.toString(),
    //   nameCaller: userdata.firstName.toString(),
    //   appName: 'Smart Gate',
    //   avatar: 'https://i.pravatar.cc/100',
    //   handle: '0123456789',
    //   type: 0,
    //   textAccept: 'Accept',
    //   textDecline: 'Decline',
    //   textMissedCall: 'Missed call',
    //   textCallback: 'Call back',
    //   duration: 30000,
    //   extra: <String, dynamic>{'userId': userdata.userid.toString()},
    //   headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
    //   android: const AndroidParams(
    //
    //       isCustomNotification: true,
    //       isShowLogo: false,
    //       isShowCallback: false,
    //       isShowMissedCallNotification: true,
    //       ringtonePath: 'system_ringtone_default',
    //       backgroundColor: '#0955fa',
    //       backgroundUrl: 'https://i.pravatar.cc/500',
    //       actionColor: '#4CAF50',
    //       incomingCallNotificationChannelName: "Incoming Call",
    //       missedCallNotificationChannelName: "Missed Call"),
    //
    // );
    // setIncomingCallNotification(callKitParams);




  }


// setIncomingCallNotification(callKitParams)
// {
//  FlutterCallkitIncoming.showCallkitIncoming(callKitParams);
//
//  FlutterCallkitIncoming.onEvent.listen((CallEvent? event) {
//    switch (event!.event) {
//      case Event.ACTION_CALL_INCOMING:
//
//        break;
//      case Event.ACTION_CALL_START:
//      // TODO: started an outgoing call
//      // TODO: show screen calling in Flutter
//        break;
//      case Event.ACTION_CALL_ACCEPT:
//      // TODO: accepted an incoming call
//      // TODO: show screen calling in Flutter
//        break;
//      case Event.ACTION_CALL_DECLINE:
//      // TODO: declined an incoming call
//        break;
//      case Event.ACTION_CALL_ENDED:
//      // TODO: ended an incoming/outgoing call
//        break;
//      case Event.ACTION_CALL_TIMEOUT:
//      // TODO: missed an incoming call
//        break;
//      case Event.ACTION_CALL_CALLBACK:
//      // TODO: only Android - click action `Call back` from missed call notification
//        break;
//      case Event.ACTION_CALL_TOGGLE_HOLD:
//      // TODO: only iOS
//        break;
//      case Event.ACTION_CALL_TOGGLE_MUTE:
//      // TODO: only iOS
//        break;
//      case Event.ACTION_CALL_TOGGLE_DMTF:
//      // TODO: only iOS
//        break;
//      case Event.ACTION_CALL_TOGGLE_GROUP:
//      // TODO: only iOS
//        break;
//      case Event.ACTION_CALL_TOGGLE_AUDIO_SESSION:
//      // TODO: only iOS
//        break;
//      case Event.ACTION_DID_UPDATE_DEVICE_PUSH_TOKEN_VOIP:
//      // TODO: only iOS
//        break;
//    }} );}
//

  Future<List<ViewConversationNeighbours>> ViewConversationNeighboursApi(
      {required int chatroomid,
      required String token}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.viewconversationsneighbours +
          "/" +
          chatroomid.toString() ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {


      v = (data['data'] as List)
          .map((e) => ViewConversationNeighbours(
              lastmessage: e['lastmessage'],
              sender: e['sender'],
              reciever: e['reciever'],
              chatroomid: e['chatroomid'],
              created_at: e['created_at'],
              message: e['message'],
              success: e['success'],
              updated_at: e['updated_at']))
          .toList();

      conversationneighboursstreamController.sink.add(v);


      return v;
    }
    v = (data as List)
        .map((e) => ViewConversationNeighbours(
            sender: e['sender'],
            reciever: e['reciever'],
            lastmessage: e['lastmessage'],
            chatroomid: e['chatroomid'],
            created_at: e['created_at'],
            message: e['message'],
            success: e['success'],
            updated_at: e['updated_at']))
        .toList();
    conversationneighboursstreamController.sink.add(v);


    return v;
  }

  Future conversationsApi({
    required String token,
    required int userid,
    required int residentid,
    required int chatroomid,
    required String message,
  }) async {
    print(userid);
    print(residentid);
    msg.text = '';
    final response = await Http.post(
      Uri.parse(Api.conversations),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "sender": userid,
        "reciever": residentid,
        "chatroomid": chatroomid,
        "message": message,
      }),
    );
    print(response.body);



    if (response.statusCode == 200) {

      sc.position.animateTo(
        sc.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );



    } else {
      Get.snackbar("Failed to send msg", "");
    }
  }


  Future<ChatRoomModel> createChatRoomApi({
    required String token,
    required int userid,
    required int chatuserid,



  }) async {
    final response = await Http.post(
      Uri.parse(Api.createchatroom),
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
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);


      return ChatRoomModel.fromJson(data);

    } else {
      return ChatRoomModel.fromJson(data);
    }
  }


}
