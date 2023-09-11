import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';
import 'package:userapp/Widgets/My%20Password%20TextForm%20Field/my_password_textform_field.dart';

class ChangePassword extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                Icons.lock_outlined,
                size: 80.w,
                color: primaryColor,
              ),
              13.h.ph,
              Text(
                "Change Password",
                style: GoogleFonts.ubuntu(
                    fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              13.h.ph,
              MyPasswordTextFormField(
                obscureText: true,
                hintText: 'Password',
              ),
              MyPasswordTextFormField(
                obscureText: true,
                hintText: 'Confirm Password',
              ),
              13.h.ph,
              MyButton(
                name: 'Confirm',
                onPressed: () {},
              )
            ],
          ),
        )),
      ),
    );
  }
}
