// To parse this JSON data, do
//
//     final getUserDetails = getUserDetailsFromJson(jsonString);

import 'dart:convert';

GetUserDetails getUserDetailsFromJson(String str) => GetUserDetails.fromJson(json.decode(str));

String getUserDetailsToJson(GetUserDetails data) => json.encode(data.toJson());

class GetUserDetails {
  GetUserDetails({
    required this.activeProfile,
    required this.dateOfBirth,
    required this.email,
    required  this.firstName,
    required this.gender,
    required  this.imageUrl,
    required  this.lastName,
    required  this.maritalStatus,
    required  this.middleName,
    required  this.mobile,
    required  this.notificationEnable,
   required  this.profileStatus,
  });

  bool activeProfile;
  String dateOfBirth;
  String email;
  String firstName;
  String gender;
  String imageUrl;
  String lastName;
  String maritalStatus;
  String middleName;
  String mobile;
  bool notificationEnable;
  String profileStatus;

  factory GetUserDetails.fromJson(Map<String, dynamic> json) => GetUserDetails(
    activeProfile: json["activeProfile"],
    dateOfBirth: json["dateOfBirth"],
    email: json["email"],
    firstName: json["firstName"],
    gender: json["gender"],
    imageUrl: json["imageUrl"],
    lastName: json["lastName"],
    maritalStatus: json["maritalStatus"],
    middleName: json["middleName"],
    mobile: json["mobile"],
    notificationEnable: json["notificationEnable"],
    profileStatus: json["profileStatus"],
  );

  Map<String, dynamic> toJson() => {
    "activeProfile": activeProfile,
    "dateOfBirth": dateOfBirth,
    "email": email,
    "firstName": firstName,
    "gender": gender,
    "imageUrl": imageUrl,
    "lastName": lastName,
    "maritalStatus": maritalStatus,
    "middleName": middleName,
    "mobile": mobile,
    "notificationEnable": notificationEnable,
    "profileStatus": profileStatus,
  };
}
