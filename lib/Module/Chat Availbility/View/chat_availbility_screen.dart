import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Constants/api_routes.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../Controller/chat_availibility_controller.dart';
import '../Model/ChatRoomUsers.dart';

class ChatAvailbilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: GetBuilder<ChatAvailbilityController>(
            init: ChatAvailbilityController(),
            builder: (controller) {
              return WillPopScope(
                onWillPop: () async {
                  Get.offNamed(homescreen, arguments: controller.userdata);
                  return true;
                },
                child: Scaffold(
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Neighbours',
                        onTap: () {
                          Get.offNamed(homescreen,
                              arguments: controller.userdata);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: FutureBuilder(
                            future: controller.viewChatNeighbours(
                                subadminid: controller.resident.subadminid!,
                                token: controller.userdata.bearerToken!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return (snapshot
                                                .data.data[index].residentid ==
                                            controller.userdata.userId)
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                      Api.imageBaseUrl +
                                                          snapshot.data
                                                              .data[index].image
                                                              .toString()),
                                                ),
                                                Expanded(
                                                  child: ListTile(
                                                    onTap: () async {
                                                      final ChatRoomUsers
                                                          chatRoomUsers =
                                                          await controller
                                                              .fetchchatroomusers(
                                                        userid: controller
                                                            .userdata.userId!,
                                                        chatuserid: snapshot
                                                            .data
                                                            .data[index]
                                                            .residentid,
                                                        token: controller
                                                            .userdata
                                                            .bearerToken!,
                                                      );

                                                      if (chatRoomUsers.data ==
                                                          null) {
                                                        await controller
                                                            .createChatRoomApi(
                                                                token: controller
                                                                    .userdata
                                                                    .bearerToken!,
                                                                userid: controller
                                                                    .userdata
                                                                    .userId!,
                                                                chatuserid: snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .residentid);

                                                        final ChatRoomUsers
                                                            chatRoomUsers =
                                                            await controller
                                                                .fetchchatroomusers(
                                                          userid: controller
                                                              .userdata.userId!,
                                                          chatuserid: snapshot
                                                              .data
                                                              .data[index]
                                                              .residentid,
                                                          token: controller
                                                              .userdata
                                                              .bearerToken!,
                                                        );
                                                        Get.offNamed(
                                                            neighbourchatscreen,
                                                            arguments: [
                                                              controller
                                                                  .userdata, //Login User
                                                              controller
                                                                  .resident,
                                                              snapshot.data
                                                                  .data[index],
                                                              chatRoomUsers
                                                                  .data!
                                                                  .chatroomid // Chat User
                                                            ]);
                                                      } else {
                                                        final ChatRoomUsers
                                                            chatRoomUsers =
                                                            await controller
                                                                .fetchchatroomusers(
                                                          userid: controller
                                                              .userdata.userId!,
                                                          chatuserid: snapshot
                                                              .data
                                                              .data[index]
                                                              .residentid,
                                                          token: controller
                                                              .userdata
                                                              .bearerToken!,
                                                        );
                                                        Get.toNamed(
                                                            neighbourchatscreen,
                                                            arguments: [
                                                              controller
                                                                  .userdata,
                                                              controller
                                                                  .resident,
                                                              snapshot.data
                                                                  .data[index],
                                                              chatRoomUsers
                                                                  .data!
                                                                  .chatroomid
                                                              // Chat User
                                                            ]);
                                                      }
                                                    },
                                                    title: Text(
                                                        snapshot
                                                                .data
                                                                .data[index]
                                                                .firstname +
                                                            ' ' +
                                                            snapshot
                                                                .data
                                                                .data[index]
                                                                .lastname,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return Loader();
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
