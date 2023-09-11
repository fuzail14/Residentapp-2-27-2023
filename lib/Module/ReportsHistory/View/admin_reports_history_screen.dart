import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';

import '../../../Routes/set_routes.dart';
import '../../../Widgets/Dialog Box Elipse Heading/dialog_box_elipse_heading.dart';
import '../../Report to Sub Admin/Model/Reports.dart';
import '../../Report to Sub Admin/View/Admin Reports/admin_reports.dart';
import '../Controller/admin_reports_history_controller.dart';

class ReportsHistoryScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportHistoryController>(
        init: ReportHistoryController(),
        builder: (controller) => SafeArea(
              child: WillPopScope(
                onWillPop: () async {
                  Get.offNamed(homescreen, arguments: controller.user);
                  return true;
                },
                child: Scaffold(
                    backgroundColor: HexColor('#FCFCFC'),
                    body: Column(children: [
                      MyBackButton(
                        text: 'Report History',
                        onTap: () {
                          Get.offNamed(homescreen, arguments: controller.user);
                        },
                      ),
                      32.h.ph,
                      Expanded(
                        child: PagedListView(
                          shrinkWrap: true,
                          primary: false,
                          pagingController: controller.pagingController,
                          addAutomaticKeepAlives: false,
                          builderDelegate: PagedChildBuilderDelegate(
                            noItemsFoundIndicatorBuilder: (context) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 25,
                                  horizontal: 15,
                                ),
                                child: Center(
                                    child: Text(
                                  'No Entry Yet',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              );
                            },
                            itemBuilder: (context, item, index) {
                              final Reports reports = item as Reports;

                              return GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                                content: ComplaintHistoryDialog(
                                              title: reports.title,
                                              description: reports.description,
                                              createdAt: reports.createdAt,
                                              status: reports.status,
                                              statusDescription:
                                                  reports.statusdescription,
                                              updatedAat: reports.updatedAt,
                                            )));
                                  },
                                  child: ReportHistoryCard(
                                    controller: controller,
                                    id: reports.id,
                                    title: reports.title,
                                    description: reports.description,
                                    userId: reports.userid,
                                    subAdminId: reports.subadminid,
                                    createdAt: reports.createdAt,
                                    status: reports.status,
                                    statusDescription:
                                        reports.statusdescription,
                                    updatedAat: reports.updatedAt,
                                  ));
                            },
                          ),
                        ),
                      ),
                    ])),
              ),
            ));
  }

  Widget MyStatusWidget({required status, required color, Color? textColor}) {
    return Container(
      width: 64,
      height: 18,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4.r)),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 10.sp,
            color: textColor ?? HexColor('#FFFFFF'),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class ComplaintHistoryDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final int? status;
  final String? statusDescription;
  final String? updatedAat;
  final String? createdAt;

  const ComplaintHistoryDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.status,
      required this.statusDescription,
      required this.updatedAat,
      required this.createdAt});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 307.w,
      child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Text('Complain History',
              style: GoogleFonts.montserrat(
                  color: HexColor('#4D4D4D'),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700)),
        ),
        10.h.ph,
        Text(
          title ?? "",
          style: GoogleFonts.montserrat(
              color: HexColor('#4D4D4D'),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        6.h.ph,
        Text(
          description ?? "",
          style: GoogleFonts.ubuntu(
            color: HexColor('#4D4D4D'),
            fontSize: 12.sp,
          ),
        ),
        10.h.ph,
        DialogBoxElipseHeading(text: 'Action At'),
        10.h.ph,
        Padding(
          padding: EdgeInsets.only(left: 26.6.w),
          child: Row(
            children: [
              ComplainDialogBorderWidget(text: convertDateFormat(updatedAat!)),
              15.w.pw,
              SvgPicture.asset(
                'assets/complaint_history_arrow_icon.svg',
                width: 15.w,
                height: 15.w,
              ),
              15.w.pw,
              ComplainDialogBorderWidget(
                  text: convertTo12HourFormatFromTimeStamp(updatedAat!)),
            ],
          ),
        ),
        10.h.ph,
        DialogBoxElipseHeading(text: 'Report At'),
        10.h.ph,
        Padding(
          padding: EdgeInsets.only(left: 26.6.w),
          child: Row(
            children: [
              ComplainDialogBorderWidget(text: convertDateFormat(createdAt!)),
              15.w.pw,
              SvgPicture.asset(
                'assets/complaint_history_arrow_icon.svg',
                width: 15.w,
                height: 15.w,
              ),
              15.w.pw,
              ComplainDialogBorderWidget(
                  text: convertTo12HourFormatFromTimeStamp(createdAt!)),
            ],
          ),
        ),
        10.h.ph,
        DialogBoxElipseHeading(text: 'Status'),
        10.h.ph,
        if (status == 3) ...[
          Padding(
            padding: EdgeInsets.only(left: 26.6.w),
            child: ComplainStatusCard(
              statusDescription: 'Rejected',
              color: HexColor('#F53932'),
            ),
          ),
          10.h.ph,
          DialogBoxElipseHeading(
            text: 'Status Description',
          ),
          10.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.6.w),
            child: Text(
              statusDescription ?? "",
              style: GoogleFonts.ubuntu(
                color: HexColor('#4D4D4D'),
                fontSize: 12.sp,
              ),
            ),
          )
        ] else if (status == 4) ...[
          Padding(
            padding: EdgeInsets.only(left: 26.6.w),
            child: ComplainStatusCard(
              statusDescription: statusDescription,
              color: HexColor('#3BB651'),
            ),
          )
        ],
        10.h.ph,
        Center(
          child: MyButton(
            name: 'Ok',
            border: 7.r,
            width: 101.w,
            height: 22.w,
            onPressed: () {
              Get.back();
            },
          ),
        )
      ])),
    );
  }
}

