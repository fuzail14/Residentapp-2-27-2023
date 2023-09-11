import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:userapp/Module/Family%20Member/Add%20Family%20Member/Controller/add_family_member_controller.dart';
import 'package:userapp/Module/Signup/Resident%20Personal%20Detail/Controller/resident_personal_detail_controller.dart';

import '../../../../Constants/constants.dart';
import '../../../Signup/Resident Personal Detail/Model/Resident.dart';
import '../../Register/Controller/register_controller.dart';

class VerificationCodeController extends GetxController {
  RxString otpCode = "".obs;
  RxString fcmToken = "".obs;
  RxString verificatioCode = "".obs;
  final otpCodeController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RegisterController controller = Get.find();
  RxBool isLoading = false.obs;
  Resident? resident;

  verifyUserOtp() async {
    String smsCode = otpCodeController.text.toString();
    isLoading.value = true;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificatioCode.value, smsCode: smsCode);

    UserCredential? userCredential = await _auth
        .signInWithCredential(credential)
        .catchError((error, stackTrace) {
      isLoading.value = false;

      myToast(msg: error.toString(), isNegative: true);
    });

    if (userCredential != null) {
      userCredential.user!.phoneNumber.toString().trim();
      log(userCredential.user!.phoneNumber.toString().trim());

      if (controller.type == 'SignUp') {
        final ResidentPersonalDetailController residentPersonalDetail =
            Get.find();

        residentPersonalDetail.signUpApi(
          file: residentPersonalDetail.imageFile,
          lastName: residentPersonalDetail.lastnameController.text,
          cnic: residentPersonalDetail.cnicController.text,
          firstName: residentPersonalDetail.firstnameController.text,
          address: residentPersonalDetail.addressController.text,
          mobileno: userCredential.user!.phoneNumber.toString().trim(),
          password: residentPersonalDetail.passwordController.text,
        );
        isLoading.value = false;
      } else if (controller.type == 'AddFamilyMember') {
        final AddFamilyMemberController addFamilyMemberController = Get.find();

        addFamilyMemberController.addFamilyMemberApi(
            bearerToken: addFamilyMemberController.userdata.bearerToken!,
            firstName: addFamilyMemberController.firstnameController.text,
            lastName: addFamilyMemberController.lastnameController.text,
            cnic: addFamilyMemberController.cnicController.text,
            address: addFamilyMemberController.resident.houseaddress!,
            mobileno: userCredential.user!.phoneNumber.toString().trim(),
            password: addFamilyMemberController.passwordController.text,
            file: addFamilyMemberController.imageFile,
            subadminid: addFamilyMemberController.resident.subadminid!,
            residentid: addFamilyMemberController.userdata.userId!);
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    verificatioCode.value = controller.verificationId.value;
    log(verificatioCode.value.toString());
  }
}
