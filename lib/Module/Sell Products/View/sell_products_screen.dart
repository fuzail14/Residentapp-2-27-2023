import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/sell_products_controller.dart';

class SellProductsScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SellProductsController>(
            init: SellProductsController(),
            builder: (controller) {
              return Form(
                key: controller.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyBackButton(text: 'Product Detail'),
                      SizedBox(
                        height: 20,
                      ),
                      Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.white,
                            backgroundImage: controller.imageFile == null
                                ? AssetImage('assets/user.png') as ImageProvider
                                : FileImage(
                                    File(controller.imageFile!.path),
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
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              primaryColor),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              primaryColor),
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
                      MyTextFormField(
                        controller: controller.productNameController,
                        validator: emptyStringValidator,
                        labelText: 'Product Name',
                        hintText: 'Product Name',
                      ),
                      MyTextFormField(
                        controller: controller.descriptionController,
                        validator: emptyStringValidator,
                        labelText: 'Product Description',
                        hintText: 'Product Description',
                      ),
                      MyTextFormField(
                        controller: controller.productPriceController,
                        validator: emptyStringValidator,
                        labelText: 'Product Price',
                        hintText: 'Product Price',
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                          name: 'Save',
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.addProductDetailApi(
                                  societyid: controller.resident.societyid!,
                                  subadminid: controller.resident.subadminid!,
                                  token: controller.userdata.bearerToken!,
                                  residentid: controller.resident.residentid!,
                                  productname:
                                      controller.productNameController.text,
                                  description:
                                      controller.descriptionController.text,
                                  productprice:
                                      controller.productPriceController.text,
                                  file: controller.imageFile!);
                            }
                          }),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
