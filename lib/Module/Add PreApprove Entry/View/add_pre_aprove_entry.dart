import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:userapp/Constants/constants.dart';
import 'package:userapp/Widgets/My%20Back%20Button/my_back_button.dart';
import 'package:userapp/Widgets/My%20Button/my_button.dart';
import 'package:userapp/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import '../Controller/add_pre_approve_entry_controller.dart';

class AddPreApproveEntry extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: GetBuilder<AddPreApproveEntryController>(
            init: AddPreApproveEntryController(),
            builder: (controller) {
              return Container(
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MyBackButton(text: 'Add PreApprove Entry'),
                        SizedBox(
                          height: 29,
                        ),

                        SizedBox(
                          height: 14,
                        ),

                        controller.isData
                            ? Padding(
                                padding: const EdgeInsets.fromLTRB(39, 17, 38, 0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Choose Gate",
                                    style: GoogleFonts.ubuntu(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: HexColor('#717171')),
                                  ),
                                ),
                              )
                            : CircularProgressIndicator(
                                color: primaryColor,
                              ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(38, 0, 45, 0),
                          child: DropdownButton(
                            style: GoogleFonts.ubuntu(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.black),
                            value: controller.gateKeeperdropdownvalue,
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: primaryColor,
                            ),
                            items: controller.gateKeeperList.map((items) {
                              return DropdownMenuItem(
                                value: items.gatekeeperid.toString(),
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [Text(items.gateno.toString())],
                                    )),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.setGateKeeperDropDown(newValue);
                              controller.gateKeeperdropdownvalue;
                              print(controller.gateKeeperdropdownvalue);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 39),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Visitor Type",
                              style: GoogleFonts.ubuntu(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: HexColor('#4D4D4D')),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(38, 0, 45, 0),
                          child: DropdownButton(
                            isExpanded: true,
                            style: GoogleFonts.ubuntu(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: HexColor('#4D4D4D')),
                            value: controller.visitorTypedropdownvalue,
                            icon: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: primaryColor,
                            ),
                            items:
                                controller.visitorTypesList.map((String? items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items!),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              controller.setVisitorTypeDropDownvalue(newValue);
                            },
                          ),
                        ),

                        MyTextFormField(
                          controller: controller.nameController,
                          validator: emptyStringValidator,
                          labelText: 'Enter Name',
                          hintText: '',
                          fillColor: Colors.white,
                          onEnabledBorderColor: primaryColor,
                          onFocusedBorderColor: primaryColor,
                        ),
                        MyTextFormField(
                          controller: controller.descriptionController,
                          // validator: emptyStringValidator,

                          labelText: 'Description',
                          hintText: 'Enter Description',
                          fillColor: Colors.white,
                          onEnabledBorderColor: primaryColor,
                          onFocusedBorderColor: primaryColor,
                        ),
                        MyTextFormField(
                          controller: controller.cnicController,
                          // validator: emptyStringValidator,
                          labelText: 'Cnic',
                          hintText: 'Cnic',
                          fillColor: Colors.white,
                          onEnabledBorderColor: primaryColor,
                          onFocusedBorderColor: primaryColor,
                        ),
                        MyTextFormField(
                          controller: controller.mobileNoController,
                          validator: emptyStringValidator,
                          labelText: 'Mobile Number',
                          hintText: 'Mobile Number',
                          fillColor: Colors.white,
                          onEnabledBorderColor: primaryColor,
                          onFocusedBorderColor: primaryColor,
                        ),
                        MyTextFormField(
                          controller: controller.vehicleNoController,
                          validator: emptyStringValidator,
                          labelText: 'Vehicle Number',
                          hintText: 'Vehicle Number',
                          fillColor: Colors.white,
                          onEnabledBorderColor: primaryColor,
                          onFocusedBorderColor: primaryColor,
                        ),
                        MyTextFormField(
                          controller: controller.arrivaldate,
                          validator: emptyStringValidator,
                          labelText: 'Expected Arrival Date',
                          hintText: 'Expected Arrival Date',
                          fillColor: Colors.white,
                          onEnabledBorderColor: primaryColor,
                          onFocusedBorderColor: primaryColor,
                          onTap: () {
                            controller.StartDate(context);
                          },
                        ),
                        MyTextFormField(
                          controller: controller.arrivaltime,
                          validator: emptyStringValidator,
                          labelText: 'Expected Arrival Time ',
                          hintText: 'Expected Arrival Time',
                          fillColor: Colors.white,
                          onEnabledBorderColor: primaryColor,
                          onFocusedBorderColor: primaryColor,
                          onTap: () {
                            controller.GuestTime(context);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 55, bottom: 67),
                          child: MyButton(
                            name: 'Save',
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                print(controller.gateKeeperdropdownvalue);

                                if (controller.gateKeeperdropdownvalue == null) {
                                  Get.snackbar('Error', 'Select Gatekeeper');
                                  controller.isSetGateKeeper();
                                } else if (controller.visitorTypedropdownvalue ==
                                    null) {
                                  Get.snackbar('Error', 'Select VisitorType');
                                } else {
                                  controller.addPreApprovEntryApi(
                                      token: controller.userdata.bearerToken!,
                                      cnic: controller.cnicController.text,
                                      name: controller.nameController.text,
                                      mobileno:
                                          controller.mobileNoController.text,
                                      userid: controller.userdata.userid!,
                                      arrivaldate: controller.arrivaldate.text,
                                      arrivaltime: controller.arrivaltime.text,
                                      description:
                                          controller.descriptionController.text,
                                      vechileno:
                                          controller.vehicleNoController.text,
                                      visitortype:
                                          controller.visitorTypedropdownvalue!,
                                      gatekeeperid: int.parse(
                                          controller.gateKeeperdropdownvalue!));
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
