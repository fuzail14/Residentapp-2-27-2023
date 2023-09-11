import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:userapp/Constants/api_routes.dart';

import '../../Chat Availbility/Model/ChatNeighbours.dart';
import '../../Chat Availbility/Model/ChatRoomModel.dart';
import '../../Login/Model/User.dart';
import '../Model/MarketPlace.dart' as marketplace;

class MarketPlaceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var data = Get.arguments;
  late final User userdata;
  var resident;
  var selectedIndex = 0.obs;
  RxString status = ''.obs;
  RxString selected = ''.obs;
  late Future sellProductFutureData;
  late Future viewProductFutureData;

  RxList<marketplace.Data> list = <marketplace.Data>[].obs;
  RxList<marketplace.Data> list2 = <marketplace.Data>[].obs;

  late TabController tabController;
  Uri? uri;
  List<MarketPlaceGridModel> marketPlaceList = [
    MarketPlaceGridModel(
        icon: "assets/market_place_buy_icon.svg",
        heading: 'Buy',
        color: '#FF9900',
        textColor: '#FFFFFF'),
    MarketPlaceGridModel(
        icon: 'assets/market_place_sell_icon.svg',
        heading: 'Sell',
        color: "#FFFFFF",
        textColor: '#0D0B0C'),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        selectedIndex.value = tabController.index;
      });

    userdata = data[0];
    resident = data[1];

    viewProductFutureData = viewProducts(
        societyid: resident.societyid!, token: userdata.bearerToken!);

    sellProductFutureData = viewSellProductsResidnet(
        residentid: resident.residentid!, token: userdata.bearerToken!);
  }

  viewProducts({required int societyid, required String token}) async {
    list.value.clear();
    final response = await Http.get(
      Uri.parse(Api.viewProducts + "/" + societyid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );

    var data = jsonDecode(response.body.toString());

    print(response.body);

    if (response.statusCode == 200) {
      final marketplace.MarketPlace marketPlace =
          marketplace.MarketPlace.fromJson(data);

      list.value = marketPlace.data!;
      list.refresh();

      return list;
    }
    final marketplace.MarketPlace marketPlace =
        marketplace.MarketPlace.fromJson(data);

    list.value = marketPlace.data!;

    list.refresh();

    return list;
  }

  viewSellProductsResidnet(
      {required int residentid, required String token}) async {
    print(token);

    list2.value.clear();
    final response = await Http.get(
      Uri.parse(Api.viewSellProductsResidnet + "/" + residentid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print('data');
    print(response.body);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      final marketplace.MarketPlace marketPlace =
          marketplace.MarketPlace.fromJson(data);

      list2.value = marketPlace.data!;
      list2.refresh();
      return list2;
    }

    final marketplace.MarketPlace marketPlace =
        marketplace.MarketPlace.fromJson(data);

    list2.value = marketPlace.data!;
    list2.refresh();
    return list2;
  }

  Future<ChatRoomModel> createChatRoomApi({
    required String token,
    required int userid,
    required int chatuserid,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.createChatRoom),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "sender": userid,
        "receiver": chatuserid,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return ChatRoomModel.fromJson(data);
    } else {
      return ChatRoomModel.fromJson(data);
    }
  }

  Future<ChatNeighbours> productSellerInfoApi(
      {required int residentid, required String token}) async {
    print(token);

    final response = await Http.get(
      Uri.parse(Api.productSellerInfo + "/" + residentid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    ;

    if (response.statusCode == 200) {
      return ChatNeighbours.fromJson(data);
    }

    return ChatNeighbours.fromJson(data);
  }

  void onSelected({required index}) {
    selectedIndex.value = index;
  }

  productStatus({
    required String token,
    required int id,
    required String status,
  }) async {
    final response = await Http.post(
      Uri.parse(Api.productStatus),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "status": status,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      list.clear();
      list2.clear();
      viewProductFutureData = viewProducts(
          societyid: resident.societyid!, token: userdata.bearerToken!);

      sellProductFutureData = viewSellProductsResidnet(
          residentid: resident.residentid!, token: userdata.bearerToken!);
    } else {}
  }
}

// Future<void> uploadImages(List<String> imagePaths, bearerToken) async {
//   var request = http.MultipartRequest(
//     'POST',
//     Uri.parse(Api.baseUrl +
//         "event/addeventimages"), // Replace with your server's upload URL
//   );
//
//   Map<String, String> headers = {"Authorization": "Bearer $bearerToken"};
//   request.headers.addAll(headers);
//
//   for (var imagePath in imagePaths) {
//     print(imagePaths);
//     var file = await http.MultipartFile.fromPath(
//       'images',
//       imagePath,
//       // Replace with the appropriate content type
//     );
//
//     request.files.add(file);
//   }
//
//   var response = await request.send();
//   print(response.statusCode);
//   if (response.statusCode == 200) {
//     print('Images uploaded successfully');
//   } else {
//     print('Failed to upload images. Error: ${response.reasonPhrase}');
//   }
// }
//
// Future<void> pickImages() async {
//   List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
//   if (pickedImages != null) {
//     imagePaths = pickedImages.map((image) => image.path).toList();
//   }
// }
//
// Future<void> pickFireBaseImages() async {
//   List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
//   if (pickedImages != null) {
//     selectedImages = pickedImages.map((image) => File(image.path)).toList();
//   }
// }
//
// Future<void> uploadFireBaseImages(List<File> images) async {
//   try {
//     for (var image in images) {
//       String fileName = DateTime.now()
//           .millisecondsSinceEpoch
//           .toString(); // Generate a unique file name
//       Reference storageReference =
//       FirebaseStorage.instance.ref().child(fileName);
//       UploadTask uploadTask = storageReference.putFile(image);
//       await uploadTask.whenComplete(
//               () => print('Image uploaded')); // Wait for the upload to complete
//     }
//     print('All images uploaded successfully');
//   } catch (e) {
//     print('Failed to upload images. Error: $e');
//   }
// }

class MarketPlaceGridModel {
  final String? icon;
  final String? heading;
  final String? color;
  final String? textColor;

  MarketPlaceGridModel(
      {required this.icon,
      required this.heading,
      required this.color,
      this.textColor});
}
