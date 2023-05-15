import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Module/ReportsHistory/Model/admin_reports_model.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../../../Routes/set_routes.dart';
import '../../../Widgets/Empty List/empty_list.dart';
import '../Controller/admin_reports_history_controller.dart';

class ReportsHistoryScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdmoinReportsHistotryController>(
        init: AdmoinReportsHistotryController(),
        builder: (controller) => SafeArea(
              child: WillPopScope(
                onWillPop: () async {
                  Get.offNamed(homescreen, arguments: controller.user);
                  return true;
                },
                child: Scaffold(
                    body: Column(children: [
                  MyBackButton(
                    text: 'Report History',
                    onTap: () {
                      Get.offNamed(homescreen, arguments: controller.user);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: FutureBuilder<List<AdminReportHistory>>(
                        future: controller.ViewAdminReportsHistoryApi(
                            controller.resident.subadminid!,
                            controller.user.userId!,
                            controller.user.bearerToken!),
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
                                                      content:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .title!,
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
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 3,
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .description!,
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
                                                            (snapshot.data![index]
                                                                        .status !=
                                                                    3)
                                                                ? Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.fromLTRB(
                                                                              0,
                                                                              36,
                                                                              0,
                                                                              0),
                                                                      child: MyStatusWidget(
                                                                          color: HexColor(
                                                                              '#E4FFE7'),
                                                                          status:
                                                                              'Completed',
                                                                          textcolor:
                                                                              HexColor('#3BB651')),
                                                                    ),
                                                                  )
                                                                : Padding(
                                                                    padding:
                                                                        const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            36,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child: MyStatusWidget(
                                                                          color: HexColor(
                                                                              '#FEEEEE'),
                                                                          status:
                                                                              'Rejected',
                                                                          textcolor:
                                                                              HexColor('#F53932')),
                                                                    ),
                                                                  ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                'Status Description',
                                                                style: GoogleFonts.ubuntu(
                                                                    color:
                                                                        primaryColor,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      8,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 3,
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .statusdescription!,
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
                                                              height: 15,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                'Complaint At',
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#4D4D4D'),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: 82,
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
                                                                              .data![index]
                                                                              .created_at
                                                                              .toString()
                                                                              .split('T')[0]
                                                                              .toString(),
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#535353'),
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w300),
                                                                        ),
                                                                        SvgPicture
                                                                            .asset(
                                                                          'assets/complain_history_date_icon1.svg',
                                                                          color:
                                                                              HexColor('#A7A7A7'),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  SvgPicture.asset(
                                                                      'assets/Arrow 1.svg'),
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Container(
                                                                    width: 82,
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
                                                                              .data![index]
                                                                              .created_at
                                                                              .toString()
                                                                              .split('T')[1]
                                                                              .toString()
                                                                              .split('.')[0]
                                                                              .toString(),
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#535353'),
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w300),
                                                                        ),
                                                                        SvgPicture.asset(
                                                                            'assets/clock.svg')
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Text(
                                                                'Action At',
                                                                style: GoogleFonts.ubuntu(
                                                                    color: HexColor(
                                                                        '#4D4D4D'),
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      18,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: 82,
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
                                                                              .data![index]
                                                                              .updated_at
                                                                              .toString()
                                                                              .split('T')[0]
                                                                              .toString(),
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#535353'),
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w300),
                                                                        ),
                                                                        SvgPicture
                                                                            .asset(
                                                                          'assets/complain_history_date_icon1.svg',
                                                                          color:
                                                                              HexColor('#A7A7A7'),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  SvgPicture.asset(
                                                                      'assets/Arrow 1.svg'),
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Container(
                                                                    width: 82,
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
                                                                              .data![index]
                                                                              .updated_at
                                                                              .toString()
                                                                              .split('T')[1]
                                                                              .toString()
                                                                              .split('.')[0]
                                                                              .toString(),
                                                                          style: GoogleFonts.ubuntu(
                                                                              color: HexColor('#535353'),
                                                                              fontSize: 10,
                                                                              fontWeight: FontWeight.w300),
                                                                        ),
                                                                        SvgPicture.asset(
                                                                            'assets/clock.svg')
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Center(
                                                              child: MyButton(
                                                                fontSize: 12,
                                                                name: 'Ok',
                                                                width: 67,
                                                                height: 18,
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
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 16, 0),
                                        child: SizedBox(
                                          width: 343,
                                          height: 72,
                                          child: Card(
                                            elevation: 2,
                                            color: HexColor('#FFFFFF'),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13, 10, 0, 0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      snapshot
                                                          .data![index].title
                                                          .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13, 33, 100, 0),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        snapshot.data![index]
                                                            .description
                                                            .toString(),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 12, 19, 17),
                                                  child: Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Text(
                                                        snapshot.data![index]
                                                            .updated_at
                                                            .toString()
                                                            .split('T')[0]
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.right,
                                                        style:
                                                            GoogleFonts.inter(
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 10,
                                                          color: primaryColor,
                                                        ),
                                                      )),
                                                ),
                                                (snapshot.data![index].status !=
                                                        3)
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 17, 11),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: MyStatusWidget(
                                                              color: HexColor(
                                                                  '#3BB651'),
                                                              status:
                                                                  'Completed'),
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 0, 17, 11),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: MyStatusWidget(
                                                              color: HexColor(
                                                                  '#F53932'),
                                                              status:
                                                                  'Rejected'),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                            // decoration: BoxDecoration(
                                            //   color: HexColor('#FFFFFF'),
                                            //   borderRadius: BorderRadius.circular(4)
                                            // ),
                                          ),
                                        ),
                                      ));
                                },
                                itemCount: snapshot.data!.length,
                              );
                            } else {
                              return EmptyList(name: 'No History');
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
            ));
  }

  Widget MyStatusWidget({required status, required color, Color? textcolor}) {
    return Container(
      width: 64,
      height: 18,
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
