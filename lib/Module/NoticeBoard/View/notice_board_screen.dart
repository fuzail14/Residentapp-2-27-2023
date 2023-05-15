import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/notice_board_controller.dart';
import '../Model/notice_board_model.dart';

class NoticeBoardScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeBoardController>(
      init: NoticeBoardController(),
      builder: (controller) => WillPopScope(
        onWillPop: () async {
          Get.offNamed(homescreen, arguments: controller.userdata);
          return true;
        },
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  MyBackButton(
                    text: 'NoticeBoard',
                    onTap: () {
                      Get.offNamed(homescreen, arguments: controller.userdata);
                    },
                  ),
                  Expanded(
                    child: FutureBuilder<List<NoticeBoardModel>>(
                        future: controller.viewNoticeBoardApi(
                            controller.resident.subadminid!,
                            controller.userdata.bearerToken!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data != null &&
                                snapshot.data!.length != 0) {
                              return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder:
                                                (BuildContext context) =>
                                                    AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      contentPadding:
                                                          EdgeInsets.all(0),
                                                      title: SizedBox(
                                                        width: 347,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Center(
                                                                child: Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .noticetitle!,
                                                                  style: GoogleFonts.montserrat(
                                                                      color: HexColor(
                                                                          '#4D4D4D'),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 14,
                                                              ),
                                                              SingleChildScrollView(
                                                                child: Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .noticedetail
                                                                      .toString(),
                                                                  style: GoogleFonts.ubuntu(
                                                                      color: HexColor(
                                                                          '#757575'),
                                                                      fontSize:
                                                                          12,
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
                                                                  SvgPicture.asset(
                                                                      'assets/report_history_date_icon.svg'),
                                                                  SizedBox(
                                                                    width: 8,
                                                                  ),
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
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        26,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      width: 82,
                                                                      height:
                                                                          25,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              4),
                                                                          border:
                                                                              Border.all(color: primaryColor)),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Text(
                                                                            snapshot.data![index].startdate!,
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
                                                                    SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    SvgPicture
                                                                        .asset(
                                                                            'assets/Arrow 1.svg'),
                                                                    SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    Container(
                                                                      width: 82,
                                                                      height:
                                                                          25,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              4),
                                                                          border:
                                                                              Border.all(color: primaryColor)),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Text(
                                                                            snapshot.data![index].enddate.toString(),
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
                                                              ),
                                                              SizedBox(
                                                                height: 24,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      'assets/report_history_date_icon.svg'),
                                                                  SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  Text(
                                                                    'Time',
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
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        26,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .starttime!,
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#535353'),
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 3,
                                                                    ),
                                                                    Container(
                                                                      width: 20,
                                                                      height: 1,
                                                                      color:
                                                                          primaryColor,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 3,
                                                                    ),
                                                                    Text(
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .endtime!,
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#535353'),
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 37,
                                                              ),
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
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 20, 16, 0),
                                        child: SizedBox(
                                          width: 343,
                                          height: 72,
                                          child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                      height: 24,
                                                      width: 97,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: HexColor(
                                                                '#E8E8E8')),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          4,
                                                        ),
                                                        color: primaryColor,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              size: 12,
                                                              color: HexColor(
                                                                  '#FFFFFF'),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                  .data![index]
                                                                  .startdate!,
                                                              style: GoogleFonts.ubuntu(
                                                                  color: HexColor(
                                                                      '#FFFFFF'),
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, top: 8),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data![index]
                                                            .noticetitle!,
                                                        style:
                                                            GoogleFonts.ubuntu(
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
                                                        snapshot.data![index]
                                                            .noticedetail!,
                                                        style:
                                                            GoogleFonts.ubuntu(
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: snapshot.data!.length);
                            } else {
                              return EmptyList(
                                name: 'No Notices',
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Icon(Icons.error_outline);
                          } else {
                            return Loader();
                          }
                        }),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
