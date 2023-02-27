import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/Report%20to%20Sub%20Admin/Controller/Admin%20Reports%20Controller/admin_reports_controller.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';

class AdminReports extends GetView {
  final AdminReportsController _adminReportsController =
      Get.put(AdminReportsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminReportsController>(
      init: AdminReportsController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              MyBackButton(
                text: 'Complaint',
              ),
              Expanded(
                child: FutureBuilder(
                    future: controller.adminReportsApi(
                        controller.user.userid!, controller.user.bearerToken!),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {

                        if (snapshot.data.data != null && snapshot.data.data!.length != 0)
                        {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                    child: Text(
                                                  'Complaint',
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  snapshot
                                                      .data.data[index].title,
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  snapshot.data.data[index]
                                                      .description,
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 17,
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_month,
                                                      color:
                                                          HexColor('#A7A7A7'),
                                                      size: 20,
                                                    ),
                                                    SizedBox(
                                                      width: 14,
                                                    ),
                                                    Text(
                                                      snapshot.data.data[index]
                                                          .date,
                                                      style: GoogleFonts.ubuntu(
                                                          color: HexColor(
                                                              '#4D4D4D'),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 45,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      height: 31,
                                                      width: 96,
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                7.0),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.8),
                                                              spreadRadius: 4,
                                                              blurRadius: 10,
                                                              offset:
                                                                  Offset(0, 3),
                                                            )
                                                          ]),
                                                      child: Center(
                                                        child: Text(
                                                          'OK',
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Netflix",
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18,
                                                            letterSpacing: 0.0,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 13),
                                  child: SizedBox(
                                    width: 343,
                                    height: 112,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: SvgPicture.asset(
                                                'assets/cardbg.svg',
                                                fit: BoxFit.fill),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 15, 0, 0),
                                            child: Text(
                                              snapshot.data.data[index].title,
                                              style: GoogleFonts.montserrat(
                                                  color: HexColor('#4D4D4D'),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 35, 75, 0),
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              snapshot
                                                  .data.data[index].description
                                                  .toString(),
                                              style: GoogleFonts.ubuntu(
                                                  color: HexColor('#757575'),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 76, 75, 0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/complain_history_date_icon1.svg'),
                                                SizedBox(
                                                  width: 11.2,
                                                ),
                                                Text(
                                                  snapshot.data.data[index].date
                                                      .toString(),
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#A5AAB7'),
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ),

                                          (snapshot.data.data[index].status ==
                                                  0)
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 37, 22, 0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: MyStatusWidget(
                                                          status: snapshot
                                                              .data
                                                              .data[index]
                                                              .statusdescription,
                                                          color: HexColor(
                                                              '#ED0909'))),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 37, 22, 0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: MyStatusWidget(
                                                          status: snapshot
                                                              .data
                                                              .data[index]
                                                              .statusdescription,
                                                          color: HexColor(
                                                              '#4EC018'))),
                                                ),
                                          (snapshot.data.data[index].status !=
                                                  0)
                                              ? GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                                  title:
                                                                      SizedBox(
                                                                    width: 347,
                                                                    height: 193,
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional
                                                                              .topCenter,
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                            'assets/problem _solved_icon.svg'),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              63,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text('Complaint'),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              102,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            'Your Problem has been solved?',
                                                                            style: GoogleFonts.ubuntu(
                                                                                color: HexColor('#4D4D4D'),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              144,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              MyButton(
                                                                                width: 80,
                                                                                onPressed: () {
                                                                                  _adminReportsController.ProblemSolvedButtonApi(snapshot.data.data[index].id, controller.user.userid!, controller.user.bearerToken!);

                                                                                  Get.back();
                                                                                },
                                                                                name: 'Yes',
                                                                                color: HexColor('#5AE244'),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 18,
                                                                              ),
                                                                              MyButton(
                                                                                width: 80,
                                                                                onPressed: () {
                                                                                  Get.back();
                                                                                },
                                                                                name: 'No',
                                                                                color: HexColor('#FF3232'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ));
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 70, 22, 0),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: MyStatusWidget(
                                                            width: 87,
                                                            height: 22,
                                                            status:
                                                                'Problem Solved',
                                                            color: HexColor(
                                                                '#1E2772'))),
                                                  ),
                                                )
                                              : Container()

