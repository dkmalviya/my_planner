// To parse this JSON data, do
//
//     final activeHouseMemberResponseDto = activeHouseMemberResponseDtoFromJson(jsonString);

import 'dart:convert';

ActiveHouseMemberResponseDto activeHouseMemberResponseDtoFromJson(String str) =>
    ActiveHouseMemberResponseDto.fromJson(json.decode(str));

String activeHouseMemberResponseDtoToJson(ActiveHouseMemberResponseDto data) =>
    json.encode(data.toJson());

class ActiveHouseMemberResponseDto {
  ActiveHouseMemberResponseDto({
    required this.houseResponse,
    required this.userProfiles,
  });

  HouseResponse houseResponse;
  List<UserProfile> userProfiles;

  factory ActiveHouseMemberResponseDto.fromJson(Map<String, dynamic> json) =>
      ActiveHouseMemberResponseDto(
        houseResponse: HouseResponse.fromJson(json["houseResponse"]),
        userProfiles: List<UserProfile>.from(
            json["userProfiles"].map((x) => UserProfile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "houseResponse": houseResponse.toJson(),
        "userProfiles": List<dynamic>.from(userProfiles.map((x) => x.toJson())),
      };
}

class HouseResponse {
  HouseResponse({
    required this.addressId,
    required this.area,
    required this.buildingName,
    required this.city,
    required this.houseName,
    required this.houseNumber,
    required this.landmark,
    required this.pinCode,
    required this.street,

  });

  int addressId;
  String area;
  String buildingName;
  String city;

  String houseName;
  String houseNumber;
  String landmark;
  String pinCode;
  String street;


  factory HouseResponse.fromJson(Map<String, dynamic> json) => HouseResponse(
        addressId: json["addressId"],
        area: json["area"],
        buildingName: json["buildingName"],
        city: json["city"],
        houseName: json["houseName"],
        houseNumber: json["houseNumber"],
        landmark: json["landmark"],
        pinCode: json["pinCode"],
        street: json["street"],

      );

  Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "area": area,
        "buildingName": buildingName,
        "city": city,
        "houseName": houseName,
        "houseNumber": houseNumber,
        "landmark": landmark,
        "pinCode": pinCode,
        "street": street,

      };
}

class UserProfile {
  UserProfile({
    required this.activeMember,
    required this.activeProfile,
    required this.adminOfHouse,
    required this.email,
    required this.endDate,
    required this.firstName,
    required this.gender,
    required this.imageUrl,
    required this.lastName,
    required this.maritalStatus,
    required this.memberId,
    required this.middleName,
    required this.mobile,
    required this.profileStatus,
    required this.startDate,
  });

  bool activeMember;
  bool activeProfile;
  bool adminOfHouse;
  String email;
  String endDate;
  String firstName;
  String gender;
  String imageUrl;
  String lastName;
  String maritalStatus;
  int memberId;
  String middleName;
  String mobile;
  String profileStatus;
  String startDate;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        activeMember: json["activeMember"],
        activeProfile: json["activeProfile"],
        adminOfHouse: json["adminOfHouse"],
        email: json["email"],
        endDate: json["endDate"],
        firstName: json["firstName"],
        gender: json["gender"],
        imageUrl: json["imageUrl"],
        lastName: json["lastName"],
        maritalStatus: json["maritalStatus"],
        memberId: json["memberId"],
        middleName: json["middleName"],
        mobile: json["mobile"],
        profileStatus: json["profileStatus"],
        startDate: json["startDate"],
      );

  Map<String, dynamic> toJson() => {
        "activeMember": activeMember,
        "activeProfile": activeProfile,
        "adminOfHouse": adminOfHouse,
        "email": email,
        "endDate": endDate,
        "firstName": firstName,
        "gender": gender,
        "imageUrl": imageUrl,
        "lastName": lastName,
        "maritalStatus": maritalStatus,
        "memberId": memberId,
        "middleName": middleName,
        "mobile": mobile,
        "profileStatus": profileStatus,
        "startDate": startDate,
      };
}
