class LogInModel {
  final String username;
  final TokenDto? tokenDto;

  LogInModel({required this.username, this.tokenDto});

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
      username: json['username'] ?? '',  // 기본값 설정
      tokenDto: json['tokenDto'] != null
          ? TokenDto.fromJson(json['tokenDto'])
          : null,  // null 체크
    );
  }
}

class TokenDto {
  final String accessToken;
  final String refreshToken;
  final String accessTokenExp;
  final String refreshTokenExp;

  TokenDto({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExp,
    required this.refreshTokenExp,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) {
    return TokenDto(
      accessToken: json['accessToken'] ?? '',  // 기본값 설정
      refreshToken: json['refreshToken'] ?? '',  // 기본값 설정
      accessTokenExp: json['accessTokenExp'] ?? '',  // 기본값 설정
      refreshTokenExp: json['refreshTokenExp'] ?? '',  // 기본값 설정
    );
  }
}
