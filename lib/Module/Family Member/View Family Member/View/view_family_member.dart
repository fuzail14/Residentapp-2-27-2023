import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/Controller/reset_password_controller.dart';
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/Controller/view_family_member_controller.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';

class ViewFamilyMember extends GetView {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewFamilyMemberController>(
      init: ViewFamilyMemberController(),
      builder: (controller) =>
          SafeArea(
            child: WillPopScope(
              onWillPop: () async {
                await Get.offAndToNamed(
                    homescreen, arguments: controller.userdata);

                return false;
              },
              child: Scaffold(
                backgroundColor: HexColor('#F5F5F5'),
                body: Column(
                  children: [
                    MyBackButton(text: 'Family Members', onTap: () {
                      Get.offAndToNamed(
                          homescreen, arguments: controller.userdata);
                    },),
                    Expanded(
                      child: FutureBuilder(
                          future: controller.viewResidentsApi(
                              controller.resident.subadminid!,
                              controller.userdata.userId!,
                              controller.userdata.bearerToken!),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data.data != null && snapshot.data
                                  .data!.length != 0) {
                                return ListView.builder(
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {


                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Container(
                                            decoration: BoxDecoration(

                                              borderRadius:
                                              BorderRadius.circular(17),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      189, 224, 224, 223),
                                                  spreadRadius: 5,

                                                  blurRadius: 9,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              color: HexColor('#FFFFFF'),
                                            ),

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  20.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          width: 70.4,
                                                          height: 64,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      Api.imageBaseUrl +
                                                                          snapshot
                                                                              .data!
                                                                              .data[
                                                                          index]
                                                                              .image
                                                                              .toString()),
                                                                  fit: BoxFit
                                                                      .cover),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  7)),
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            Text(
                                                              snapshot.data
                                                                  .data[index]
                                                                  .firstname +
                                                                  " " +
                                                                  snapshot.data
                                                                      .data[index]
                                                                      .lastname,
                                                              style: TextStyle(
                                                                  fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  fontSize: 16,
                                                                  color: HexColor(
                                                                      '#404345')),
                                                            ),
                                                            Text(
                                                              snapshot.data
                                                                  .data[index]
                                                                  .mobileno,
                                                              style: TextStyle(
                                                                fontStyle:
                                                                FontStyle
                                                                    .normal,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w200,
                                                                fontSize: 16,
                                                              ),
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ],
                                                        ),

                                                        GetBuilder<
                                                            ResetPasswordController>(
                                                          init: ResetPasswordController(),
                                                            builder: (resetPasswordController) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  Get.defaultDialog(
                                                                      title: 'Reset Password',
                                                                      content: Form(
                                                                        key: _formKey,
                                                                        child: Column(
                                                                          children: [
                                                                            SvgPicture
                                                                                .asset(
                                                                              'assets/reset_password_icon.svg',
                                                                              width: 200,
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            MyPasswordTextFormField(
                                                                                validator:emptyStringValidator,
                                                                                labelText: 'New Password',
                                                                                hintText: 'New Password',
                                                                                togglePasswordView:
                                                                                resetPasswordController
                                                                                    .togglePasswordView,
                                                                                controller:
                                                                                resetPasswordController
                                                                                    .passwordController,

                                                                                obscureText:
                                                                                resetPasswordController
                                                                                    .isHidden),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),
                                                                            MyButton(
                                                                              name: 'Reset Password',
                                                                              onPressed: () {

                                                                                if (_formKey.currentState!.validate())
                                                                           {

                                                                             resetPasswordController
                                                                                 .resetPasswordApi(
                                                                                 familymemberid:  snapshot.data
                                                                                     .data[index]
                                                                                     .familyMemberId,
                                                                                 bearerToken: controller
                                                                                     .userdata
                                                                                     .bearerToken!,
                                                                                 password:
                                                                                 resetPasswordController
                                                                                     .passwordController
                                                                                     .text);
                                                                           }



                                                                              },
                                                                            ),
                                                                            SizedBox(
                                                                              height: 20,
                                                                            ),

                                                                          ],
                                                                        ),
                                                                      ));
                                                                },
                                                                child: Chip(
                                                                  label: Text(
                                                                    'Reset Password',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 8),)
                                                                  ,
                                                                  backgroundColor: primaryColor,),
                                                              );
                                                            })
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: snapshot.data.data.length
                                );
                              } else {
                                return Center(
                                    child: Text(
                                      'No Family Member',
                                      style: GoogleFonts.ubuntu(
                                          color: HexColor('#404345'),
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.0015,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ));
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
                floatingActionButton: IconButton(
                    padding: EdgeInsets.only(top: 85),
                    iconSize: MediaQuery
                        .of(context)
                        .size
                        .height * 0.065,
                    icon: SvgPicture.asset('assets/floatingbutton.svg'),
                    onPressed: () {
                      Get.offAndToNamed(addfamilymember, arguments: [
                        controller.userdata,
                        controller.resident
                      ]);
                    }), // floatingActionButton: IconButton(

              ),
            ),
          ),
    );;
  }
}
