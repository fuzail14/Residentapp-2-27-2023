import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Constants/api_routes.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Services/Notification%20Services/notification_services.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../Widgets/Empty List/empty_list.dart';
import '../Controller/neighbour_chat_screen_controller.dart';

class NeighbourChatScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NeighbourChatScreenController>(
        init: NeighbourChatScreenController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  MyBackButton(
                      text: '.',
                      widget: Row(
                        children: [
                          SizedBox(
                            width: 2,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(imageBaseUrl +
                                controller.chatNeighbours.image.toString()),
                            maxRadius: 20,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            controller.chatNeighbours.firstname.toString() +
                                ' ' +
                                controller.chatNeighbours.lastname
                                    .toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),



//                             ZegoUIKitPrebuiltCallWithInvitation(
//                               androidNotificationConfig: ZegoAndroidNotificationConfig(channelID:'ZegoUIKit',channelName: 'Zego Call' ),
//                               appID: 1638049856,
//                               appSign: 'a8d10d15eeba1ff7e3d154b941f9c3a8d3dd7853c8be379e04d5379ea14caaba',
//                               userID:controller. chatneighbours.id.toString(),
//                               userName:controller.chatneighbours.firstname.toString(),
//                               plugins: [ZegoUIKitSignalingPlugin()],
//                               notifyWhenAppRunningInBackgroundOrQuit: true, child: Container(),
//
//                             ),
//                             ZegoSendCallInvitationButton(
//                               iconSize: Size(MediaQuery.of(context).size.width*2,MediaQuery.of(context).size.height*0.04),
//
//                               onPressed: (String a,String b, List<String> str) async{
// await controller.ZegoCallApi(token: controller!.userdata.bearerToken!, residentid:controller!.chatneighbours.id!);
//
//                               },
//                               /// For offline call notification
//                               resourceID: "zegouikit_call",
//                               isVideoCall: false,
//                               invitees: [
//
//                                 ZegoUIKitUser(
//                                     id: controller.userdata.userid.toString(),
//                                     name: controller.userdata.firstName.toString()
//                                 ),
//                               ],
//                             ),
//


                        ],
                      )),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: FutureBuilder(
                          future: controller.ViewConversationNeighboursApi(
                              token: controller.userdata.bearerToken!,
                              chatroomid: controller.chatRoomId),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {

    if (snapshot.data != null && snapshot.data!.length != 0) {

    return ListView.builder(
                                reverse: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment:
                                        snapshot.data[index].sender ==
                                                controller.userdata.userid
                                            ? MainAxisAlignment.end
                                            : MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 16),
                                              decoration: BoxDecoration(
                                                color: snapshot.data[index]
                                                            .sender ==
                                                        controller
                                                            .userdata.userid
                                                    ? primaryColor
                                                    : Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                snapshot.data[index].message
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );}
    else { return  EmptyList(name: 'Say Hi ! to your Neighbour'); }
                            } else if (snapshot.hasError) {
                              return Icon(Icons.error_outline);
                            } else {
                              return Loader();
                            }
                          }),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            maxLines: null,
                            controller: controller.msg,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              controller.conversationsApi(
                                  token: controller.userdata.bearerToken!,
                                  userid: controller.userdata.userid!,
                                  residentid:
                                      controller.chatNeighbours.residentid!,
                                  message: controller.msg.text,
                                  chatroomid: controller.chatRoomId);
                            },
                            child: Icon(Icons.send)),
                        SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
