import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/sign_up_model.dart';

class SignUpController extends GetxController {
  final String baseUrl = 'https://gsm-certification.vercel.app';
  final TextEditingController checkEmailController = TextEditingController();
  final TextEditingController checkVerificationCodeController =
  TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkPasswordController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  var showVerificationCodeInput = true.obs;

  Future<void> requestVerificationCode() async {
    isLoading(true);
    errorMessage('');

    try {
      // 서버 요청
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/auth/send-mail'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
            EmailRequestModel(email: checkEmailController.text).toJson()),
      );
      var responseData = json.decode(response.body);

      if (responseData['code'] == 200) {
        var emailResponse = EmailResponseModel.fromJson(responseData);
        if (emailResponse.status == 'OK') {
          Get.snackbar('성공', emailResponse.message);
          showVerificationCodeInput = true.obs;
          update();
        } else {
          errorMessage('예상치 못한 오류가 발생했습니다.');
        }
      } else if (responseData['status'] == 409) {
        var errorData = json.decode(response.body);
        var errorResponse = EmailErrorResponseModel.fromJson(errorData);
        errorMessage(errorResponse.message);
        Get.snackbar('오류', errorResponse.message);
      } else if (responseData['status'] == 500) {
        var errorData = json.decode(response.body);
        var errorResponse = EmailErrorResponseModel.fromJson(errorData);
        errorMessage(errorResponse.message);
        Get.snackbar('실패', errorResponse.message);
      } else {
        errorMessage('서버 오류가 발생했습니다.');
        Get.snackbar('서버 오류', '서버 오류가 발생했습니다.');
      }
    } catch (e) {
      errorMessage('네트워크 오류가 발생했습니다.');
      Get.snackbar('네트워크 오류', '네트워크 오류가 발생했습니다.');
    } finally {
      isLoading(false);
    }
  }

  Future<void> checkVerificationCode() async {
    Get.toNamed('/signupPassword');
  }

  void test() {
    print(checkEmailController.text);
    print(checkPasswordController.text);
  }
}
