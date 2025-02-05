import 'package:flutter/material.dart';
import '../util/color.dart';
import '../util/text.dart';
import '../util/login_text_field.dart';
import '../util/login_button.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ColorData colorData = ColorData();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText(text: 'LOGIN', size: size.width * 0.1),
            SizedBox(
              height: size.height * 0.04,
            ),
            LoginTextField(
              labelText: '이메일',
              hintText: '학교 이메일을 입력해주세요',
              obscureText: false,
              controller: emailController,
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            LoginTextField(
              labelText: '비밀번호',
              hintText: '비밀번호를 입력해주세요',
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            LoginButton(
              buttonText: '로그인',
              onButtonPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
