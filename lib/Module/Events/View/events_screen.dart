import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Widgets/Empty%20List/empty_list.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/Dialog Box Elipse Heading/dialog_box_elipse_heading.dart';
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
                backgroundColor: HexColor('#FCFCFC'),
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Society Events',
                      onTap: () {
                        Get.offNamed(homescreen,
                            arguments: controller.userdata);
                      },
                    ),
                    32.h.ph,
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
                                      controller.snapShot =
                                          snapshot.data!.data![index];

                                      return GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                          content: EventDialog(
                                                              title: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .title,
                                                              startDate: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .startdate,
                                                              endDate: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .enddate,
                                                              description: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .description),
                                                        ));
                                          },
                                          child: EventCard(
                                            title: controller.snapShot.title,
                                            description:
                                                controller.snapShot.description,
                                            startDate:
                                                controller.snapShot.startdate,
                                            index: index,
                                          ));
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

class EventDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final String? startDate;
  final String? endDate;

  const EventDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.startDate,
      required this.endDate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? "",
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: HexColor('#606470'))),
          12.h.ph,
          Text(description ?? "",
              style: GoogleFonts.ubuntu(
                  fontSize: 11.sp, color: HexColor('#333333'))),
          14.h.ph,
          DialogBoxElipseHeading(
            text: "Start Date",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: EventDateCard(dateString: startDate),
          ),
          14.h.ph,
          DialogBoxElipseHeading(
            text: "End Date",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: EventDateCard(dateString: endDate),
          ),
          19.h.ph,
          Center(
            child: MyButton(
              border: 4.r,
              width: 67.w,
              height: 22.w,
              name: 'Ok',
              onPressed: () {
                Get.back();
              },
            ),
          ),
          14.h.ph,
        ],
      ),
    );
  }
}

class EventDateCard extends StatelessWidget {
  final String? dateString;

  const EventDateCard({super.key, required this.dateString});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93.w,
      height: 18.w,
      decoration: BoxDecoration(
          color: HexColor('#E1E1E1'), borderRadius: BorderRadius.circular(4.r)),
      child: Row(
        children: [
          6.w.pw,
          SvgPicture.asset(
            'assets/event_date_icon.svg',
            width: 12.w,
            height: 12.w,
          ),
          8.w.pw,
          Text(convertDateFormatToDayMonthYearDateFormat(dateString!),
              style: GoogleFonts.ubuntu(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                  color: HexColor('#4D4D4D')))
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? startDate;
  final int? index;

  const EventCard(
      {super.key,
      required this.title,
      required this.description,
      required this.startDate,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(14.w, 13.h, 18.w, 0),
        child: SizedBox(
            height: 96.w,
            width: 343.w,
            child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.h.ph,
                          SizedBox(
                            width: 200.w,
                            height: 20.w,
                            child: Text(
                              title ?? "",
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: HexColor('#606470')),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          6.h.ph,
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              description ?? "",
                              style: GoogleFonts.ubuntu(
                                  fontSize: 11.sp, color: HexColor('#333333')),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          10.h.ph,
                          Row(
                            children: [
                              Container(
                                width: 93.w,
                                height: 18.w,
                                decoration: BoxDecoration(
                                    color: HexColor('#F6F6F6'),
                                    borderRadius: BorderRadius.circular(4.r)),
                                child: Row(
                                  children: [
                                    6.w.pw,
                                    SvgPicture.asset(
                                      'assets/event_date_icon.svg',
                                      width: 12.w,
                                      height: 12.w,
                                    ),
                                    8.w.pw,
                                    Text(
                                        convertDateFormatToDayMonthYearDateFormat(
                                            startDate!),
                                        style: GoogleFonts.ubuntu(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 10.sp,
                                            color: HexColor('#4D4D4D')))
                                  ],
                                ),
                              ),
                              12.w.pw,
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 63.w,
                                  height: 18.w,
                                  child: Center(
                                    child: Text(
                                      'View Image',
                                      style: GoogleFonts.ubuntu(
                                          fontSize: 8.sp,
                                          color: HexColor('#FFFFFF')),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(4.r)),
                                ),
                              )
                            ],
                          ),
                          10.h.ph,
                        ],
                      ),
                    ),
                    if (index! % 2 == 0) ...[
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/event_vector_2.svg',
                          width: 84.w,
                          height: 75.w,
                        ),
                      ),
                    ],
                    if (!(index! % 2 == 0)) ...[
                      Expanded(
                        child: SvgPicture.asset(
                          'assets/event_vector_1.svg',
                          width: 84.w,
                          height: 75.w,
                        ),
                      ),
                    ]
                  ],
                ))));
  }
}
