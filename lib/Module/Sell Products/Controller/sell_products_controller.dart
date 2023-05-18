import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:image_picker/image_picker.dart';


import '../../../Constants/api_routes.dart';

import '../../../Routes/set_routes.dart';
import '../../Login/Model/User.dart';

class SellProductsController extends GetxController {
  final formKey = new GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();

  File? imageFile;

  var data = Get.arguments;
  late final User userdata;
  var resident;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data[0];
    resident = data[1];
    print('resident ${resident.residentid}');
  }

  final focus = FocusNode();
  getFromGallery(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    }
  }

  getFromCamera(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print('file picked: $pickedFile');
      // img = pickedFile as Image?;

      print('Assigning Image file');
      imageFile = File(pickedFile.path);
      update();
    }
  }

  addProductDetailApi({
    required File file,
    required String token,
    required int residentid,
    required int societyid,
    required int subadminid,
    required String productname,
    required String productprice,
    required String description,
  }) async {
    update();

    Map<String, String> headers = {"Authorization": "Bearer $token"};
    var request = Http.MultipartRequest('POST', Uri.parse(Api.addProduct));
    request.headers.addAll(headers);

    request.files.add(await Http.MultipartFile.fromPath('images', file.path));

    request.fields['productname'] = productname;
    request.fields['description'] = description;
    request.fields['productprice'] = productprice;

    request.fields['subadminid'] = subadminid.toString();
    request.fields['societyid'] = societyid.toString();
    request.fields['residentid'] = residentid.toString();

    var responsed = await request.send();
    var response = await Http.Response.fromStream(responsed);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(response.body);
      Get.snackbar("Product Added Successfully", "");
      Get.offAndToNamed(marketPlaceScreen, arguments: [userdata, resident]);
    } else if (response.statusCode == 403) {
      update();
      var data = jsonDecode(response.body.toString());

      Get.snackbar(
        "Error",
        data.toString(),
      );
    } else {
      update();

      Get.snackbar("Failed to Save", "");
    }
  }


}
