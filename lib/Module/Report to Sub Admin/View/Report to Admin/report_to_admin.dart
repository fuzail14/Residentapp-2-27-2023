import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';
import 'package:userapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import '../../Controller/Report to Admin Controller/report_to_admin_controller.dart';
class ReportToAdmin extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: GetBuilder<AddReportToAdminController>(
            init: AddReportToAdminController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(text: 'Complaint to Admin '),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),


                      SvgPicture.asset(
                        "assets/report_to_admin_vector.svg",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),

                      MyTextFormField(
                          controller: controller.reportTitleController,
                          hintTextColor: primaryColor,
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                          hintText: 'Enter Compliant Title',
                          labelText: 'Complaint Title',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      SizedBox(
                        height: 10,
                      ),

                      //third Element
                      MyTextFormField(
                          controller: controller.reportDescriptionController,
                          hintTextColor: primaryColor,
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                          hintText: 'Enter Report Description',
                          labelText: 'Complaint Description',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),

                      SizedBox(
                        height: 10,
                      ),

                      MyTextFormField(
                          onTap: () {
                            controller.Date(context);
                          },
                          suffixIcon: SizedBox(
                            child: SvgPicture.asset(
                                "assets/complaint_date_icon.svg",
                                height: 5,
                                width: 5,
                                fit: BoxFit.scaleDown),
                          ),
                          controller: controller.dateController,
                          hintTextColor: primaryColor,
                          fillColor: Colors.white,
                          validator: emptyStringValidator,
                          hintText: 'Enter Complaint Date',
                          labelText: 'Complain Date',
                          onFocusedBorderColor: primaryColor,
                          onEnabledBorderColor: primaryColor),
                      SizedBox(
                        height: 10,
                      ),
// TextFormField(decoration: InputDecoration(
//   border: InputBorder.none,
//   labelText: 'Helo',
//     labelStyle:TextStyle(color: Colors.grey,
//
//   decoration:TextDecoration.none,
//
//
//
// ) ),),

                      MyButton(
                        color: primaryColor,
                        onPressed:controller.isLoading?null  :
                          () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.reportToAdminApi(
                                token: controller.userdata.bearerToken!,
                                subadminid: controller.resident!.subadminid!,
                                userid: controller.userdata.userid!,
                                title: controller.reportTitleController.text,
                                date: controller.dateController.text,
                                description:
                                    controller.reportDescriptionController.text);
                          }
                        },
                        name: 'Submit Report',
                      )
                      // fourth Element

                      // sixth Element
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
