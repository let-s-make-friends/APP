import 'package:flutter/material.dart';
import 'package:gsm_certification_system/util/custom_text_field.dart';

import '../util/color.dart';
import '../util/text.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController checkEmailController = TextEditingController();
  ColorData colorData = ColorData();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(text: 'SIGN UP', size: size.width * 0.1),
            CustomTextField(
              hintText: '학교 이메일을 입력해주세요',
              obscureText: false,
              controller: checkEmailController,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            OutlinedButton(
              onPressed: () {},
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
                '인증번호 받기',
                style: TextStyle(
                    color: Color(colorData.mainColor),
                    fontWeight: FontWeight.w600),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
