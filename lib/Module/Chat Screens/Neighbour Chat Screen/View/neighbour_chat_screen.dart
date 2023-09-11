import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Constants/api_routes.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';

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
              if (controller.chatType == "NeighbourChat") {
                Get.offNamed(chatavailbilityscreen,
                    arguments: [controller.user, controller.resident]);
              } else if (controller.chatType == "MarketPlaceChat") {
                Get.offNamed(marketPlaceScreen,
                    arguments: [controller.user, controller.resident]);
              }
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                // persistentFooterAlignment: AlignmentDirectional.center,
                // persistentFooterButtons: [
                //   Container(
                //     width: 134.w,
                //     height: 5.w,
                //     decoration: BoxDecoration(
                //         color: primaryColor,
                //         borderRadius: BorderRadius.circular(100.r)),
                //   )
                // ],
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                    MyBackButton(
                      widget: Row(
                        children: [
                          FittedBox(
                            child: Container(
                              width: 36.w,
                              height: 36.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: primaryColor, width: 1.5)),
                              child: Image.network(Api.imageBaseUrl +
                                  controller.chatNeighbours.image.toString()),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            controller.chatNeighbours.firstname.toString() +
                                ' ' +
                                controller.chatNeighbours.lastname.toString(),
                            style: GoogleFonts.ubuntu(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: HexColor('#4D4D4D')),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (controller.chatType == "NeighbourChat") {
                          Get.offNamed(chatavailbilityscreen, arguments: [
                            controller.user,
                            controller.resident
                          ]);
                        } else if (controller.chatType == "MarketPlaceChat") {
                          Get.offNamed(marketPlaceScreen, arguments: [
                            controller.user,
                            controller.resident
                          ]);
                        }
                      },
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(right: 10.w, left: 38.w),
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
                                              "Chat away! Your conversation starts here.. 😊 .");
                                    }
                                    return ListView.builder(
                                      reverse: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              right: 13.w, bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment: data[index]
                                                        ['residentid'] ==
                                                    controller.user.userId
                                                ? MainAxisAlignment.end
                                                : MainAxisAlignment.start,
                                            children: [
                                              if (data[index]['residentid'] ==
                                                  controller.user.userId) ...[
                                                Flexible(
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              255,
                                                              153,
                                                              0,
                                                              0.19),
                                                          borderRadius: BorderRadius.only(
                                                              topLeft:
                                                                  Radius.circular(
                                                                      16.r),
                                                              topRight: Radius
                                                                  .circular(0),
                                                              bottomLeft:
                                                                  Radius.circular(
                                                                      16.r),
                                                              bottomRight:
                                                                  Radius.circular(16.r)),
                                                          border: Border.all(width: 1, color: primaryColor)),
                                                      child: Text(
                                                        data![index]['message']
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: HexColor(
                                                                    '#5A5A5A'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    14.sp),
                                                      )),
                                                ),
                                              ] else ...[
                                                Flexible(
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.all(16),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            HexColor('#E8E8E8'),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.r),
                                                                topRight: Radius
                                                                    .circular(
                                                                        16.r),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        16.r),
                                                                bottomRight:
                                                                    Radius.circular(
                                                                        16.r)),
                                                      ),
                                                      child: Text(
                                                        data![index]['message']
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: HexColor(
                                                                    '#5A5A5A'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    14.sp),
                                                      )),
                                                ),
                                              ]
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("Something Went Wrong ");
                                  } else {
                                    return Loader();
                                  }
                                }))),
                    10.h.ph,
                    Row(
                      children: [
                        7.w.pw,
                        SvgPicture.asset(
                          'assets/chat_plus.svg',
                          width: 24.w,
                          height: 24.w,
                        ),
                        7.w.pw,
                        SizedBox(
                          width: 292.w,
                          height: 52.w,
                          child: TextFormField(
                            maxLines: null,
                            controller: controller.msg,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 16.13.w,
                                ),
                                hintText: "Type your message",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor('#D0D0D0')),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('#B8B8B8')),
                                    borderRadius: BorderRadius.circular(8.r)),
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('#B8B8B8')),
                                    borderRadius: BorderRadius.circular(8.r))),
                          ),
                        ),
                        7.w.pw,
                        GestureDetector(
                          onTap: () {
                            if (controller.msg.text.isNotEmpty) {
                              try {
                                // Get a reference to the Firestore collection
                                CollectionReference chats = FirebaseFirestore
                                    .instance
                                    .collection('chats');

                                // Add a new document with a generated ID
                                chats.add({
                                  'residentid': controller.resident.residentid!,
                                  'message': controller.msg.text,
                                  'chatroomid': controller.chatRoomId,
                                  'createdat': FieldValue.serverTimestamp(),
                                });

                                controller.msg.clear();
                                print('Data added successfully');
                              } catch (error) {
                                print('Error adding data: $error');
                              }
                            }
                          },
                          child: SvgPicture.asset("assets/chat_send.svg",
                              width: 24.w, height: 24.w),
                        ),
                        5.22.w.pw
                      ],
                    ),
                    17.h.ph,
                    Container(
                      child: Center(
                        child: Container(
                            width: 134.w,
                            height: 5.w,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(100.r))),
                      ),
                    ),
                    8.h.ph,
                  ],
                ),
              ),
            ),
          );
        });
  }
}
