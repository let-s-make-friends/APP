import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/log_in_model.dart';

class LogInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LogInModel model = LogInModel();
  var isLoading = false.obs;
  var token = "".obs; // JWT 토큰 저장
  var accessToken = "".obs;
  var refreshToken = "".obs;
  var accessTokenExp = 0.obs;
  var refreshTokenExp = 0.obs;

  Future<void> login() async {
    isLoading.value = true;

    /*final tokenData = await model.login(
      emailController.text,
      passwordController.text,
    );*/
    // 임시 데이터 처리 (서버 요청처럼 지연 효과를 추가)
    await Future.delayed(Duration(seconds: 1));

    isLoading.value = false;

    // 임시 데이터
    final tokenData = {
      "message": "Login Successful",
      "accessToken": "dummy_access_token",
      "refreshToken": "dummy_refresh_token",
      "accessTokenExp": 3600,
      "refreshTokenExp": 7200,
    };

// 임시 데이터로 토큰 정보를 반영
    if (tokenData != null) {
      accessToken.value = tokenData["accessToken"] as String;
      refreshToken.value = tokenData["refreshToken"] as String;
      accessTokenExp.value = tokenData["accessTokenExp"] as int;
      refreshTokenExp.value = tokenData["refreshTokenExp"] as int;

      Get.snackbar("Success", tokenData["message"] as String,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar("Error", "Login Failed",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