                                          // Padding(
                                          //   padding: EdgeInsets.only(
                                          //     left: 15,
                                          //   ),
                                          //   child: Column(
                                          //     crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          //     children: [
                                          //       Text(
                                          //         snapshot
                                          //             .data.data[index].title,
                                          //         style: GoogleFonts.ubuntu(
                                          //             color:
                                          //             HexColor('#A5AAB7'),
                                          //             fontSize: 12,
                                          //             fontWeight:
                                          //             FontWeight.w500),
                                          //       ),
                                          //       SizedBox(
                                          //         height: 10,
                                          //       ),
                                          //       Row(
                                          //         children: [
                                          //           Flexible(
                                          //             child: Text(
                                          //               snapshot.data.data[index]
                                          //                   .date.toString(),
                                          //               overflow: TextOverflow.ellipsis,
                                          //
                                          //               style: GoogleFonts.ubuntu(
                                          //                 color:
                                          //                 HexColor('#606470'),
                                          //                 fontSize: 16,
                                          //                 fontWeight:
                                          //                 FontWeight.w500,
                                          //                 fontStyle:
                                          //                 FontStyle.normal,
                                          //               ),
                                          //             ),
                                          //           ),
                                          //           SizedBox(
                                          //             width: Get.width*0.500,
                                          //           ),
                                          //           (snapshot.data.data[index]
                                          //               .status ==
                                          //               0)
                                          //               ? Container()
                                          //               : ElevatedButton(
                                          //             style: ElevatedButton.styleFrom(
                                          //                 primary: HexColor(
                                          //                     '#4EC018'),
                                          //                 fixedSize: Size(
                                          //                     80, 22),
                                          //                 shape: RoundedRectangleBorder(
                                          //                     borderRadius:
                                          //                     BorderRadius.circular(
                                          //                         10))),
                                          //             onPressed: () {},
                                          //             child: Text(
                                          //               'Inprogress',
                                          //               textAlign:
                                          //               TextAlign
                                          //                   .center,
                                          //               style: GoogleFonts.ubuntu(
                                          //                   color: HexColor(
                                          //                       '#FFFFFF'),
                                          //                   fontSize: 12,
                                          //                   fontWeight:
                                          //                   FontWeight
                                          //                       .w500),
                                          //             ),
                                          //           )
                                          //         ],
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          //
                                          // (snapshot.data.data[index].status ==
                                          //     0)
                                          //     ? SizedBox(
                                          //   height: 30,
                                          // )
                                          //     : SizedBox(
                                          //   height: 10,
                                          // ),
                                          // Padding(
                                          //   padding: EdgeInsets.only(left: 15),
                                          //   child: Row(
                                          //     children: [
                                          //       Icon(
                                          //         Icons.calendar_month_sharp,
                                          //         color: HexColor('#A5AAB7'),
                                          //         size: 15,
                                          //       ),
                                          //       SizedBox(
                                          //         width: 10,
                                          //       ),
                                          //       Text(
                                          //         snapshot
                                          //             .data.data[index].date,
                                          //         style: GoogleFonts.ubuntu(
                                          //             color:
                                          //             HexColor('#A5AAB7'),
                                          //             fontSize: 12,
                                          //             fontWeight:
                                          //             FontWeight.w500),
                                          //       ),
                                          //       (snapshot.data.data[index]
                                          //           .status ==
                                          //           0)
                                          //           ? Padding(
                                          //         padding:
                                          //         EdgeInsets.only(
                                          //           left: 163,
                                          //         ),
                                          //         child: ElevatedButton(
                                          //           style: ElevatedButton.styleFrom(
                                          //               primary: HexColor(
                                          //                   '#ED0909'),
                                          //               fixedSize:
                                          //               Size(80, 22),
                                          //               shape: RoundedRectangleBorder(
                                          //                   borderRadius:
                                          //                   BorderRadius
                                          //                       .circular(
                                          //                       10))),
                                          //           onPressed: () {},
                                          //           child: Text(
                                          //             snapshot
                                          //                 .data
                                          //                 .data[index]
                                          //                 .statusdescription,
                                          //             textAlign: TextAlign
                                          //                 .center,
                                          //             style: GoogleFonts.ubuntu(
                                          //                 color: HexColor(
                                          //                     '#FFFFFF'),
                                          //                 fontSize: 12,
                                          //                 fontWeight:
                                          //                 FontWeight
                                          //                     .w500),
                                          //           ),
                                          //         ),
                                          //       )
                                          //           : Padding(
                                          //         padding:
                                          //         EdgeInsets.only(
                                          //           left: 163,
                                          //         ),
                                          //         child: ElevatedButton(
                                          //           style: ElevatedButton.styleFrom(
                                          //               primary: HexColor(
                                          //                   '#1E2772'),
                                          //               fixedSize:
                                          //               Size(80, 22),
                                          //               shape: RoundedRectangleBorder(
                                          //                   borderRadius:
                                          //                   BorderRadius
                                          //                       .circular(
                                          //                       10))),
                                          //           onPressed: () {

