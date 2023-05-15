import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../Pre Approve Entry/Model/PreApproveEntry.dart';
import '../Controller/guest_history_controller.dart';

class GuestsHistoryScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestHistoryController>(
        init: GuestHistoryController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);

              return true;
            },
            child: SafeArea(
              child: Scaffold(
                  body: Column(children: [
                MyBackButton(
                  text: 'Guest History',
                  onTap: () {
                    Get.offNamed(homescreen, arguments: controller.userdata);
                  },
                ),
                Expanded(
                  child: FutureBuilder<PreApproveEntry>(
                      future: controller.preapproveEntryHistoriesApi(
                          token: controller.userdata.bearerToken!,
                          userid: controller.userdata.userId!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.data != null &&
                              snapshot.data!.data!.length != 0) {
                            return ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        16.w, 16.h, 16.w, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Center(
                                                            child: Text(
                                                          snapshot.data!
                                                              .data![index].name
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )),
                                                        SizedBox(
                                                          height: 37,
                                                        ),
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                                maxRadius: 10,
                                                                backgroundColor:
                                                                    Color.fromRGBO(
                                                                        255,
                                                                        153,
                                                                        0,
                                                                        0.35),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/ellipse_icon.svg')),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Description',
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .description
                                                                .toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                                maxRadius: 10,
                                                                backgroundColor:
                                                                    Color.fromRGBO(
                                                                        255,
                                                                        153,
                                                                        0,
                                                                        0.35),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/ellipse_icon.svg')),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Date',
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            SizedBox(
                                                              width: 70,
                                                            ),
                                                            CircleAvatar(
                                                                maxRadius: 10,
                                                                backgroundColor:
                                                                    Color.fromRGBO(
                                                                        255,
                                                                        153,
                                                                        0,
                                                                        0.35),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/ellipse_icon.svg')),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Vehicle No',
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 11,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                snapshot
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .arrivaldate
                                                                    .toString(),
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#4D4D4D'),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              SizedBox(
                                                                width: 70,
                                                              ),
                                                              Flexible(
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .vechileno
                                                                      .toString(),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.ubuntu(
                                                                      color: HexColor(
                                                                          '#4D4D4D'),
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                                maxRadius: 10,
                                                                backgroundColor:
                                                                    Color.fromRGBO(
                                                                        255,
                                                                        153,
                                                                        0,
                                                                        0.35),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/ellipse_icon.svg')),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Expected Arrival Time',
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 11,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .arrivaltime
                                                                .toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                                maxRadius: 10,
                                                                backgroundColor:
                                                                    Color.fromRGBO(
                                                                        255,
                                                                        153,
                                                                        0,
                                                                        0.35),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/ellipse_icon.svg')),
                                                            SizedBox(
                                                              width: 8,
                                                            ),
                                                            Text(
                                                              'Visitor Type',
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#4D4D4D'),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                        11.h.ph,
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 30),
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .visitortype
                                                                .toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        34.h.ph,
                                                        Center(
                                                          child: MyButton(
                                                            fontSize: 12,
                                                            name: 'Ok',
                                                            width: 67,
                                                            height: 22,
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                          ),
                                                        ),
                                                        20.h.ph
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                      },
                                      child: SizedBox(
                                          width: 343,
                                          height: 67,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            elevation: 2,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Container(
                                                    child: Image.asset(
                                                      'assets/noticeboard_icon.png',
                                                    ),
                                                    width: 62,
                                                    height: 67,
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            colors: (snapshot
                                                                            .data!
                                                                            .data![
                                                                                index]
                                                                            .id! %
                                                                        2 ==
                                                                    0)
                                                                ? controller
                                                                    .bluecard
                                                                : controller
                                                                    .greencard)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    width: 89,
                                                    height: 23,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: primaryColor),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .updatedAt
                                                              .toString()
                                                              .split('T')[0]
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#FFFFFF'),
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        SvgPicture.asset(
                                                          'assets/complain_history_date_icon1.svg',
                                                          color: HexColor(
                                                              '#FFFFFF'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          94, 0, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data!
                                                            .data![index].name
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#606470'),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                      Text.rich(TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Cnic : ',
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#1A1A1A'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot
                                                                .data!
                                                                .data![index]
                                                                .cnic
                                                                .toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#1A1A1A'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      )),
                                                      Text.rich(TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Vechile no : ',
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#1A1A1A'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                          TextSpan(
                                                            text: snapshot
                                                                .data!
                                                                .data![index]
                                                                .cnic
                                                                .toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#1A1A1A'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.data!.length);
                          } else {
                            return EmptyList(
                              name: "No Guest History",
                            );
                          }
                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Center(
                              child: CircularProgressIndicator(
                            color: primaryColor,
                          ));
                        }
                      }),
                ),
              ])),
            ),
          );
        });
  }
}
