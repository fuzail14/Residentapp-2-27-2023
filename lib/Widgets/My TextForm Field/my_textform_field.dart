import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Constants/constants.dart';
class MyTextFormField extends GetView {
  final TextEditingController? controller;
  final String? hintText;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final bool? fill;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? fontSize;
  final String? labelText;
  final int? maxLines;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final TextInputType? textInputType;


  final String? Function(String?)? validator;
  final void Function()? onTap;
  const MyTextFormField(
      {super.key,


      this.maxLines,
        this.readOnly,
        this.textInputType,
      this.contentPadding,
      this.prefixIcon,
      this.suffixIcon,
      this.fontWeight,
      this.fill,
      this.fontSize,
      this.onTap,
      this.width,
      this.height,
      this.controller,
      this.fillColor,
      this.validator,
      required this.hintText,
      this.labelTextColor,
      required this.labelText,
      this.hintTextColor,

      });

  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(39, 16, 38, 0),
      child: SizedBox(
        width:width?? MediaQuery.of(context).size.width * 0.8,

        height: height,
        child: TextFormField(

          keyboardType: textInputType,
          // obscureText: widget.obscureText,
          textAlign: TextAlign.left,
          onTap: onTap,
          validator: validator,
          maxLines: maxLines??1,
          controller: controller,
          cursorColor: primaryColor,
          readOnly:readOnly??false ,
          decoration: InputDecoration(

            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none ,
            focusedErrorBorder:InputBorder.none ,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding??EdgeInsets.fromLTRB(60, 0, 20, 0),
            // suffix: GestureDetector(
            //     // onTap: widget.togglePasswordView,
            //     child: Icon(
            //       widget.obscureText
            //           ? Icons.visibility
            //           : Icons.visibility_off,
            //     )),
            filled: fill??true,


            labelStyle: GoogleFonts.ubuntu(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color:labelTextColor?? HexColor('#B6B6B6')),
            hintStyle: TextStyle(
fontWeight: FontWeight.w400,

              color:hintTextColor??HexColor("#555555"),
            ),
            hintText: hintText,
            labelText: labelText,
            fillColor: fillColor??HexColor('#EEEEEE'),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
              BorderSide(color: primaryColor, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }

}
