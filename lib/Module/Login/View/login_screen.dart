import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
     SingleChildScrollView(child:
                  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                          SvgPicture.asset(
                            "assets/login_vector.svg",
                          ),
                          SizedBox(height:MediaQuery.of(context).size.height*0.05,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Welcome To",
                                style:  GoogleFonts.ubuntu(
                                  color: HexColor('#4D4D4D'),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 36,
                                ),),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("MIA RESIDENTS APP ",textAlign: TextAlign.center,
                                style:  GoogleFonts.ubuntu(
                                  color: HexColor('#717171'),
                                  letterSpacing:3.2 ,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),),
                            ),
                          ),
                          SizedBox(height: 34,),
                          Text("Log In",
                            style:  GoogleFonts.ubuntu(
                              color: HexColor('#FF9900'),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),),
                          SizedBox(height: 36,),
                          MyTextFormField(controller: controller.userCnicController,
                              validator: emptyStringValidator,
                              hintText: 'Enter Cnic',
                              labelText: 'Cnic',
                              onFocusedBorderColor: primaryColor,
                              onEnabledBorderColor: primaryColor),


                          MyPasswordTextFormField(

                              controller: controller.userPasswordController,
                              validator: emptyStringValidator,
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              hintTextColor: primaryColor,
                              togglePasswordView: controller.togglePasswordView,
                              onFocusedBorderColor: primaryColor,
                              onEnabledBorderColor: primaryColor,
                              obscureText: controller.isHidden),
                          SizedBox(height:18,),
                          MyButton(


                            color: primaryColor,
                            onPressed:controller.isLoading?null: ()

                          {
                            if (_formKey.currentState!.validate()) {


                              controller.loginApi(
                                  controller.userCnicController.text,
                                  controller.userPasswordController.text);



                            }



                          }, name: 'LOG IN',fontSize: 15,fontWeight: FontWeight.w400,letterSpacing: 0.8,),
                          Wrap(
                            children: [
                              const Text(

                                "Don't have an Account ?",
                                style:
                                TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: () {

                                    Get.offAllNamed(residentpersonaldetail);

                                  },
                                  child: Text(
                                    "Signup",
                                    style:    GoogleFonts.montserrat(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w500
                                    ),
                                  )),
                            ],
                          )


                        ]),
                  ));
            }),
      ),
    );
  }
}
