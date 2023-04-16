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
    return SafeArea(
      child: GetBuilder<ChatAvailbilityController>(
          init: ChatAvailbilityController(),
          builder: (controller) {
            return  Scaffold(body:
            Column(
              children: [
                        MyBackButton(
                          text:'Neighbours',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                Expanded(
                  child: FutureBuilder(
                      future: controller.viewChatNeighbours(
                          subadminid: controller.resident.subadminid!,
                          token: controller.userdata.bearerToken!),
                      builder: (BuildContext context,
                          AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.data.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return (snapshot.data.data[index]
                                  .residentid ==
                                  controller.userdata.userid)
                                  ? Container()
                                  : Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                      NetworkImage(
                                          imageBaseUrl +
                                              snapshot
                                                  .data
                                                  .data[index]
                                                  .image
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
                                                .userdata.userid!,
                                            chatuserid: snapshot
                                                .data
                                                .data[index]
                                                .residentid,
                                            token: controller
                                                .userdata
                                                .bearerToken!,
                                          );

                                          if (chatRoomUsers
                                              .data ==
                                              null) {
                                            await controller.createChatRoomApi(
                                                token: controller
                                                    .userdata
                                                    .bearerToken!,
                                                userid: controller
                                                    .userdata
                                                    .userid!,
                                                chatuserid: snapshot
                                                    .data
                                                    .data[index]
                                                    .residentid);

                                            final ChatRoomUsers
                                            chatRoomUsers =
                                            await controller
                                                .fetchchatroomusers(
                                              userid: controller
                                                  .userdata
                                                  .userid!,
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
                                                      .userdata, //Login User
                                                  controller
                                                      .resident,
                                                  snapshot.data
                                                      .data[
                                                  index],
                                                  chatRoomUsers
                                                      .data!
                                                      .chatroomid // Chat User
                                                ]);
                                          }

                                          print(controller
                                              .userdata);
                                          print(controller
                                              .resident);
                                          print(snapshot
                                              .data
                                              .data[index]
                                              .runtimeType);
                                          Get.toNamed(neighbourchatscreen,
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
                                        subtitle: Row(children: [
                                          Icon(
                                            Colors.blue ==
                                                Colors.blue
                                                ? Icons.done_all
                                                : Icons.done,
                                            size: 15,
                                            color: Colors.green,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .only(
                                                  left: 6.0),
                                              child: Text(
                                                'dsdj',
                                                style: const TextStyle(
                                                    overflow:
                                                    TextOverflow
                                                        .ellipsis),
                                              ),
                                            ),
                                          ),
                                        ]),
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
            ) ,);


          }),
    );
  }
}


