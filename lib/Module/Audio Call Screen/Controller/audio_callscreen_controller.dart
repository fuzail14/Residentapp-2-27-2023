// import 'package:flutter_callkit_incoming/entities/android_params.dart';
// import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
// import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:get/get.dart';

import '../../Login/Model/User.dart';

class AudioCallScreenController extends GetxController
{

  var data=Get.arguments;
late final  User user;
late int chatRoomid ;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    user=data[0];
    chatRoomid=data[1];


  }










}