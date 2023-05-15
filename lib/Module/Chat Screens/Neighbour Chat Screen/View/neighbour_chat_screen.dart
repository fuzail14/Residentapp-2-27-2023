import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Constants/api_routes.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';

// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Empty List/empty_list.dart';
import '../Controller/neighbour_chat_screen_controller.dart';

class NeighbourChatScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NeighbourChatScreenController>(
        init: NeighbourChatScreenController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(chatavailbilityscreen,
                  arguments: [controller.user, controller.resident]);
              return true;
            },
            child: SafeArea(
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
                            backgroundImage: NetworkImage(Api.imageBaseUrl +
                                controller.chatNeighbours.image.toString()),
                            maxRadius: 20,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            controller.chatNeighbours.firstname.toString() +
                                ' ' +
                                controller.chatNeighbours.lastname.toString(),
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
                      ),
                      onTap: () {
                        Get.offNamed(chatavailbilityscreen,
                            arguments: [controller.user, controller.resident]);
                      },
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('chats')
                                    .where('chatroomid',
                                        isEqualTo: controller.chatRoomId)
                                    .orderBy('createdat', descending: true)
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData) {
                                    var data = snapshot.data!.docs;

                                    if (data.length == 0) {
                                      return EmptyList(
                                          name:
                                              "Say Hi! to your Neighbour. 😊 .");
                                    }
                                    return ListView.builder(
                                      reverse: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        print(data[index]['residentid']);

                                        return Row(
                                          mainAxisAlignment: data[index]
                                                      ['residentid'] ==
                                                  controller.user.userId
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 16),
                                                    decoration: BoxDecoration(
                                                      color: data[index][
                                                                  'residentid'] ==
                                                              controller
                                                                  .user.userId
                                                          ? primaryColor
                                                          : Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: data![index][
                                                                'residentid'] ==
                                                            controller
                                                                .user.userId
                                                        ? Text(
                                                            data![index]
                                                                    ['message']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )
                                                        : Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              // Text(
                                                              //   data![index]
                                                              //   ['user']['firstname']
                                                              //       .toString(),
                                                              //   style: TextStyle(
                                                              //       color:
                                                              //       primaryColor),
                                                              // ),
                                                              Text(
                                                                data![index][
                                                                        'message']
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          )),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("Something Went Wrong ");
                                  } else {
                                    return Loader();
                                  }
                                }))),
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
                                try {
                                  // Get a reference to the Firestore collection
                                  CollectionReference chats = FirebaseFirestore
                                      .instance
                                      .collection('chats');

                                  // Add a new document with a generated ID
                                  chats.add({
                                    'residentid':
                                        controller.resident.residentid!,
                                    'message': controller.msg.text,
                                    'chatroomid': controller.chatRoomId,
                                    'createdat': FieldValue.serverTimestamp(),
                                  });

                                  controller.msg.clear();
                                  print('Data added successfully');
                                } catch (error) {
                                  print('Error adding data: $error');
                                }
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
            ),
          );
        });
  }

  // Example function to get a Firestore collection stream with a condition
}
