import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Routes/set_routes.dart';
import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/login_controller.dart';


class Login extends GetView{
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return
                Form(
                  key: _formKey,
                  child:
              SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        77.h.ph,
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 58.w ),
                          child: Image.asset('assets/login_vector.png'),
                        ),
                        33.h.ph,
                        Padding(
                          padding:  EdgeInsets.fromLTRB(44.w, 0, 124.w, 0),
                          child: Text("Welcome To",
                            style:  GoogleFonts.ubuntu(
                              color: HexColor('#4D4D4D'),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 36,
                            ),),
                        ),
                        19.h.ph,
                        Padding(
                          padding:  EdgeInsets.fromLTRB(46.w, 0, 142.w, 0),
                          child: Text("RESIDENTS APP ",
                            textAlign: TextAlign.center,

                            style:  GoogleFonts.ubuntu(
                              color: HexColor('#717171'),
                              letterSpacing:3.2 ,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                            ),),
                        ),
                        34.h.ph,
                        Padding(
                          padding:  EdgeInsets.fromLTRB(158.w, 0, 160.w, 0),
                          child: Text("Log In",
                            style:  GoogleFonts.ubuntu(
                              color: HexColor('#FF9900'),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),),
                        ),
                        38.h.ph,
                        MyTextFormField(controller: controller.userCnicController,
                            validator: emptyStringValidator,
                            hintText: 'CNIC',
                            labelText: 'CNIC',
                          textInputType: TextInputType.number,


                        ),
                        MyPasswordTextFormField(

                            controller: controller.userPasswordController,
                            validator: emptyStringValidator,
                            labelText: 'Password',
                            hintText: 'Password',
                            togglePasswordView: controller.togglePasswordView,

                            obscureText: controller.isHidden),
                        17.h.ph,
                        Padding(
                          padding:  EdgeInsets.fromLTRB(99.w, 0, 103.w, 0),
                          child: MyButton(


                            color: primaryColor,
                            onPressed:controller.isLoading?null: ()

                          {
                            if (_formKey.currentState!.validate()) {


                              controller.loginApi(
                                  controller.userCnicController.text,
                                  controller.userPasswordController.text);



                            }



                          }, name: 'LOG IN',fontSize: 15,fontWeight: FontWeight.w400,letterSpacing: 0.8,),
                        ),
                        25.h.ph,
                        Center(
                          child: Wrap(
                            children: [
                              const Text(

                                "Don't have an Account ?",
                                style:
                                TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              10.w.pw,
                              GestureDetector(
                                  onTap: () {

                                    Get.offAllNamed(residentpersonaldetail);

                                  },
                                  child: Text(
                                    "Signup",
                                    style:    GoogleFonts.montserrat(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600
                                    ),
                                  )),

                            ],
                          ),
                        ),
                        57.h.ph,


                      ]),
              ));
            }),
      ),
    );
  }
}
