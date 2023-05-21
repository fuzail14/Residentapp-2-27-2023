import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/emergency_controller.dart';

class AddEmergencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AddEmergencyController>(
            init: AddEmergencyController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(
                        text: 'Add Emergency',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Select Emergency Type",
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              // color: secondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: HexColor('#4D4D4D')),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DropdownButtonFormField(
                          isExpanded: true,
                          elevation: 1,
                          style: GoogleFonts.ubuntu(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontSize: 14,
                              color: HexColor('#4D4D4D')),
                          value: controller.emergencyValue,
                          icon: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: primaryColor,
                          ),
                          validator: (value) =>
                              value == null ? 'Please Select Problem' : null,
                          items: controller.emergencyList.map((items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            controller.EmergencyDropDownVlaue(newValue);
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      if (controller.emergencyValue == 'Other') ...[
                        MyTextFormField(
                          controller: controller.problemController,
                          validator: emptyStringValidator,
                          hintText: 'Describe Problem',
                          labelText: 'Describe Problem',
                        )
                      ],
                      MyTextFormField(
                        controller: controller.DescriptionController,
                        hintText: 'Description',
                        labelText: 'Description',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      MyButton(
                        width: MediaQuery.of(context).size.width * 0.4,
                        elevation: 5,
                        onPressed: controller.isLoading
                            ? null
                            : () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  if (controller.emergencyValue == 'Other') {
                                    controller.addEmergencyApi(
                                      residentid: controller.userdata.userId!,
                                      token: controller.userdata.bearerToken!,
                                      problem:
                                          controller.problemController.text,
                                      Description:
                                          controller.DescriptionController.text,
                                      societyid: controller.resident.societyid!,
                                      subadminid:
                                          controller.resident.subadminid!,
                                    );
                                  } else {
                                    

                                    controller.addEmergencyApi(
                                      residentid: controller.userdata.userId!,
                                      societyid: controller.resident.societyid!,
                                      subadminid:
                                          controller.resident.subadminid!,
                                      token: controller.userdata.bearerToken!,
                                      problem: controller.emergencyValue,
                                      Description:
                                          controller.DescriptionController.text,
                                    );
                                  }
                                } else {
                                  return null;
                                }
                              },
                        textColor: Colors.white,
                        color: primaryColor,
                        name: 'Save',
                        maxLines: 1,
                        outlinedBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
