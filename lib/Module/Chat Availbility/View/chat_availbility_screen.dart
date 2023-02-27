import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/Constants/api_routes.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Routes/set_routes.dart';
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
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Chats',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: primaryColor,
                      tabs: [
                        Tab(
                          child: Text('Gatekeepers',
                              style: TextStyle(color: primaryColor)),
                        ),
                        Tab(
                          child: Text('Neighbours',
                              style: TextStyle(color: primaryColor)),
                        ),
                      ],
                      labelColor: Colors.white,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          FutureBuilder(
                              future: controller.viewChatGatekeepers(
                                  subadminid: controller.resident.subadminid!,
                                  token: controller.userdata.bearerToken!),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 30,
                                              backgroundImage: NetworkImage(
                                                  imageBaseUrl +
                                                      snapshot.data.data[index]
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
                                                        .gatekeeperid,
                                                    token: controller
                                                        .userdata.bearerToken!,
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
                                                                .userid!,
                                                            chatuserid: snapshot
                                                                .data
                                                                .data[index]
                                                                .gatekeeperid);

                                                    final ChatRoomUsers
                                                        chatRoomUsers =
                                                        await controller
                                                            .fetchchatroomusers(
                                                      userid: controller
                                                          .userdata.userid!,
                                                      chatuserid: snapshot
                                                          .data
                                                          .data[index]
                                                          .gatekeeperid,
                                                      token: controller.userdata
                                                          .bearerToken!,
                                                    );
                                                    print("----");
                                                    print(chatRoomUsers
                                                        .data!.chatroomid);
                                                    print("----");
                                                    Get.toNamed(neighbourchatscreen,
                                                        arguments: [
                                                          controller
                                                              .userdata, //Login User
                                                          controller.resident,
                                                          snapshot
                                                              .data.data[index],
                                                          chatRoomUsers
                                                              .data!.chatroomid,
                                                          // Chat User
                                                        ]);
                                                  }

                                                  print(controller.userdata);
                                                  print(controller.resident);
                                                  print(snapshot.data
                                                      .data[index].runtimeType);
                                                  Get.toNamed(neighbourchatscreen,
                                                      arguments: [
                                                        controller
                                                            .userdata, //Login User
                                                        controller.resident,
                                                        snapshot
                                                            .data.data[index],
                                                        chatRoomUsers.data!
                                                            .chatroomid // Chat User
                                                      ]);
                                                },
                                                title: Text(
                                                    snapshot.data.data[index]
                                                            .firstname +
                                                        ' ' +
                                                        snapshot
                                                            .data
                                                            .data[index]
                                                            .lastname,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                subtitle: Row(children: [
                                                  Icon(
                                                    Colors.blue == Colors.blue
                                                        ? Icons.done_all
                                                        : Icons.done,
                                                    size: 15,
                                                    color: Colors.green,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                  return CircularProgressIndicator();
                                }
                              }),
                          FutureBuilder(
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
                                                  const EdgeInsets.all(8.0),
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
                                                        print(snapshot
                                                            .data
                                                            .data[index]
                                                            .residentid);
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
                                  return CircularProgressIndicator();
                                }
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ChatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            SingleChatWidget(
                chatTitle: "Bae",
                chatMessage: 'Ok good night',
                seenStatusColor: Colors.blue,
                imageUrl:
                    'https://static-koimoi.akamaized.net/wp-content/new-galleries/2020/09/maisie-williams-aka-arya-stark-of-game-of-thrones-someone-told-me-in-season-three-that-i-was-going-to-kill-the-night-king001.jpg'),
          ],
        ),
      ),
    );
  }
}

class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final Color? seenStatusColor;
  final String? imageUrl;

  const SingleChatWidget({
    this.chatMessage,
    this.chatTitle,
    this.seenStatusColor,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(neighbourchatscreen, arguments: chatTitle);
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl!),
          ),
          Expanded(
            child: ListTile(
              title: Text('$chatTitle',
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Row(children: [
                Icon(
                  seenStatusColor == Colors.blue ? Icons.done_all : Icons.done,
                  size: 15,
                  color: seenStatusColor,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      '$chatMessage',
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
