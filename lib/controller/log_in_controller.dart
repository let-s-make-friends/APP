import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/log_in_model.dart';

class LogInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String baseUrl =
      'https://port-0-gsm-certification-system-be-m7n6efd42ed462fc.sel4.cloudtype.app';
  var isLoading = false.obs;
  var loginModel = Rxn<LogInModel>();
  var errorMessage = ''.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/api/v1/auth/sign-in'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('서버 오류: ${response.statusCode}');
      }

      final data = jsonDecode(response.body);

      // status가 OK이고 code가 200인 경우에만 처리
      if (data['code'] == 200 && data['status'] == 'OK') {
        // 'data' 객체에서 username과 tokenDto를 추출
        final loginData = data['data'];

        // LogInModel로 파싱
        loginModel.value = LogInModel.fromJson(loginData);

        Get.snackbar(
          '로그인 성공',
          '환영합니다!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        errorMessage.value = data['message'] ?? '로그인 실패';
        Get.snackbar(
          '로그인 실패',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } on http.ClientException {
      errorMessage.value = '네트워크 오류 발생';
      Get.snackbar(
        '오류',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } on FormatException {
      errorMessage.value = '서버 응답 형식 오류';
      Get.snackbar(
        '오류',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } catch (e) {
      errorMessage.value = '알 수 없는 오류 발생: $e';
      Get.snackbar(
        '오류',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
