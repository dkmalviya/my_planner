// To parse this JSON data, do
//
//     final credentialResponseDto = credentialResponseDtoFromJson(jsonString);

import 'dart:convert';

List<CredentialResponseDto> credentialResponseDtoFromJson(String str) => List<CredentialResponseDto>.from(json.decode(str).map((x) => CredentialResponseDto.fromJson(x)));

String credentialResponseDtoToJson(List<CredentialResponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CredentialResponseDto {
  CredentialResponseDto({
    required this.accountCategory,
    required this.accountName,
    required this.credentialId,
    required this.pin,
    required this.primaryPassword,
    required this.recoveryEmail,
    required this.secondaryPassword,
    required this.userName,
  });

  String accountCategory;
  String accountName;
  int credentialId;
  String pin;
  String primaryPassword;
  String recoveryEmail;
  String secondaryPassword;
  String userName;

  factory CredentialResponseDto.fromJson(Map<String, dynamic> json) => CredentialResponseDto(
    accountCategory: json["accountCategory"],
    accountName: json["accountName"],
    credentialId: json["credentialId"],
    pin: json["pin"],
    primaryPassword: json["primaryPassword"],
    recoveryEmail: json["recoveryEmail"],
    secondaryPassword: json["secondaryPassword"],
    userName: json["userName"],
  );

  Map<String, dynamic> toJson() => {
    "accountCategory": accountCategory,
    "accountName": accountName,
    "credentialId": credentialId,
    "pin": pin,
    "primaryPassword": primaryPassword,
    "recoveryEmail": recoveryEmail,
    "secondaryPassword": secondaryPassword,
    "userName": userName,
  };
}
