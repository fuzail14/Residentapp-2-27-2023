import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../Controller/event_screen_controller.dart';
import '../Model/Event.dart';

class EventsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventScreenController>(
        init: EventScreenController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Society Events',
                      onTap: () {
                        Get.offNamed(homescreen,
                            arguments: controller.userdata);
                      },
                    ),
                    Expanded(
                      child: FutureBuilder<Event>(
                          future: controller.viewEventsApi(
                              userid: controller.resident.subadminid!,
                              token: controller.userdata.bearerToken!),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data != null &&
                                  snapshot.data!.data!.length != 0) {
                                return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder:
                                                  (BuildContext context) =>
                                                      AlertDialog(
                                                        content:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                snapshot
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .title!,
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#4D4D4D'),
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              12.h.ph,
                                                              Text(
                                                                snapshot
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .description!,
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#4D4D4D'),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              14.h.ph,
                                                              Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      'assets/report_history_date_icon.svg'),
                                                                  8.w.ph,
                                                                  Text(
                                                                    'Date',
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#535353'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  )
                                                                ],
                                                              ),
                                                              8.h.ph,
                                                              Row(
                                                                children: [
                                                                  Container(
                                                                    width: 93,
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                4),
                                                                        border: Border.all(
                                                                            color:
                                                                                primaryColor)),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Text(
                                                                          snapshot
                                                                              .data!
                                                                              .data![index]
                                                                              .startdate!,
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#535353'),
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w300),
                                                                        ),
                                                                        SvgPicture.asset(
                                                                            'assets/complain_history_date_icon1.svg')
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  12.w.pw,
                                                                  SvgPicture.asset(
                                                                      'assets/Arrow 1.svg'),
                                                                  15.w.pw,
                                                                  Container(
                                                                    width: 93,
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                4),
                                                                        border: Border.all(
                                                                            color:
                                                                                primaryColor)),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        Text(
                                                                          snapshot
                                                                              .data!
                                                                              .data![index]
                                                                              .enddate
                                                                              .toString(),
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#535353'),
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w300),
                                                                        ),
                                                                        SvgPicture.asset(
                                                                            'assets/complain_history_date_icon1.svg')
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              20.h.ph,
                                                              Center(
                                                                child: MyButton(
                                                                  fontSize: 12,
                                                                  name: 'Ok',
                                                                  width: 67,
                                                                  height: 22,
                                                                  onPressed:
                                                                      () {
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
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              14, 13, 18, 0),
                                          child: SizedBox(
                                            height: 84,
                                            width: 343,
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Container(
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: (snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .id! %
                                                                    2 ==
                                                                0)
                                                            ? SvgPicture.asset(
                                                                'assets/event_vector_1.svg')
                                                            : SvgPicture.asset(
                                                                'assets/event_vector_2.svg')),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 13, top: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .title!,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#606470'),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          SizedBox(
                                                            height: 6,
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .startdate!,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#A5AAB7'),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15, top: 52),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                              height: 18,
                                                              width: 93,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: HexColor(
                                                                        '#E8E8E8')),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  4,
                                                                ),
                                                                color: HexColor(
                                                                    '#F6F6F6'),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            4),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                      size: 15,
                                                                      color: HexColor(
                                                                          '#A7A7A7'),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(
                                                                      snapshot
                                                                          .data!
                                                                          .data![
                                                                              index]
                                                                          .startdate!,
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#A5AAB7'),
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    )
                                                                  ],
                                                                ),
                                                              )),
                                                          SizedBox(
                                                            width: 12,
                                                          ),
                                                          // Container(
                                                          //     height: 18,
                                                          //     width: 63,
                                                          //     decoration:
                                                          //     BoxDecoration(
                                                          //       border: Border.all(
                                                          //           color: HexColor(
                                                          //               '#E8E8E8')),
                                                          //       borderRadius:
                                                          //       BorderRadius
                                                          //           .circular(
                                                          //         4,
                                                          //       ),
                                                          //       color: primaryColor,
                                                          //     ),
                                                          //     child: Center(
                                                          //       child: Text(
                                                          //         'View Image',
                                                          //         style: GoogleFonts.ubuntu(
                                                          //             color: HexColor(
                                                          //                 '#FFFFFF'),
                                                          //             fontSize: 10,
                                                          //             fontWeight:
                                                          //             FontWeight
                                                          //                 .w300),
                                                          //       ),
                                                          //     )),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                     
                                      );
                                    },
                                    itemCount: snapshot.data!.data!.length);
                              } else {
                                return EmptyList(name: 'No Events');
                              }
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
          );
        });
  }
}
