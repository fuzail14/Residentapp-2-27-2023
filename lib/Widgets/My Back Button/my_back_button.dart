import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyBackButton extends GetView {

  final String? text;
  final Widget? widget;
 final void Function()? onTap;

  const MyBackButton({ this.text,this.widget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 38, top: 40),
      child: Row(
        children: [
          GestureDetector(
            onTap:onTap?? () {
              Get.back();
            },
            child: Container(

             child:  SvgPicture.asset(
               "assets/arrow_back.svg",

             ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.030,
          ),
          Text(
            text!,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black),
          ),
          Container(child: widget,)

        ],
      ),
    );
  }
}