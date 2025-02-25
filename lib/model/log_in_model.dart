
class LogInModel {
  final String accessToken;
  final String refreshToken;
  final String accessTokenExp;
  final String refreshTokenExp;

  LogInModel({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExp,
    required this.refreshTokenExp,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
      accessTokenExp: json["accessTokenExp"],
      refreshTokenExp: json["refreshTokenExp"],
    );
  }
}
