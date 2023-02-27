import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import '../../../Constants/constants.dart';
import '../Controller/notice_board_controller.dart';
import '../Model/notice_board_model.dart';

class NoticeBoardScreen extends GetView {
  NoticeBoardController noticeBoardController =
  Get.put(NoticeBoardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NoticeBoardController>(
      init: NoticeBoardController(),
      builder: (controller) => SafeArea(

        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                MyBackButton(text: 'NoticeBoard',),
                Expanded(
                  child: FutureBuilder<List<NoticeBoardModel>>(
                      future: controller.viewNoticeBoardApi(
                          controller.resident.subadminid!,
                          controller.userdata.bearerToken!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {

                          if (snapshot.data!= null && snapshot.data!.length != 0) {
                            return ListView.builder(
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder:
                                              (BuildContext context) =>
                                              AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(15.0),
                                                ),
                                                contentPadding: EdgeInsets.all(
                                                    0),
                                                title: SizedBox(
                                                  width: 347,
                                                  height: 321,
                                                  child: Stack(

                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            22, 0, 75, 0),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .noticetitle!,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                              color: HexColor(
                                                                  '#4D4D4D'),
                                                              fontSize: 16,
                                                              fontWeight: FontWeight
                                                                  .w700),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            22, 36, 75, 0),
                                                        child: Text(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,

                                                          snapshot
                                                              .data!
                                                          [index]
                                                              .noticedetail!,
                                                          style: GoogleFonts
                                                              .ubuntu(

                                                              color: HexColor(
                                                                  '#757575'),
                                                              fontSize: 12,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400),

                                                        ),
                                                      ),


                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            19, 82, 0, 0),
                                                        child: Row(children: [
                                                          SvgPicture.asset(
                                                              'assets/report_history_date_icon.svg'),
                                                          SizedBox(width: 8,),
                                                          Text('Date',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                color: HexColor(
                                                                    '#535353'),
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w400),)
                                                        ],),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            43, 110, 0, 0),
                                                        child: Row(children: [
                                                          Container(
                                                            width: 82,
                                                            height: 25,
                                                            decoration: BoxDecoration(

                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    4),
                                                                border: Border
                                                                    .all(
                                                                    color: primaryColor)
                                                            ),
                                                            child:
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .spaceEvenly,
                                                              children: [
                                                                Text(snapshot
                                                                    .data!
                                                                [index]
                                                                    .startdate!,
                                                                  style: GoogleFonts
                                                                      .ubuntu(
                                                                      color: HexColor(
                                                                          '#535353'),
                                                                      fontSize: 10,
                                                                      fontWeight: FontWeight
                                                                          .w300),),
                                                                SvgPicture
                                                                    .asset(
                                                                    'assets/complain_history_date_icon1.svg')


                                                              ],),
                                                          ),
                                                          SizedBox(width: 15,),
                                                          SvgPicture.asset(
                                                              'assets/Arrow 1.svg'),
                                                          SizedBox(width: 15,),
                                                          Container(
                                                            width: 82,
                                                            height: 25,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .circular(
                                                                    4),
                                                                border: Border
                                                                    .all(
                                                                    color: primaryColor)
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment
                                                                  .spaceEvenly,
                                                              children: [
                                                                Text(snapshot
                                                                    .data!
                                                                [index]
                                                                    .enddate
                                                                    .toString(),
                                                                  style: GoogleFonts
                                                                      .ubuntu(
                                                                      color: HexColor(
                                                                          '#535353'),
                                                                      fontSize: 10,
                                                                      fontWeight: FontWeight
                                                                          .w300),),
                                                                SvgPicture
                                                                    .asset(
                                                                    'assets/complain_history_date_icon1.svg')


                                                              ],),),

                                                        ],),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            19, 180, 0, 0),
                                                        child: Row(children: [
                                                          SvgPicture.asset(
                                                              'assets/report_history_date_icon.svg'),
                                                          SizedBox(width: 8,),
                                                          Text('Time',
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                color: HexColor(
                                                                    '#535353'),
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w400),)
                                                        ],),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            49, 200, 0, 0),
                                                        child: Row(children: [
                                                          Text(snapshot
                                                              .data![index]
                                                              .starttime!,
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                color: HexColor(
                                                                    '#535353'),
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w400),),
                                                          SizedBox(width: 3,),
                                                          Container(width: 20,
                                                            height: 1,
                                                            color: primaryColor,),
                                                          SizedBox(width: 3,),
                                                          Text(snapshot
                                                              .data![index]
                                                              .endtime!,
                                                            style: GoogleFonts
                                                                .ubuntu(
                                                                color: HexColor(
                                                                    '#535353'),
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w400),),

                                                        ],),
                                                      ),
                                                      Center(
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              0, 300, 0, 0),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                              height: 31,
                                                              width: 96,
                                                              decoration:
                                                              BoxDecoration(
                                                                color:
                                                                primaryColor,
                                                                borderRadius: BorderRadius
                                                                    .circular(7)
                                                                ,

                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'OK',

                                                                  style:
                                                                  GoogleFonts
                                                                      .ubuntu(
                                                                    color: HexColor(
                                                                        '#FFFFFF'),
                                                                    fontSize: 12,
                                                                    fontWeight: FontWeight
                                                                        .w400,

                                                                  )

                                                                  ,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                              ));
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) =>
                                      //         AlertDialog(
                                      //           title: Column(
                                      //             crossAxisAlignment:
                                      //             CrossAxisAlignment.start,
                                      //             children: [
                                      //               Center(
                                      //                   child: Text(
                                      //                     snapshot.data![index]
                                      //                         .noticetitle!,
                                      //                     style: GoogleFonts.ubuntu(
                                      //                         color:
                                      //                         HexColor('#4D4D4D'),
                                      //                         fontSize: 18,
                                      //                         fontWeight:
                                      //                         FontWeight.w700),
                                      //                   )),
                                      //               SizedBox(
                                      //                 height: 37,
                                      //               ),
                                      //               Row(
                                      //                 children: [
                                      //                   CircleAvatar(
                                      //                       maxRadius: 10,
                                      //                       backgroundColor:
                                      //                       Color.fromRGBO(255,
                                      //                           153, 0, 0.35),
                                      //                       child: SvgPicture.asset(
                                      //                           'assets/chaticon.svg')),
                                      //                   SizedBox(
                                      //                     width: 8,
                                      //                   ),
                                      //                   Text(
                                      //                     'Description',
                                      //                     style: GoogleFonts.ubuntu(
                                      //                         color: HexColor(
                                      //                             '#4D4D4D'),
                                      //                         fontSize: 14,
                                      //                         fontWeight:
                                      //                         FontWeight.w500),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               Padding(
                                      //                 padding:
                                      //                 EdgeInsets.only(left: 30),
                                      //                 child: Text(
                                      //                   snapshot.data![index]
                                      //                       .noticedetail!,
                                      //                   style: GoogleFonts.ubuntu(
                                      //                       color:
                                      //                       HexColor('#4D4D4D'),
                                      //                       fontSize: 12,
                                      //                       fontWeight:
                                      //                       FontWeight.w400),
                                      //                 ),
                                      //               ),
                                      //               SizedBox(
                                      //                 height: 30,
                                      //               ),
                                      //               Row(
                                      //                 children: [
                                      //                   CircleAvatar(
                                      //                       maxRadius: 10,
                                      //                       backgroundColor:
                                      //                       Color.fromRGBO(255,
                                      //                           153, 0, 0.35),
                                      //                       child: SvgPicture.asset(
                                      //                           'assets/chaticon.svg')),
                                      //                   SizedBox(
                                      //                     width: 8,
                                      //                   ),
                                      //                   Text(
                                      //                     'Date',
                                      //                     style: GoogleFonts.ubuntu(
                                      //                         color: HexColor(
                                      //                             '#4D4D4D'),
                                      //                         fontSize: 14,
                                      //                         fontWeight:
                                      //                         FontWeight.w500),
                                      //                   ),
                                      //
                                      //                 ],
                                      //               ),
                                      //               SizedBox(
                                      //                 height: 11,
                                      //               ),
                                      //               Padding(
                                      //                 padding:
                                      //                 EdgeInsets.only(left: 30),
                                      //                 child: Text(
                                      //                   snapshot.data![index]
                                      //                       .startdate!+"  ----  "+snapshot.data![index]
                                      //                       .enddate!,
                                      //                   style:
                                      //                   GoogleFonts.ubuntu(
                                      //                       color: HexColor(
                                      //                           '#4D4D4D'),
                                      //                       fontSize: 12,
                                      //                       fontWeight:
                                      //                       FontWeight
                                      //                           .w400),
                                      //                 ),
                                      //               ),
                                      //               SizedBox(
                                      //                 height: 30,
                                      //               ),
                                      //               Row(
                                      //                 children: [
                                      //                   CircleAvatar(
                                      //                       maxRadius: 10,
                                      //                       backgroundColor:
                                      //                       Color.fromRGBO(255,
                                      //                           153, 0, 0.35),
                                      //                       child: SvgPicture.asset(
                                      //                           'assets/chaticon.svg')),
                                      //                   SizedBox(
                                      //                     width: 8,
                                      //                   ),
                                      //                   Text(
                                      //                     'Time',
                                      //                     style: GoogleFonts.ubuntu(
                                      //                         color: HexColor(
                                      //                             '#4D4D4D'),
                                      //                         fontSize: 14,
                                      //                         fontWeight:
                                      //                         FontWeight.w500),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               SizedBox(
                                      //                 height: 11,
                                      //               ),
                                      //               Padding(
                                      //                 padding:
                                      //                 EdgeInsets.only(left: 30),
                                      //                 child: Text(
                                      //                   snapshot.data![index]
                                      //                       .starttime! + "  ----  "+
                                      //                       snapshot.data![index]
                                      //                           .endtime!,
                                      //                   style: GoogleFonts.ubuntu(
                                      //                       color:
                                      //                       HexColor('#4D4D4D'),
                                      //                       fontSize: 12,
                                      //                       fontWeight:
                                      //                       FontWeight.w400),
                                      //                 ),
                                      //               ),
                                      //               SizedBox(
                                      //                 height: 37,
                                      //               ),
                                      //
                                      //               GestureDetector(
                                      //
                                      //
                                      //                 onTap: () {
                                      //                   Get.back();
                                      //                 },
                                      //                 child: Center(
                                      //                   child: Container(
                                      //                     height: 31,
                                      //                     width: 96,
                                      //                     decoration: BoxDecoration(
                                      //                         color: primaryColor,
                                      //                         borderRadius:
                                      //                         const BorderRadius
                                      //                             .all(
                                      //                           Radius.circular(
                                      //                               7.0),
                                      //                         ),
                                      //                         boxShadow: [
                                      //                           BoxShadow(
                                      //                             color: Colors.grey
                                      //                                 .withOpacity(
                                      //                                 0.8),
                                      //                             spreadRadius: 4,
                                      //                             blurRadius: 10,
                                      //                             offset:
                                      //                             Offset(0, 3),
                                      //                           )
                                      //                         ]),
                                      //                     child: Center(
                                      //                       child: Text(
                                      //                         'OK',
                                      //                         textAlign:
                                      //                         TextAlign.left,
                                      //                         style: TextStyle(
                                      //                           fontFamily:
                                      //                           "Netflix",
                                      //                           fontWeight:
                                      //                           FontWeight.w600,
                                      //                           fontSize: 18,
                                      //                           letterSpacing: 0.0,
                                      //                           color: Colors.white,
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 32, 16, 0),
                                      child: SizedBox(
                                        width: 343,
                                        height: 72,
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                4.0),
                                          ),
                                          child: Stack(

                                            children: [
                                              Align(
                                                  alignment: Alignment
                                                      .bottomCenter,
                                                  child: Image.asset(
                                                    'assets/noticeboard_cardbg.png',
                                                    width: 343,

                                                  )),


                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                    height: 24,
                                                    width: 97,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                          HexColor('#E8E8E8')),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                        4,
                                                      ),
                                                      color: primaryColor,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      EdgeInsets.only(left: 8),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .calendar_month,
                                                            size: 12,
                                                            color:
                                                            HexColor('#FFFFFF'),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            snapshot
                                                                .data![index]
                                                                .startdate!,
                                                            style:
                                                            GoogleFonts.ubuntu(
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
                                                    left: 15,
                                                    top: 8
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot.data![index]
                                                          .noticetitle!,
                                                      style: GoogleFonts.ubuntu(
                                                          color:
                                                          HexColor('#606470'),
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      snapshot.data![index]
                                                          .noticedetail!,
                                                      style: GoogleFonts.ubuntu(
                                                          color:
                                                          HexColor('#A5AAB7'),
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ),


                                              // Container(
                                              //   width: Get.width,
                                              //   height: Get.height,

                                              //   decoration: BoxDecoration(
                                              //     borderRadius:
                                              //           BorderRadius.circular(17),
                                              //       boxShadow: [
                                              //         BoxShadow(
                                              //           color: Color.fromARGB(
                                              //               189, 224, 224, 223),
                                              //           spreadRadius: 5,

                                              //           blurRadius: 9,
                                              //           offset: Offset(0,
                                              //               3), // changes position of shadow
                                              //         ),
                                              //       ],
                                              //       color: HexColor('#FFFFFF'),
                                              //     image: DecorationImage(image: AssetImage('assets/cardbackground.jpeg'),
                                              //      fit: BoxFit.cover,)
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.length);
                          }

                          else {
                            return EmptyList(name: 'No Notices',);
                          }

                        } else if (snapshot.hasError) {
                          return Icon(Icons.error_outline);
                        } else {
                          return Center(child: CircularProgressIndicator(color: primaryColor,));
                        }
                      }),
                ),
              ],
            )),
      ),
    );
  }
}