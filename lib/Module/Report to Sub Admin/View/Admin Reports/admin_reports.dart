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
                                                      .data.data[index].title.toString(),
                                                  style: GoogleFonts.ubuntu(

                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height:10,
                                                ),
                                                Text(
                                                  snapshot.data.data[index]
                                                      .description.toString(),
                                                  style: GoogleFonts.ubuntu(
                                                      color:
                                                          HexColor('#4D4D4D'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),

                                                Text(
                                                  'Complaint At',
                                                  style: GoogleFonts.ubuntu(

                                                      color:
                                                      HexColor('#4D4D4D'),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ), SizedBox(
                                                  height:15,
                                                ),
                                                Row(
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
                                                            snapshot.data.data[index]
                                                                .createdAt.toString().split('T')[0].toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor('#535353'),
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.w300),
                                                          ),
                                                          SvgPicture.asset(
                                                              'assets/complain_history_date_icon1.svg',color: HexColor('#A7A7A7'),)
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
                                                            snapshot.data.data[index]
                                                                .createdAt.toString().split('T')[1].toString().split('.')[0].toString(),
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
                                                SizedBox(
                                                  height: 15,
                                                ),

                                                Text(
                                                  'Action At',
                                                  style: GoogleFonts.ubuntu(

                                                      color:
                                                      HexColor('#4D4D4D'),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w500),
                                                ), SizedBox(
                                                  height:15,
                                                ),
                                                Row(
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
                                                            snapshot.data.data[index]
                                                                .updatedAt.toString().split('T')[0].toString(),
                                                            style: GoogleFonts.ubuntu(
                                                                color: HexColor('#535353'),
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.w300),
                                                          ),
                                                          SvgPicture.asset(
                                                            'assets/complain_history_date_icon1.svg',color: HexColor('#A7A7A7'),)
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
                                                            snapshot.data.data[index]
                                                                .updatedAt.toString().split('T')[1].toString().split('.')[0].toString(),
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
                                                SizedBox(
                                                  height: 30,
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
                                                ), SizedBox(
                                                  height: 30,
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
                                    height: 120,
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
                                              overflow:TextOverflow.ellipsis,
                                              snapshot.data.data[index].title.toString(),
                                              style: GoogleFonts.montserrat(
                                                  color: HexColor('#4D4D4D'),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 35,50, 0),
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
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
                                                        snapshot.data.data[index]
                                                            .updatedAt.toString().split('T')[0].toString(),
                                                        style: GoogleFonts.ubuntu(
                                                            color: HexColor('#535353'),
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w300),
                                                      ),
                                                      SvgPicture.asset(
                                                        'assets/complain_history_date_icon1.svg',color: HexColor('#A7A7A7'),)
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
                                                        snapshot.data.data[index]
                                                            .updatedAt.toString().split('T')[1].toString().split('.')[0].toString(),
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
                                                SizedBox(
                                                  width: 15,
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
