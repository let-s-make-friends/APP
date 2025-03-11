import 'package:flutter/material.dart';
import 'package:gsm_certification_system/util/custom_outlined_button.dart';
import 'package:gsm_certification_system/util/image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/start_controller.dart';
import '../util/background_button.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  final StartController startController = StartController();

  @override
  Widget build(BuildContext context) {
    ImageAssets image = ImageAssets();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(image.logo),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: Offset(0, -24.h),
                  child: SizedBox(
                    height: 128.h,
                    child: Column(
                      children: [
                        BackgroundButton(
                          buttonText: '로그인',
                          onButtonPressed: () {
                            startController.goToLogInScreen();
                          },
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        CustomOutlinedButton(
                          buttonText: '회원 가입',
                          onButtonPressed: () {
                            startController.goToSignUpScreen();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
