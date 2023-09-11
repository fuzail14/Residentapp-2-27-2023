import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Constants/constants.dart';

class MyBackButton extends StatelessWidget {
  final String? text;
  final Widget? widget;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;

  const MyBackButton({this.text, this.widget, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 38.w, top: 30.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap ??
                () {
                  Get.back();
                },
            child: Container(
              child: SvgPicture.asset(
                "assets/arrow_back.svg",
                width: 26.w,
              ),
            ),
          ),
          20.w.pw,
          Text(
            text ?? "",
            style: GoogleFonts.ubuntu(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: HexColor('#4D4D4D')),
          ),
          Container(
            child: widget,
          )
        ],
      ),
    );
  }
}
