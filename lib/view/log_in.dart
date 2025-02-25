import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsm_certification_system/controller/log_in_controller.dart';
import '../util/text.dart';
import '../util/custom_text_field.dart';
import '../util/background_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final LogInController logInController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(text: 'LOGIN', size: 32.sp,family: 'PottaOne'),
              SizedBox(
                height: 36.h,
              ),
              CustomTextField(
                labelText: '이메일',
                hintText: '학교 이메일을 입력해주세요',
                obscureText: false,
                controller: logInController.emailController,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomTextField(
                labelText: '비밀번호',
                hintText: '비밀번호를 입력해주세요',
                obscureText: true,
                controller: logInController.passwordController,
              ),
              SizedBox(
                height: 24.h,
              ),
              BackgroundButton(
                buttonText: '로그인',
                onButtonPressed: () {
                  logInController.login();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
