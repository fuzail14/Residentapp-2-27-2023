import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyBackButton extends StatelessWidget {

  final String? text;
  final Widget? widget;
  final void Function()? onTap;

  const MyBackButton({ this.text,this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 38.w, top: 40.h),
      child: Row(
        children: [
          GestureDetector(
            onTap:onTap?? () {
              Get.back();
            },
            child: Container(

              child:  SvgPicture.asset(
                "assets/arrow_back.svg",
                width: 26,

              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.030,
          ),
          Text(
            text!,
            style: GoogleFonts.ubuntu(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: HexColor('#4D4D4D')),
          ),
          Container(child: widget,)

        ],
      ),
    );
  }
}