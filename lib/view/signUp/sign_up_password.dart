import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/controller/sign_up_controller.dart';
import 'package:gsm_certification_system/util/text.dart';
import 'package:gsm_certification_system/util/background_button.dart';
import 'package:gsm_certification_system/util/custom_text_field.dart';

class SignUpPassword extends StatelessWidget {
  SignUpPassword({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(text: 'SIGNUP', size: 32.sp, family: 'PottaOne'),
              SizedBox(
                height: 36.h,
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
                height: 18.h,
              ),
              BackgroundButton(
                buttonText: '확인',
                onButtonPressed: () {
                  signUpController.test();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
