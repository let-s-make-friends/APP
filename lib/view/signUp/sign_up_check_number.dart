import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/controller/sign_up_controller.dart';
import 'package:gsm_certification_system/util/custom_outlined_button.dart';
import 'package:gsm_certification_system/util/custom_text_field.dart';

import '../../util/background_button.dart';
import '../../util/color.dart';
import '../../util/text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController signUpController = Get.put(SignUpController());
  final ColorData colorData = ColorData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(text: 'SIGN UP', size: 32.sp, family: 'PottaOne'),
              SizedBox(
                height: 36.h,
              ),
              CustomTextField(
                hintText: '학교 이메일을 입력해주세요',
                obscureText: false,
                controller: signUpController.checkEmailController,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomOutlinedButton(
                  buttonText: '인증번호 받기',
                  onButtonPressed: () {
                    signUpController.requestVerificationCode();
                  }),
              GetBuilder<SignUpController>(builder: (_) {
                return AnimatedOpacity(
                  opacity: signUpController.showVerificationCodeInput.value
                      ? 1.0
                      : 0.0,
                  curve: Easing.legacy,
                  duration: Duration(milliseconds: 700),
                  child: AnimatedSlide(
                      offset: signUpController.showVerificationCodeInput.value
                          ? Offset(0, 0)
                          : Offset(1, 0),
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                      child: signUpController.showVerificationCodeInput.value
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  hintText: '인증번호 입력',
                                  obscureText: false,
                                  controller: signUpController
                                      .checkVerificationCodeController,
                                ),
                                Text(
                                  '타인에게 공유하면 위험해요!!',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 18.h,
                                ),
                                BackgroundButton(
                                  buttonText: '인증 확인',
                                  onButtonPressed: () {
                                    signUpController.checkVerificationCode();
                                  },
                                )
                              ],
                            )
                          : Container()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
