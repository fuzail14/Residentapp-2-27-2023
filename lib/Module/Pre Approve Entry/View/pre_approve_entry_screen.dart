import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/Pre%20Approve%20Entry/Model/PreApproveEntry.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Floating%20Action%20Button/my_floating_action_button.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/pre_approve_entry_controller.dart';

class GatekeeperReports extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreApproveEntryController>(
        init: PreApproveEntryController(),
        builder: (controller) {
          print('build');
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);

              return true;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  floatingActionButton: MyFloatingActionButton(
                    onPressed: () {
                      Get.offNamed(addpreapproveentryscreen, arguments: [
                        controller.userdata,
                        controller.resident
                      ]);
                    },
                  ),
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Pre Approve Entry',
                        onTap: () {
                          Get.offNamed(homescreen,
                              arguments: controller.userdata);
                        },
                      ),
                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(44.w, 16.h, 45.w, 0),
                      //   child: SizedBox(
                      //     width: 286.w,
                      //     child: TextFormField(
                      //       controller: controller.searchController,
                      //       onChanged: (value) => controller.debounce(
                      //         () async {
                      //           controller.query = value.toString();
                      //
                      //           controller.searchData(
                      //               token: controller.userdata.bearerToken!,
                      //               userId: controller.resident.residentid,
                      //               query: controller.query);
                      //
                      //           if (controller.query == '') {
                      //             controller.refreshApi(
                      //               token: controller.userdata.bearerToken!,
                      //               userId: controller.resident.residentid,
                      //             );
                      //           }
                      //         },
                      //       ),
                      //       decoration: InputDecoration(
                      //         hintText: 'Search',
                      //         prefixIcon: Icon(Icons.search),
                      //         suffixIcon: GestureDetector(
                      //             child: Icon(Icons.clear),
                      //             onTap: () => controller.debounce(
                      //                   () async {
                      //                     controller.searchController.clear();
                      //
                      //                     controller.refreshApi(
                      //                         userId:
                      //                             controller.userdata.userId!,
                      //                         token: controller
                      //                             .userdata.bearerToken!);
                      //                   },
                      //                 )),
                      //         suffixIconColor: HexColor('#B5B3B6'),
                      //         prefixIconColor: HexColor('#B5B3B6'),
                      //         hintStyle: GoogleFonts.ubuntu(
                      //             fontStyle: FontStyle.normal,
                      //             fontWeight: FontWeight.w400,
                      //             fontSize: 14,
                      //             color: HexColor('#B5B3B6')),
                      //         fillColor: HexColor('#F6F7FB'),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(7.0),
                      //           borderSide: BorderSide(style: BorderStyle.none),
                      //         ),
                      //         enabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(
                      //               color: HexColor('#B5B3B6'),
                      //               width: 0,
                      //               style: BorderStyle.none),
                      //           borderRadius: BorderRadius.circular(7.0),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: FutureBuilder<PreApproveEntry>(
                            future: controller.apiData,
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!.data != null &&
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
                                                                Center(
                                                                    child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .name
                                                                      .toString(),
                                                                  style: GoogleFonts.ubuntu(
                                                                      color: HexColor(
                                                                          '#4D4D4D'),
                                                                      fontSize:
                                                                          18,
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
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Description',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .description
                                                                        .toString(),
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#4D4D4D'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Date',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 70,
                                                                    ),
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Vehicle No',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 11,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        snapshot
                                                                            .data!
                                                                            .data![index]
                                                                            .arrivaldate
                                                                            .toString(),
                                                                        style: GoogleFonts.ubuntu(
                                                                            color: HexColor(
                                                                                '#4D4D4D'),
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            70,
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          snapshot
                                                                              .data!
                                                                              .data![index]
                                                                              .vechileno
                                                                              .toString(),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#4D4D4D'),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w400),
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
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Expected Arrival Time',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 11,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .arrivaltime
                                                                        .toString(),
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#4D4D4D'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    CircleAvatar(
                                                                        maxRadius:
                                                                            10,
                                                                        backgroundColor: Color.fromRGBO(
                                                                            255,
                                                                            153,
                                                                            0,
                                                                            0.35),
                                                                        child: SvgPicture.asset(
                                                                            'assets/ellipse_icon.svg')),
                                                                    SizedBox(
                                                                      width: 8,
                                                                    ),
                                                                    Text(
                                                                      'Visitor Type',
                                                                      style: GoogleFonts.ubuntu(
                                                                          color: HexColor(
                                                                              '#4D4D4D'),
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 11,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              30),
                                                                  child: Text(
                                                                    snapshot
                                                                        .data!
                                                                        .data![
                                                                            index]
                                                                        .visitortype
                                                                        .toString(),
                                                                    style: GoogleFonts.ubuntu(
                                                                        color: HexColor(
                                                                            '#4D4D4D'),
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 34,
                                                                ),
                                                                Center(
                                                                  child:
                                                                      MyButton(
                                                                    fontSize:
                                                                        12,
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
                                            padding: EdgeInsets.fromLTRB(
                                                10.w, 13.h, 22.w, 0),
                                            child: SizedBox(
                                              width: 343.w,
                                              height: 100,
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0.r),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  13, 0, 0, 0),
                                                          child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .name
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .ubuntu(
                                                                color: HexColor(
                                                                    '#606470'),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                              )),
                                                        ),
                                                        Container(
                                                            width: 105,
                                                            height: 27,
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
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .calendar_month,
                                                                  size: 15,
                                                                  color: HexColor(
                                                                      '#A7A7A7'),
                                                                ),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                Text(
                                                                  formatDate(snapshot
                                                                      .data!
                                                                      .data![
                                                                          index]
                                                                      .arrivaldate
                                                                      .toString()),
                                                                  style: GoogleFonts.ubuntu(
                                                                      color: HexColor(
                                                                          '#A5AAB7'),
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                    6.h.ph,
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          13, 0, 0, 0),
                                                      child: Text.rich(
                                                          TextSpan(children: [
                                                        TextSpan(
                                                          text: 'Vehicle No :',
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            color: HexColor(
                                                                '#A5AAB7'),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: snapshot
                                                              .data!
                                                              .data![index]
                                                              .vechileno
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .ubuntu(
                                                            color: HexColor(
                                                                '#606470'),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                          ),
                                                        ),
                                                      ])),
                                                    ),
                                                    if (snapshot
                                                            .data!
                                                            .data![index]
                                                            .status ==
                                                        0) ...[
                                                      MyStatusWidget(
                                                          text: snapshot
                                                              .data!
                                                              .data![index]
                                                              .arrivaltime
                                                              .toString(),
                                                          status: snapshot
                                                              .data!
                                                              .data![index]
                                                              .statusdescription
                                                              .toString(),
                                                          color: HexColor(
                                                              '#E85C5C'))
                                                    ] else if (snapshot
                                                            .data!
                                                            .data![index]
                                                            .status ==
                                                        1) ...[
                                                      MyStatusWidget(
                                                          status: snapshot
                                                              .data!
                                                              .data![index]
                                                              .statusdescription
                                                              .toString(),
                                                          color: HexColor(
                                                              '#48CA46'),
                                                          text: snapshot
                                                              .data!
                                                              .data![index]
                                                              .arrivaltime
                                                              .toString())
                                                    ] else if (snapshot
                                                            .data!
                                                            .data![index]
                                                            .status ==
                                                        2) ...[
                                                      MyStatusWidget(
                                                          text: snapshot
                                                              .data!
                                                              .data![index]
                                                              .arrivaltime
                                                              .toString(),
                                                          status: snapshot
                                                              .data!
                                                              .data![index]
                                                              .statusdescription
                                                              .toString(),
                                                          color: HexColor(
                                                              '#5DD4B1'))
                                                    ] else ...[
                                                      MyStatusWidget(
                                                          status: snapshot
                                                              .data!
                                                              .data![index]
                                                              .statusdescription
                                                              .toString(),
                                                          color: HexColor(
                                                              '#5A8CED'),
                                                          text: snapshot
                                                              .data!
                                                              .data![index]
                                                              .arrivaltime
                                                              .toString())
                                                    ],
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: snapshot.data!.data!.length);
                                } else {
                                  return EmptyList(name: 'No PreApprove Entry');
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
          );
        });
  }

  Widget MyStatusWidget(
      {required status,
      required color,
      required text,
      Color? textColor,
      double? width,
      double? height}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(13, 7, 0, 0),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/clock.svg',
                width: 15,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                text,
                style: GoogleFonts.ubuntu(
                    color: HexColor('#A5AAB7'),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
          child: Container(
            width: width ?? 64,
            height: height ?? 18,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(4)),
            child: Center(
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 10,
                  color: textColor ?? HexColor('#FFFFFF'),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
