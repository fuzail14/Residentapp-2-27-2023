import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/Controller/reset_password_controller.dart';
import 'package:userapp/Module/Family%20Member/View%20Family%20Member/Controller/view_family_member_controller.dart';
import 'package:userapp/Routes/set_routes.dart';
import 'package:userapp/Widgets/Loader/loader.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';
import 'package:userapp/Widgets/My%20Floating%20Action%20Button/my_floating_action_button.dart';

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
      builder: (controller) => SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            await Get.offNamed(homescreen, arguments: controller.userdata);

            return false;
          },
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  MyBackButton(
                    text: 'Family Members',
                    onTap: () {
                      Get.offNamed(homescreen, arguments: controller.userdata);
                    },
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: controller.viewResidentsApi(
                            controller.resident.subadminid!,
                            controller.userdata.userId!,
                            controller.userdata.bearerToken!),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.data != null &&
                                snapshot.data.data!.length != 0) {
                              return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              10.w, 16.h, 10.w, 0),
                                          child: SizedBox(
                                            width: 100,
                                            height: 80,
                                            child: Card(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 70,
                                                          height: 64,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(Api
                                                                          .imageBaseUrl +
                                                                      snapshot
                                                                          .data!
                                                                          .data[
                                                                              index]
                                                                          .image
                                                                          .toString()),
                                                                  fit: BoxFit
                                                                      .contain),
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
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 2),
                                                              child: Text(
                                                                snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .firstname +
                                                                    " " +
                                                                    snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .lastname,
                                                                style:
                                                                    GoogleFonts
                                                                        .ubuntu(
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 12,
                                                                  color: HexColor(
                                                                      '#A5AAB7'),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      12,
                                                                  vertical: 0),
                                                              child: Text(
                                                                snapshot
                                                                    .data
                                                                    .data[index]
                                                                    .mobileno,
                                                                style: GoogleFonts
                                                                    .montserrat(
                                                                  color: HexColor(
                                                                      '#606470'),
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .fromLTRB(
                                                                      200,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              child: GetBuilder<
                                                                      ResetPasswordController>(
                                                                  init:
                                                                      ResetPasswordController(),
                                                                  builder:
                                                                      (resetPasswordController) {
                                                                    return SizedBox(
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          20,
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Get.defaultDialog(
                                                                              title: 'Reset Password',
                                                                              content: Form(
                                                                                key: _formKey,
                                                                                child: Column(
                                                                                  children: [
                                                                                    SvgPicture.asset(
                                                                                      'assets/reset_password_icon.svg',
                                                                                      width: 200,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 20,
                                                                                    ),
                                                                                    MyPasswordTextFormField(validator: emptyStringValidator, labelText: 'New Password', hintText: 'New Password', togglePasswordView: resetPasswordController.togglePasswordView, controller: resetPasswordController.passwordController, obscureText: resetPasswordController.isHidden),
                                                                                    SizedBox(
                                                                                      height: 20,
                                                                                    ),
                                                                                    MyButton(
                                                                                      name: 'Reset Password',
                                                                                      onPressed: () {
                                                                                        if (_formKey.currentState!.validate()) {
                                                                                          resetPasswordController.resetPasswordApi(familymemberid: snapshot.data.data[index].familyMemberId, bearerToken: controller.userdata.bearerToken!, password: resetPasswordController.passwordController.text);
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
                                                                        child:
                                                                            Text(
                                                                          'Reset Password',
                                                                          style: GoogleFonts.montserrat(
                                                                              fontSize: 8,
                                                                              fontWeight: FontWeight.w500),
                                                                        ),
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                primaryColor),
                                                                      ),
                                                                    );
                                                                  }),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                          ),
                                        ));
                                  },
                                  itemCount: snapshot.data.data.length);
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
              floatingActionButton: MyFloatingActionButton(
                onPressed: () {
                  Get.offNamed(addfamilymember,
                      arguments: [controller.userdata, controller.resident]);
                },
              )),
        ),
      ),
    );
    ;
  }
}
