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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(text: 'SIGN UP', size: 32.sp, family: 'PottaOne'),
                SizedBox(
                  height: 36.h,
                ),
                Text(
                  '이메일',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: CustomTextField(
                          hintText: '이메일을 입력해주세요',
                          obscureText: false,
                          controller: signUpController.checkEmailController),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: ElevatedButton(
                        onPressed: () {
                          signUpController.sendEmailRequest();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(colorData.mainColor),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12.sp), // 보더 라운드 설정
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Text(
                            '인증번호',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.w),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  hintText: '인증번호를 입력해주세요',
                  labelText: '인증번호',
                  obscureText: false,
                  controller: signUpController.checkVerificationCodeController,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomTextField(
                  labelText: '비밀번호',
                  hintText: '비밀번호을 입력해주세요',
                  obscureText: true,
                  controller: signUpController.passwordController,
                ),
                SizedBox(
                  height: 18.h,
                ),
                CustomTextField(
                  labelText: '비밀번호 확인',
                  hintText: '비밀번호를 재입력해주세요',
                  obscureText: true,
                  controller: signUpController.checkPasswordController,
                ),
                SizedBox(
                  height: 32.h,
                ),
                BackgroundButton(
                  buttonText: '회원가입',
                  onButtonPressed: () {

                    signUpController.signUp();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
