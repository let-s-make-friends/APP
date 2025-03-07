import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../util/base_url.dart';

class SignUpController extends GetxController {
  final String baseUrl = BaseUrl().baseUrl;
  final TextEditingController checkEmailController = TextEditingController();
  final TextEditingController checkVerificationCodeController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController checkPasswordController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var responseMessage = ''.obs;

  // 인증번호 요청
  Future<void> sendEmailRequest() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/auth/send-mail'),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
        body: json.encode({'email': checkEmailController.text}),
      );

      if (response.statusCode == 200) {
        // 응답 본문을 utf8로 디코딩
        String responseBody = utf8.decode(response.bodyBytes);
        final data = json.decode(responseBody);
        Get.snackbar(
          '성공',
          '이메일을 확인해세요',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        String responseBody = utf8.decode(response.bodyBytes);
        final errorData = json.decode(responseBody);
        String errorMessage = _getErrorMessage(errorData);
        Get.snackbar(
          '오류',
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        '에러',
        '서버와의 연결에 실패했습니다. 다시 시도해주세요.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> signUp() async {
    if (checkEmailController.text.isNotEmpty &&
        checkVerificationCodeController.text.isNotEmpty &&
        checkPasswordController.text.isNotEmpty) {
      if (passwordController.text == checkPasswordController.text) {
        try {
          isLoading(true);
          final response = await http.post(
            Uri.parse('$baseUrl/api/v1/auth/sign-up'),
            headers: {'Content-Type': 'application/json; charset=utf-8'},
            body: json.encode({
              'email': checkEmailController.text,
              'password': checkPasswordController.text,
              'code': checkVerificationCodeController.text,
            }),
          );
          String responseBody = utf8.decode(response.bodyBytes);
          final data = json.decode(responseBody);
          if (response.statusCode == 200) {
            Get.snackbar(
              '성공',
              data['message'], // 성공 메시지
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            Get.toNamed('/start');
          } else {
            String errorMessage = data['message'];
            Get.snackbar(
              '오류',
              errorMessage,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        } catch (e) {
          Get.snackbar(
            '에러',
            '서버와의 연결에 실패했습니다. 다시 시도해주세요.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } finally {
          isLoading(false);
        }
      } else {
        Get.snackbar(
          '실패',
          '비번이 일치하지 않습니다.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      Get.snackbar(
        '실패',
        '입력칸을 채워주세요',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String _getErrorMessage(Map<String, dynamic> errorData) {
    switch (errorData['code']) {
      case 'USER_ALREADY_EXISTS':
        return '이미 가입된 회원입니다. 다른 이메일을 사용해주세요.';
      case 'EMAIL_SEND_FAILID':
        return '이메일 발송에 실패했습니다. 잠시 후 다시 시도해주세요.';
      case 'INVALID_EMAIL_FORMAT':
        return '잘못된 이메일 형식입니다. 올바른 이메일을 입력해주세요.';
      default:
        return '알 수 없는 오류가 발생했습니다. 다시 시도해주세요.';
    }
  }
}
