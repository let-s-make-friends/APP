import 'package:flutter/material.dart';
import 'package:gsm_certification_system/util/color.dart';
import 'package:gsm_certification_system/util/image.dart';

import '../controller/start_controller.dart';
import '../util/background_button.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  final StartController startController = StartController();

  @override
  Widget build(BuildContext context) {
    ColorData colorData = ColorData();
    ImageAssets image = ImageAssets();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.02),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(image.logo),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Transform.translate(
                offset: Offset(0, -size.height * 0.01),
                child: SizedBox(
                  height: size.height * 0.15,
                  child: Column(
                    children: [
                      BackgroundButton(
                        buttonText: '로그인',
                        onButtonPressed: () {
                          startController.goToLogInScreen();
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          startController.goToSignUpScreen();
                        },
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Color(colorData.mainColor),
                              width: 1,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            maximumSize: Size(size.width, 60),
                            minimumSize: Size(size.width, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          '회원 가입',
                          style: TextStyle(
                              color: Color(colorData.mainColor),
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
