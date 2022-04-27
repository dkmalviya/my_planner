// To parse this JSON data, do
//
//     final houseResponseDto = houseResponseDtoFromJson(jsonString);

import 'dart:convert';

HouseResponseDto houseResponseDtoFromJson(String str) =>
    HouseResponseDto.fromJson(json.decode(str));

String houseResponseDtoToJson(HouseResponseDto data) =>
    json.encode(data.toJson());

class HouseResponseDto {
  HouseResponseDto({
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

  factory HouseResponseDto.fromJson(Map<String, dynamic> json) =>
      HouseResponseDto(
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
