import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/log_in_model.dart';


class LogInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String baseUrl = 'https://gsm-certification.vercel.app';
  var isLoading = false.obs;
  var loginModel = Rxn<LogInModel>();
  var errorMessage = ''.obs;

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': emailController.text, 'password': passwordController.text}),
      );
      final data = jsonDecode(response.body);
      if (data["code"] == 200) {
        if (data['status'] == 'OK') {
          loginModel.value = LogInModel.fromJson(data);
        } else {
          errorMessage.value = '로그인 실패';
        }
      } else if (data["code"] == 404) {
        final data = jsonDecode(response.body);
        errorMessage.value = data['message'] ?? '사용자를 찾을 수 없습니다.';
      } else {
        errorMessage.value = '네트워크 오류 발생';
      }
    } catch (e) {
      errorMessage.value = '알 수 없는 오류 발생';
    } finally {
      isLoading(false);
    }
  }
}
