import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/Module/Profile/Controller/profile_controller.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../Chat Availbility/Model/ChatRoomModel.dart';
import '../../Chat Screens/Neighbour Chat Screen/Controller/neighbour_chat_screen_controller.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offNamed(chatavailbilityscreen,
                  arguments: [controller.userdata, controller.resident]);

              return false;
            },
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Profile',
                      onTap: () {
                        Get.offNamed(chatavailbilityscreen, arguments: [
                          controller.userdata,
                          controller.resident
                        ]);
                      },
                    ),
                    20.h.ph,
                    CachedNetworkImage(
                      width: 200.w,
                      fit: BoxFit.fitHeight,
                      imageUrl: Api.imageBaseUrl +
                          controller.chatNeighbours.image.toString(),
                      placeholder: (context, url) => Column(
                        children: [
                          CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        ],
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    20.h.ph,
                    Text(
                      "${controller.chatNeighbours.firstname.toString()} ${controller.chatNeighbours.lastname.toString()}",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.w, top: 10.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.deepPurple,
                          ),
                          5.w.pw,
                          Text(
                            "From",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.w.pw,
                          Text(
                            "${controller.chatNeighbours.city.toString()}",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.w, top: 10.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.verified_user,
                            color: Colors.deepPurple,
                          ),
                          5.w.pw,
                          Text(
                            "Joined At",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.w.pw,
                          Text(
                            "${laravelDateToFormattedDate(controller.chatNeighbours.createdAt.toString())}",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.w, top: 10.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                          5.w.pw,
                          Text(
                            "Username",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.w.pw,
                          Text(
                            "${controller.chatNeighbours.username}",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.w, top: 10.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.home_work,
                            color: Colors.deepPurple,
                          ),
                          5.w.pw,
                          Text(
                            "Property Type",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.w.pw,
                          Text(
                            "${controller.chatNeighbours.propertytype}",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.w, top: 10.h),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_history_rounded,
                            color: Colors.deepPurple,
                          ),
                          5.w.pw,
                          Text(
                            "Residental Type",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          5.w.pw,
                          Text(
                            "${controller.chatNeighbours.residenttype}",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.h.ph,
                    Expanded(
                      child: FutureBuilder(
                          future: controller.futureChatRoomData,
                          builder: (BuildContext context,
                              AsyncSnapshot<ChatRoomModel> snapshots) {
                            if (snapshots.hasData) {
                              if (snapshots.data!.data!.first.status
                                      .toString() ==
                                  'default') {
                                return Column(
                                  children: [
                                    MyButton(
                                      width: 300.w,
                                      height: 32.w,
                                      color: Colors.green,
                                      name: 'Add',
                                      onPressed: () {
                                        controller.sendCatRequestStatusApi(
                                            id: snapshots.data!.data!.first.id!,
                                            token: controller
                                                .userdata.bearerToken!,
                                            status: 'pending',
                                            userId: controller.userdata.userId!,
                                            chatUserId: snapshots
                                                .data!.data!.first.receiver!);
                                      },
                                    ),
                                  ],
                                );
                              } else if (snapshots.data!.data!.first.status
                                      .toString() ==
                                  'rejected') {
                                return Column(
                                  children: [
                                    MyButton(
                                      width: 300.w,
                                      height: 32.w,
                                      color: Colors.green,
                                      name: 'Add',
                                      onPressed: () {
                                        controller.sendCatRequestStatusApi(
                                            id: snapshots.data!.data!.first.id!,
                                            token: controller
                                                .userdata.bearerToken!,
                                            status: 'pending',
                                            userId: controller.userdata.userId!,
                                            chatUserId: snapshots
                                                .data!.data!.first.receiver!);
                                      },
                                    ),
                                  ],
                                );
                              } else if (snapshots.data!.data!.first.status
                                          .toString() ==
                                      'pending' &&
                                  snapshots.data!.data!.first.receiver ==
                                      controller.userdata.userId) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MyButton(
                                          width: 150.w,
                                          height: 32.w,
                                          color: Colors.green,
                                          name: 'Accept',
                                          onPressed: () {
                                            controller.chatRoomStatusApi(
                                                id: snapshots
                                                    .data!.data!.first.id!,
                                                token: controller
                                                    .userdata.bearerToken!,
                                                status: 'accepted',
                                                userId:
                                                    controller.userdata.userId!,
                                                chatUserId: snapshots.data!
                                                    .data!.first.receiver!);
                                          },
                                        ),
                                        MyButton(
                                          width: 150.w,
                                          height: 32.w,
                                          color: Colors.red,
                                          name: 'Reject',
                                          onPressed: () {
                                            controller.chatRoomStatusApi(
                                                id: snapshots
                                                    .data!.data!.first.id!,
                                                token: controller
                                                    .userdata.bearerToken!,
                                                status: 'rejected',
                                                userId:
                                                    controller.userdata.userId!,
                                                chatUserId: snapshots
                                                    .data!.data!.first.sender!);

                                            print(controller.userdata.userId);
                                            print(snapshots
                                                .data!.data!.first.sender!);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              } else if (snapshots.data!.data!.first.status
                                          .toString() ==
                                      'pending' &&
                                  snapshots.data!.data!.first.sender ==
                                      controller.userdata.userId) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        MyButton(
                                          width: 150.w,
                                          height: 32.w,
                                          color: Colors.blue,
                                          name: 'Request Sent',
                                          onPressed: () {},
                                        ),
                                        MyButton(
                                          width: 150.w,
                                          height: 32.w,
                                          color: Colors.white,
                                          textColor: Colors.black,
                                          name: 'Cancel',
                                          onPressed: () {
                                            controller.chatRoomStatusApi(
                                                id: snapshots
                                                    .data!.data!.first.id!,
                                                token: controller
                                                    .userdata.bearerToken!,
                                                status: 'default',
                                                userId:
                                                    controller.userdata.userId!,
                                                chatUserId: snapshots.data!
                                                    .data!.first.receiver!);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              } else if (snapshots.data!.data!.first.status
                                      .toString() ==
                                  'accepted') {
                                return Column(
                                  children: [
                                    MyButton(
                                      width: 300.w,
                                      height: 32.w,
                                      onPressed: () {
                                        Get.offNamed(neighbourchatscreen,
                                            arguments: [
                                              controller.userdata,
                                              //Login User
                                              controller.resident,
                                              // Resident Details
                                              controller.chatNeighbours,
                                              snapshots.data!.data!.first.id,
                                              ChatTypes.NeighbourChat.toString()
                                                  .split('.')
                                                  .last,
                                              // Chat User
                                            ]);
                                      },
                                      name: 'Chat',
                                    )
                                  ],
                                );
                              } else {
                                return Icon(Icons.add_box);
                              }
                            } else if (snapshots.hasError) {
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
          );
        });
  }
}
