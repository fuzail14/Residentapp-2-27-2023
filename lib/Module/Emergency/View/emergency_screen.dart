import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/emergency_controller.dart';

class AddEmergencyScreen extends StatelessWidget {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEmergencyController>(
        init: AddEmergencyController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              await Get.offNamed(homescreen, arguments: controller.userdata);
              return true;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyBackButton(
                            text: 'Add Emergency',
                            onTap: () {
                              Get.offNamed(homescreen,
                                  arguments: controller.userdata);
                            },
                          ),
                          30.h.ph,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: EmergencyHeading(
                              heading: 'Select Emergency Type:',
                            ),
                          ),
                          22.h.ph,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: Wrap(
                              children: [
                                EmergencySubHeading(
                                  heading: 'Emergency Type',
                                ),
                                EmergencyHeading(
                                  heading: '*',
                                ),
                              ],
                            ),
                          ),
                          22.h.ph,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: SizedBox(
                              width: 328.w,
                              child: TextFormField(
                                readOnly: true,
                                style: GoogleFonts.quicksand(
                                    fontStyle: FontStyle.normal,
                                    // color: secondaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: HexColor('#6A7380')),
                                controller: controller.problemController,
                                onTap: () {
                                  showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.r),
                                        topLeft: Radius.circular(30.r),
                                      )),
                                      context: context,
                                      builder: (BuildContext context) {
                                        return GetBuilder<
                                                AddEmergencyController>(
                                            init: AddEmergencyController(),
                                            builder: (controller) {
                                              return buildEmergencyList(
                                                  controller);
                                            });
                                      });
                                },
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 4.w, bottom: -10.0.h),
                                    border: buildUnderlineInputBorder(),
                                    enabledBorder: buildUnderlineInputBorder(),
                                    focusedBorder: buildUnderlineInputBorder(),
                                    suffixIconConstraints:
                                        BoxConstraints(maxHeight: 14),
                                    prefixIconConstraints:
                                        BoxConstraints(maxHeight: 14),
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: HexColor('#A2A7AF'),
                                    )),
                              ),
                            ),
                          ),
                          37.h.ph,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: Wrap(
                              children: [
                                EmergencySubHeading(
                                  heading: 'Description',
                                ),
                                EmergencyHeading(
                                  heading: '*',
                                ),
                              ],
                            ),
                          ),
                          12.h.ph,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: MyTextFormField(
                              width: 328.w,
                              height: 78.w,
                              padding: EdgeInsets.zero,
                              validator: controller.emergencyGroup ==
                                      EmergencyTypes.Other
                                  ? emptyStringValidator
                                  : null,
                              maxLines: 4,
                              fillColor: Colors.white,
                              controller: controller.descriptionController,
                              hintText: 'Describe Problem',
                              labelText: 'Describe Problem',
                            ),
                          ),
                          84.h.ph,
                          Padding(
                            padding: EdgeInsets.only(
                              left: 23.w,
                            ),
                            child: MyButton(
                              loading: controller.isLoading,
                              width: 328.w,
                              height: 52.w,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (!controller.isLoading) {
                                    controller.addEmergencyApi(
                                      residentid: controller.userdata.userId!,
                                      societyid: controller.resident.societyid!,
                                      subadminid:
                                          controller.resident.subadminid!,
                                      token: controller.userdata.bearerToken!,
                                      problem:
                                          controller.problemController.text,
                                      description:
                                          controller.descriptionController.text,
                                    );
                                  }
                                } else {
                                  return null;
                                }
                              },
                              name: 'Add',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          );
        });
  }

  UnderlineInputBorder buildUnderlineInputBorder() {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(10.0.r),
      borderSide: BorderSide(color: HexColor('#A2A7AF'), width: 1.5),
    );
  }

  Widget buildEmergencyList(AddEmergencyController controller) {
    return SizedBox(
      width: 375.w,
      height: 337.w,
      child: Column(
        children: [
          30.h.ph,
          for (int i = 0; i < controller.emergencies.length; i++) ...[
            SizedBox(
              height: 46.h,
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 58.02.w),
                  child: Text(
                    controller.emergencies[i].title.toString(),
                    style: GoogleFonts.openSans(
                        color: HexColor('#6A7380'),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                leading: Padding(
                  padding: EdgeInsets.only(left: 60.w),
                  child: Radio(
                    fillColor: MaterialStateProperty.resolveWith(
                        (states) => primaryColor),
                    value: controller.emergencies[i].emergencyTypes,
                    groupValue: controller.emergencyGroup,
                    onChanged: (value) {
                      controller.setEmergency(value);
                      Get.back();
                    },
                  ),
                ),
                trailing: Padding(
                    padding: EdgeInsets.only(right: 33.98.w),
                    child: controller.emergencies[i].emergencyTypes ==
                            controller.emergencyGroup
                        ? Icon(
                            Icons.check_outlined,
                            color: HexColor('#6A7380'),
                            size: 24.w,
                          )
                        : null),
              ),
            ),
            Divider(
              color: HexColor('#C4C4C4'),
            ),
          ],
        ],
      ),
    );
  }
}

class EmergencyHeading extends StatelessWidget {
  final String? heading;

  const EmergencyHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      heading ?? "",
      style: GoogleFonts.quicksand(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: primaryColor),
    );
  }
}

class EmergencySubHeading extends StatelessWidget {
  final String? heading;

  const EmergencySubHeading({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      heading ?? "",
      style: GoogleFonts.quicksand(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: HexColor('#6A7380')),
    );
  }
}
