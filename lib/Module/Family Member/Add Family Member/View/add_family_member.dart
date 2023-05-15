import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:userapp/Module/Family%20Member/Add%20Family%20Member/Controller/add_family_member_controller.dart';
import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';

class AddFamilyMember extends GetView {


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
          body: GetBuilder<AddFamilyMemberController>(
          init: AddFamilyMemberController(),
          builder: (controller) {
            return WillPopScope(
              onWillPop: ()async

              {

             return   await Get.offNamed(
                    viewfamilymember,
                    arguments: [
                      controller
                          .userdata,
                      controller.resident
                    ]);
              },
              child: Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[


                      MyBackButton(text: 'Family Members',onTap: (){

                        Get.offNamed(
                            viewfamilymember,
                            arguments: [
                              controller
                                  .userdata,
                              controller.resident
                            ]);                    },),
                      100.h.ph,

                      Stack(
                        children: <Widget>[
                          FittedBox(
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.white,
                              backgroundImage: controller.imageFile == null
                                  ? AssetImage('assets/user.png') as ImageProvider
                                  : FileImage(
                                File(controller.imageFile!.path),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 70,
                            top: 70,
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 100.0,
                                        width: MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Choose Profile Photo',
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                ElevatedButton.icon(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: primaryColor),
                                                  icon: Icon(
                                                    Icons.camera,
                                                  ),
                                                  onPressed: () {
                                                    controller.getFromCamera(
                                                        ImageSource.camera);
                                                  },
                                                  label: Text('Camera'),
                                                ),
                                                ElevatedButton.icon(
                                                  style: ElevatedButton.styleFrom(
                                                      primary: primaryColor),
                                                  icon: Icon(Icons.image),
                                                  onPressed: () {
                                                    controller.getFromGallery(
                                                        ImageSource.gallery);
                                                  },
                                                  label: Text('Gallery'),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: primaryColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.h.ph,
                      MyTextFormField(
                        controller: controller.firstnameController,
                        maxLines: 1,
                        validator: emptyStringValidator,
                        hintText: 'First Name',
                        labelText: 'Enter First Name',

                      ),
                      MyTextFormField(
                          controller: controller.lastnameController,
                          validator: emptyStringValidator,
                          hintText: 'Last Name',
                          labelText: 'Enter Last Name',

                      ),
                      MyTextFormField(
                          controller: controller.cnicController,
                          validator: emptyStringValidator,
                          hintText: 'Cnic',
                          labelText: 'Enter Cnic',
                        textInputType: TextInputType.number,


                      ),
                      MyTextFormField(
                          controller: controller.mobileNoController,
                          validator: emptyStringValidator,
                          hintText: 'Mobile No',
                          labelText: 'Enter Mobile No',
                        textInputType: TextInputType.number,


                      ),
                      MyPasswordTextFormField(
                        maxLines: 1,
                        controller: controller.passwordController,
                        obscureText: controller.isHidden,
                        togglePasswordView: controller.togglePasswordView,
                        validator: emptyStringValidator,
                        hintText: 'Enter Password',
                        labelText: 'Password',

                      ),
                      17.h.ph,
                      MyButton(
                        onPressed: controller.isLoading
                            ? null
                            : () {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.imageFile?.path == null) {
                              Get.snackbar('Warning', 'Select an image !');
                            } else {

                              controller.addFamilyMemberApi(
                                bearerToken: controller.userdata.bearerToken!,
                                  firstName:
                                      controller.firstnameController.text,
                                  lastName:
                                      controller.lastnameController.text,
                                  cnic: controller.cnicController.text,
                                  address:
                                      controller.resident.houseaddress!,
                                  mobileno:
                                      controller.mobileNoController.text,
                                  password:
                                      controller.passwordController.text,
                                  file: controller.imageFile, subadminid: controller.resident.subadminid!,
                                  residentid: controller.userdata.userId!);


                            }
                          }
                          //Get.toNamed(residentaddressdetail);
                        },
                        textColor: Colors.white,
                        color: primaryColor,
                        name: 'Add',
                        outlinedBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      25.h.ph,
                    ],
                  ),
                ),
              ),
            );
          })),
    );

  }
}
