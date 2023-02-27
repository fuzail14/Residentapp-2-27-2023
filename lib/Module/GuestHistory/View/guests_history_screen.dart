import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/GuestHistory/Controller/guest_history_controller.dart';
import 'package:userapp/Module/GuestHistory/Model/PreApproveEntry.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';

class GuestsHistoryScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestHistoryController>(
        init: GuestHistoryController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
                body: Column(children: [
              MyBackButton(
                text: 'Guest History',
              ),
              Expanded(
                child: FutureBuilder<PreApproveEntry>(
                    future: controller.preapproveEntryHistoriesApi(
                        token: controller.userdata.bearerToken!,
                        userid: controller.userdata.userid!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.data != null &&
                            snapshot.data!.data!.length != 0) {
                          return ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: SizedBox(
                                                  width: 347,
                                                  height: 375,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topCenter,
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .name!,
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                0, 38, 0, 0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Text(
                                                            snapshot
                                                                .data!
                                                                .data![index]
                                                                .description!,
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#4D4D4D'),
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                14, 98, 0, 0),
                                                        child: SvgPicture.asset(
                                                            'assets/ellipse_icon.svg'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                38, 98, 0, 0),
                                                        child: Text(
                                                          'Visitor Type',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                38, 117, 0, 0),
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .visitortype
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                198, 98, 0, 0),
                                                        child: SvgPicture.asset(
                                                            'assets/ellipse_icon.svg'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                218, 98, 0, 0),
                                                        child: Text(
                                                          'Vehilce No',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                218, 117, 0, 0),
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .vechileno
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                14, 165, 0, 0),
                                                        child: SvgPicture.asset(
                                                            'assets/ellipse_icon.svg'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                39, 165, 0, 0),
                                                        child: Text(
                                                          'Contact No',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                39, 185, 0, 0),
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .mobileno
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                199, 169, 0, 0),
                                                        child: SvgPicture.asset(
                                                            'assets/ellipse_icon.svg'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                223, 169, 0, 0),
                                                        child: Text(
                                                          'Expected Time',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                223, 188, 0, 0),
                                                        child: Text(
                                                          snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .arrivaltime
                                                                  .toString()
                                                                  .split(':')[0]
                                                                  .toString() +
                                                              " : " +
                                                              snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .arrivaltime
                                                                  .toString()
                                                                  .split(':')[1]
                                                                  .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                14, 232, 0, 0),
                                                        child: SvgPicture.asset(
                                                            'assets/ellipse_icon.svg'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                39, 232, 0, 0),
                                                        child: Text(
                                                          'Cnic',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                39, 252, 0, 0),
                                                        child: Text(
                                                          snapshot.data!
                                                              .data![index].cnic
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                199, 233, 0, 0),
                                                        child: SvgPicture.asset(
                                                            'assets/ellipse_icon.svg'),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                223, 233, 0, 0),
                                                        child: Text(
                                                          'Date',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                223, 252, 0, 0),
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .updatedAt
                                                              .toString()
                                                              .split('T')[0]
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                100,
                                                                316,
                                                                105,
                                                                0),
                                                        child: MyButton(
                                                          name: 'Ok',
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                        ),
                                                      )
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
                                                alignment: Alignment.centerLeft,
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
                                                          BorderRadius.circular(
                                                              4),
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
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: HexColor(
                                                                    '#FFFFFF'),
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                      ),
                                                      SvgPicture.asset(
                                                        'assets/complain_history_date_icon1.svg',
                                                        color:
                                                            HexColor('#FFFFFF'),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data!
                                                          .data![index].name
                                                          .toString(),
                                                      style: GoogleFonts.ubuntu(
                                                          color: HexColor(
                                                              '#606470'),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                                                          text: snapshot.data!
                                                              .data![index].cnic
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ],
                                                    )),
                                                    Text.rich(TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'Vechile no : ',
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                        TextSpan(
                                                          text: snapshot.data!
                                                              .data![index].cnic
                                                              .toString(),
                                                          style: GoogleFonts.ubuntu(
                                                              color: HexColor(
                                                                  '#1A1A1A'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
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
                          return  EmptyList(name: "No Guest History",);
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
          );
        });
  }
}