class ComplainDialogBorderWidget extends StatelessWidget {
  final String? text;

  const ComplainDialogBorderWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 82.w,
      height: 25.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.r),
          border: Border.all(color: primaryColor)),
      child: Center(
        child: Text(
          text ?? "",
          style: GoogleFonts.ubuntu(
            color: HexColor('#535353'),
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class ReportHistoryCard extends StatelessWidget {
  final int? id;
  final int? userId;
  final int? subAdminId;
  final String? title;
  final String? description;
  final int? status;
  final String? statusDescription;
  final String? updatedAat;
  final String? createdAt;
  final ReportHistoryController controller;
  ReportHistoryCard(
      {super.key,
      required this.id,
      required this.userId,
      required this.subAdminId,
      required this.title,
      required this.description,
      required this.status,
      required this.statusDescription,
      required this.updatedAat,
      required this.createdAt,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: SizedBox(
        width: 343.w,
        height: 72.w,
        child: Card(
          color: HexColor('#FFFFFF'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          elevation: 0.7,
          child: Column(
            children: [
              10.h.ph,
              Padding(
                padding: EdgeInsets.only(left: 13.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title ?? "",
                        style: GoogleFonts.ubuntu(
                            color: HexColor('#606470'),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 19.w),
                      child: Text(
                        createdAt ?? "",
                        style: GoogleFonts.inter(
                            color: HexColor('#333333'),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              6.h.ph,
              Padding(
                padding: EdgeInsets.only(left: 13.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "• $description",
                        style: GoogleFonts.ubuntu(
                          color: HexColor('#333333'),
                          fontSize: 11.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (status == 3) ...[
                      Padding(
                        padding: EdgeInsets.only(right: 19.w),
                        child: ReportHistoryCardStatus(
                          color: HexColor('#F53932'),
                          text: 'Rejected',
                        ),
                      )
                    ] else if (status == 4) ...[
                      Padding(
                        padding: EdgeInsets.only(right: 19.w),
                        child: ReportHistoryCardStatus(
                          color: HexColor('#00A61E'),
                          text: 'Completed',
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportHistoryCardStatus extends StatelessWidget {
  final String? text;
  final Color? color;

  const ReportHistoryCardStatus(
      {super.key, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text ?? "",
          style: GoogleFonts.ubuntu(
            color: HexColor('#FFFFFF'),
            fontSize: 10.sp,
          ),
        ),
      ),
      width: 64.w,
      height: 18.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.r), color: color!),
    );
  }
}