                                          // Text(snapshot
                                          //     .data.data[index].statusdescription
                                          //     .toString()),

                                          // (snapshot.data.data[index].status == 0)
                                          //     ? Container()
                                          //     : Center(
                                          //         child: ElevatedButton(
                                          //           style: ElevatedButton.styleFrom(
                                          //               primary: Colors.green,
                                          //               fixedSize: Size(100, 30),
                                          //               shape:
                                          //                   RoundedRectangleBorder(
                                          //                       borderRadius:
                                          //                           BorderRadius
                                          //                               .circular(
                                          //                                   20))),
                                          //           onPressed: () {
                                          //             showProblemDialog(
                                          //                 context,
                                          //                 snapshot
                                          //                     .data.data[index].id,
                                          //                 snapshot.data.data[index]
                                          //                     .userid,
                                          //                 controller.userdata
                                          //                     .bearerToken!);
                                          //           },
                                          //           child: const Text(
                                          //             'Problem Solved',
                                          //             style: TextStyle(

                                          //                 color: Colors.white,
                                          //                 fontWeight:
                                          //                     FontWeight.bold),
                                          //             textAlign: TextAlign.center,
                                          //           ),
                                          //         ),
                                          //       )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: snapshot.data.data.length);}
                        else {

                          return EmptyList(name: 'No Complains',);
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
            ],
          ),
          floatingActionButton: IconButton(
              padding: EdgeInsets.only(top: 85),
              iconSize: MediaQuery.of(context).size.height * 0.065,
              icon: SvgPicture.asset('assets/floatingbutton.svg'),
              onPressed: () {
                Get.offAndToNamed(reporttoadmin, arguments: [
                  _adminReportsController.user,
                  _adminReportsController.resident
                ]);
              }),
        ),
      ),
    );
  }

  Future<void> showProblemDialog(
      BuildContext context, int reportid, int userid, String token) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Center(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/dialogicon.svg'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Complaint'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Your Problem has been solved?',
                      style: GoogleFonts.ubuntu(
                          color: HexColor('#4D4D4D'),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(
                          onPressed: () {
                            _adminReportsController.ProblemSolvedButtonApi(
                                reportid, userid, token);

                            Get.back();
                          },
                          name: 'Yes',
                          color: HexColor('#5AE244'),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        MyButton(
                          onPressed: () {
                            Get.back();
                          },
                          name: 'No',
                          color: HexColor('#FF3232'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ));
  }

  Widget MyStatusWidget(
      {required status,
      required color,
      Color? textcolor,
      double? width,
      double? height}) {
    return Container(
      width: width ?? 64,
      height: height ?? 18,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 10,
            color: textcolor ?? HexColor('#FFFFFF'),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
