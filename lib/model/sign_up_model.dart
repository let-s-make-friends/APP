import 'package:get/get.dart';

// 이메일 요청 모델
class EmailRequestModel {
  final String email;

  EmailRequestModel({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

// 성공적인 응답 모델
class EmailResponseModel {
  final String status;
  final int code;
  final String message;
  final dynamic data;

  EmailResponseModel({
    required this.status,
    required this.code,
    required this.message,
    this.data,
  });

  factory EmailResponseModel.fromJson(Map<String, dynamic> json) {
    return EmailResponseModel(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}

// 오류 응답 모델
class EmailErrorResponseModel {
  final String status;
  final String error;
  final String code;
  final String message;
  final String timestamp;

  EmailErrorResponseModel({
    required this.status,
    required this.error,
    required this.code,
    required this.message,
    required this.timestamp,
  });

  factory EmailErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return EmailErrorResponseModel(
      status: json['status'],
      error: json['error'],
      code: json['code'],
      message: json['message'],
      timestamp: json['timestamp'],
    );
  }
}
