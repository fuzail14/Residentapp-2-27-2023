import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Widgets/Loader/loader.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/Empty List/empty_list.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/discussion_form_controller.dart';

class DiscussionForm extends GetView {
  @override
  Widget build(BuildContext context) {
    print('build');

    return GetBuilder<DiscussionFormController>(
        init: DiscussionFormController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offAllNamed(homescreen, arguments: controller.user);
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Discussion Form',
                      onTap: () {
                        Get.offAllNamed(homescreen, arguments: controller.user);
                      },
                    ),
                    32.h.ph,
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(right: 10.w, left: 38.w),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('discussionchats')
                                    .where('discussionroomid',
                                        isEqualTo: controller
                                            .discussionRoomModel.data?.first.id)
                                    .orderBy('timestamp', descending: true)
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasData) {
                                    var data = snapshot.data!.docs;

                                    if (data.length == 0) {
                                      return EmptyList(
                                          name:
                                              "Join the discussion Forum 😊 \n and share your thoughts with the community.");
                                    }
                                    return ListView.builder(
                                      reverse: true,
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        print(data[index]['residentid']);

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
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: HexColor(
                                                                '#E8E8E8'),
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.r),
                                                                topRight: Radius
                                                                    .circular(
                                                                        16.r),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        16.r),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        16.r)),
                                                          ),
                                                          child: Text(
                                                            data![index]
                                                                    ['message']
                                                                .toString(),
                                                            style: GoogleFonts.poppins(
                                                                color: HexColor(
                                                                    '#5A5A5A'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    14.sp),
                                                          )),
                                                      5.h.ph,
                                                      Text(
                                                        data![index]["user"]
                                                                ['username']
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: HexColor(
                                                                    '#5A5A5A'),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    10.sp),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ]
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    return Loader();
                                  } else {
                                    return Loader();
                                  }
                                }))),
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
                                // suffixIconConstraints:
                                //     BoxConstraints(maxHeight: 14),
                                // suffixIcon: SvgPicture.asset(
                                //   'assets/chat_smile.svg',
                                //   width: 24.w,
                                //   fit: BoxFit.contain,
                                // ),
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
                                    .collection('discussionchats');

                                var user = {
                                  'firstname': controller.user.firstName,
                                  'lastname': controller.user.lastName,
                                  'username': controller.resident.username,
                                  'address': controller.user.address,
                                  'rolename': controller.user.roleName,
                                  'roleid': controller.user.roleId,
                                };
                                // Add a new document with a generated ID
                                chats.add({
                                  'residentid': controller.resident.residentid!,
                                  'message': controller.msg.text,
                                  'discussionroomid': controller
                                      .discussionRoomModel?.data?.first.id,
                                  'timestamp': FieldValue.serverTimestamp(),
                                  'user': user
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
