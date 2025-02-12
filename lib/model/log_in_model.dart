import 'package:http/http.dart' as http;
import 'dart:convert';

class LogInModel {
  Future<Map<String, dynamic>?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("https://your-server.com/api/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        "message": data["message"], // 메시지 포함
        "accessToken": data["token"]["accessToken"],
        "refreshToken": data["token"]["refreshToken"],
        "accessTokenExp": data["token"]["accessTokenExp"],
        "refreshTokenExp": data["token"]["refreshTokenExp"],
      };
    } else {
      return null;
    }
  }
}
