import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Constants/api_routes.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../Controller/chat_availibility_controller.dart';

class ChatAvailbilityScreen extends StatelessWidget {
  final ChatAvailbilityController controller =
      Get.put(ChatAvailbilityController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatAvailbilityController>(
        init: ChatAvailbilityController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);
              return true;
            },
            child: Center(
              child: SafeArea(
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
                            future: controller.futureChatNeighboursData,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // controller.futureChatRoomData =
                                    //     controller.createChatRoomApi(
                                    //         token: controller
                                    //             .userdata.bearerToken!,
                                    //         userid: controller.userdata.userId!,
                                    //         chatUserId: snapshot
                                    //             .data.data[index].residentid);

                                    return (snapshot
                                                .data.data[index].residentid ==
                                            controller.userdata.userId)
                                        ? Container()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ListTile(
                                              leading: Container(
                                                width: 50.w,
                                                height: 50.w,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: Image.network(
                                                  Api.imageBaseUrl +
                                                      snapshot.data.data[index]
                                                          .image
                                                          .toString(),
                                                  width: 50.w,
                                                  height: 50.w,
                                                ),
                                              ),
                                              title: Text(
                                                  snapshot.data.data[index]
                                                          .firstname +
                                                      ' ' +
                                                      snapshot.data.data[index]
                                                          .lastname,
                                                  style: GoogleFonts.quicksand(
                                                      color:
                                                          HexColor('#0D0B0C'),
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              trailing: MyButton(
                                                onPressed: () async {
                                                  final chatRoomModel =
                                                      await controller
                                                          .createChatRoomApi(
                                                              token:
                                                                  controller
                                                                      .userdata
                                                                      .bearerToken!,
                                                              userid:
                                                                  controller
                                                                      .userdata
                                                                      .userId!,
                                                              chatUserId: snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .residentid);

                                                  print(controller.userdata);
                                                  print(controller.resident);
                                                  print(snapshot.data
                                                      .data[index].runtimeType);
                                                  print(chatRoomModel);

                                                  Get.offNamed(profile,
                                                      arguments: [
                                                        controller.userdata,
                                                        controller.resident,
                                                        snapshot
                                                            .data.data[index],
                                                        chatRoomModel
                                                      ]);
                                                },
                                                name: 'Profile',
                                                width: 100.w,
                                                height: 30.w,
                                              ),
                                              // trailing: FutureBuilder(
                                              //     future: controller
                                              //         .futureChatRoomData,
                                              //     builder:
                                              //         (BuildContext context,
                                              //             AsyncSnapshot<
                                              //                     ChatRoomModel>
                                              //                 snapshots) {
                                              //       if (snapshots.hasData) {
                                              //         if (snapshots.data!.data!
                                              //                 .first.status
                                              //                 .toString() ==
                                              //             'default') {
                                              //           return IconButton(
                                              //               onPressed: () {
                                              //                 controller.chatRoomStatusApi(
                                              //                     id: snapshots
                                              //                         .data!
                                              //                         .data!
                                              //                         .first
                                              //                         .id!,
                                              //                     token: controller
                                              //                         .userdata
                                              //                         .bearerToken!,
                                              //                     status:
                                              //                         'pending');
                                              //               },
                                              //               icon: Icon(
                                              //                   Icons.add_box));
                                              //         } else if (snapshots
                                              //                     .data!
                                              //                     .data!
                                              //                     .first
                                              //                     .status
                                              //                     .toString() ==
                                              //                 'pending' &&
                                              //             snapshots
                                              //                     .data!
                                              //                     .data!
                                              //                     .first
                                              //                     .chatuserid ==
                                              //                 controller
                                              //                     .userdata
                                              //                     .userId) {
                                              //           return Row(
                                              //             mainAxisSize:
                                              //                 MainAxisSize.min,
                                              //             children: [
                                              //               TextButton(
                                              //                   onPressed: () {
                                              //                     controller.chatRoomStatusApi(
                                              //                         id: snapshots
                                              //                             .data!
                                              //                             .data!
                                              //                             .first
                                              //                             .id!,
                                              //                         token: controller
                                              //                             .userdata
                                              //                             .bearerToken!,
                                              //                         status:
                                              //                             'accepted');
                                              //                   },
                                              //                   child: Text(
                                              //                       'Accept')),
                                              //               TextButton(
                                              //                   onPressed: () {
                                              //                     controller.chatRoomStatusApi(
                                              //                         id: snapshots
                                              //                             .data!
                                              //                             .data!
                                              //                             .first
                                              //                             .id!,
                                              //                         token: controller
                                              //                             .userdata
                                              //                             .bearerToken!,
                                              //                         status:
                                              //                             'rejected');
                                              //                   },
                                              //                   child: Text(
                                              //                     'Reject',
                                              //                   )),
                                              //             ],
                                              //           );
                                              //         } else if (snapshots
                                              //                 .data!
                                              //                 .data!
                                              //                 .first
                                              //                 .status
                                              //                 .toString() ==
                                              //             'pending') {
                                              //           return Text(
                                              //               'Request Sent');
                                              //         } else if (snapshots
                                              //                 .data!
                                              //                 .data!
                                              //                 .first
                                              //                 .status
                                              //                 .toString() ==
                                              //             'accepted') {
                                              //           return IconButton(
                                              //               onPressed: () {
                                              //                 Get.offNamed(
                                              //                     neighbourchatscreen,
                                              //                     arguments: [
                                              //                       controller
                                              //                           .userdata,
                                              //                       //Login User
                                              //                       controller
                                              //                           .resident,
                                              //                       // Resident Details
                                              //                       snapshot.data
                                              //                               .data[
                                              //                           index],
                                              //                       snapshots
                                              //                           .data!
                                              //                           .data!
                                              //                           .first
                                              //                           .id,
                                              //                       ChatTypes.NeighbourChat
                                              //                               .toString()
                                              //                           .split(
                                              //                               '.')
                                              //                           .last,
                                              //                       // Chat User
                                              //                     ]);
                                              //               },
                                              //               icon: Icon(Icons
                                              //                   .messenger_outline));
                                              //         } else {
                                              //           return Icon(
                                              //               Icons.add_box);
                                              //         }
                                              //       } else if (snapshots
                                              //           .hasError) {
                                              //         return Icon(
                                              //             Icons.error_outline);
                                              //       } else {
                                              //         return Icon(
                                              //           Icons.watch_later_sharp,
                                              //           color: primaryColor,
                                              //         );
                                              //       }
                                              //     }),
                                            ));
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
              ),
            ),
          );
        });
    ;
  }
}
