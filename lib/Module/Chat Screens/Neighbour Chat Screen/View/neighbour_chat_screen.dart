import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Constants/api_routes.dart';
import 'package:userapp/Constants/constants.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../Controller/neighbour_chat_screen_controller.dart';
class  NeighbourChatScreen extends GetView {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NeighbourChatScreenController>(
      init: NeighbourChatScreenController(),
      builder: (controller) {
        return SafeArea(

          child:
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: primaryColor,
              flexibleSpace: Container(
                padding: EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageBaseUrl+ controller.chatneighbours.image.toString()),
                      maxRadius: 20,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            controller.chatneighbours.firstname.toString() +' ' +controller.chatneighbours.lastname.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500,
                                color: Colors.white
                                ),
                          ),

                        ],
                      ),
                    ),
                    // ZegoUIKitPrebuiltCallWithInvitation(
                    //   ringtoneConfig: ZegoRingtoneConfig(),
                    //   events: ZegoUIKitPrebuiltCallInvitationEvents(
                    //
                    //     onIncomingCallTimeout: (String timeout, ZegoCallUser? calluser){
                    //
                    //       print(calluser!.name);
                    //       print(calluser!.id);
                    //     },
                    //     onIncomingCallAcceptButtonPressed: (){
                    //
                    //
                    //       print( "Call Accepted");
                    //     }
                    //
                    //
                    //   ),
                    //     appID:2104827868,
                    //     tokenServerUrl: "wss://webliveroom2104827868-api.coolzcloud.com/ws",
                    //     appSign:"0c362ea56d0f9f4a0d5114cb0c33a83989d9982d15450c866cecd91b810840b8",
                    //     userID:  controller.chatneighbours.id.toString(),
                    //     userName:controller.chatneighbours.firstname.toString(),
                    //     notifyWhenAppRunningInBackgroundOrQuit: true,
                    //     // isIOSSandboxEnvironment: false,
                    //     plugins: [ZegoUIKitSignalingPlugin()],
                    //   child: Container(),
                    //
                    //
                    //
                    //
                    // ),
                    //
                    //
                    // ZegoSendCallInvitationButton(
                    //   /// For offline call notification
                    //   ///
                    //   resourceID: "zegouikit_call",
                    //   icon: ButtonIcon(icon: Icon(Icons.video_call,color: Colors.white,)),
                    //
                    //   isVideoCall: true,
                    //   invitees: [
                    //     ZegoUIKitUser(
                    //         id: controller.userdata.userid.toString(),
                    //         name: controller.userdata.firstName.toString()
                    //     ),
                    //
                    //   ],
                    // ),
                    // ZegoSendCallInvitationButton(
                    //   /// For offline call notification
                    //   ///
                    //   resourceID: "zegouikit_call",
                    //   icon: ButtonIcon(icon: Icon(Icons.call,color: Colors.white),),
                    //
                    //   isVideoCall: false,
                    //   invitees: [
                    //     ZegoUIKitUser(
                    //         id: controller.userdata.userid.toString(),
                    //         name: controller.userdata.firstName.toString()
                    //     ),
                    //
                    //   ],
                    // ),

                    // GestureDetector(onTap: () {
                    //
                    //
                    //   Get.toNamed(audiocallscreen,arguments: [
                    //     controller.userdata,
                    //     controller.chatRoomid
                    //
                    //   ]);
                    //
                    // }, child: Icon(Icons.call,color: Colors.white,)),

                  ],
                ),
              ),
            ),
            body: Stack(
              children: <Widget>[


                FutureBuilder(
                    future: controller.ViewConversationNeighboursApi(
                        token: controller.userdata.bearerToken!,
                        chatroomid: controller.chatRoomid),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return
                          SingleChildScrollView(
                            controller: controller.sc,
                          physics: ScrollPhysics(),
                          child: ListView.builder(

                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10, bottom: 55),
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment: (snapshot.data [index].sender== controller.userdata.userid
                                      ? Alignment.topRight
                                      : Alignment.topLeft),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: (snapshot.data[index].sender  != controller.userdata.userid
                                          ? Colors.black54
                                          : primaryColor),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      snapshot.data[index].message,
                                      style: TextStyle(fontSize: 15,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
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
                        FloatingActionButton(
                          onPressed: () {
                            controller.conversationsApi(
                                token: controller.userdata.bearerToken!,
                                userid: controller.userdata.userid!,
                                residentid:controller.chatneighbours.residentid! ,
                                message: controller.msg.text,
                                chatroomid: controller.chatRoomid!);

                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          backgroundColor: primaryColor,
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      }
    );
  }
}
