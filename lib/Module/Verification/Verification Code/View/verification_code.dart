import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../Register/Controller/register_controller.dart';
import '../Controller/verification_code_controller.dart';

class VerificationCode extends StatelessWidget {
  final verificationCodeController = Get.put(VerificationCodeController());

  final registerController = Get.put(RegisterController());
  VerificationCode({super.key});

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outlined,
                    size: 80,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Verification Code",
                    style: GoogleFonts.ubuntu(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Enter your 6 digits verification code.",
                    style: GoogleFonts.ubuntu(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Pinput(
                      validator: otpValidator,
                      controller: verificationCodeController.otpCodeController,
                      length: 6,
                      onCompleted: (val) {
                        verificationCodeController.otpCode.value = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "if you didn't receive your verification code click ?",
                        style: GoogleFonts.ubuntu(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Resend code",
                        style: GoogleFonts.ubuntu(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Obx(() {
                    return MyButton(
                      loading: verificationCodeController.isLoading.value,
                      name: 'Next',
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          if (!verificationCodeController.isLoading.value) {
                            verificationCodeController.verifyUserOtp();
                          }
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
