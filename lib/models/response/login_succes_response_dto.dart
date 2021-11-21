// To parse this JSON data, do
//
//     final loginSuccessResponseDto = loginSuccessResponseDtoFromJson(jsonString);

import 'dart:convert';

LoginSuccessResponseDto loginSuccessResponseDtoFromJson(String str) =>
    LoginSuccessResponseDto.fromJson(json.decode(str));

String loginSuccessResponseDtoToJson(LoginSuccessResponseDto data) =>
    json.encode(data.toJson());

class LoginSuccessResponseDto {
  LoginSuccessResponseDto({
    required this.accessToken,
    required this.tokenType,
    required this.refreshToken,
    required this.expiresIn,
    required this.scope,
  });

  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;

  factory LoginSuccessResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginSuccessResponseDto(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        refreshToken: json["refresh_token"],
        expiresIn: json["expires_in"],
        scope: json["scope"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "refresh_token": refreshToken,
        "expires_in": expiresIn,
        "scope": scope,
      };
}
