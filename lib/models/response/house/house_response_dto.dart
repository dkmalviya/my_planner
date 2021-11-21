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
    required this.createdOn,
    required this.houseName,
    required this.houseNumber,
    required this.landmark,
    required this.pinCode,
    required this.street,
    required this.updatedOn,
  });

  int addressId;
  String area;
  String buildingName;
  String city;
  String createdOn;
  String houseName;
  String houseNumber;
  String landmark;
  String pinCode;
  String street;
  String updatedOn;

  factory HouseResponseDto.fromJson(Map<String, dynamic> json) =>
      HouseResponseDto(
        addressId: json["addressId"],
        area: json["area"],
        buildingName: json["buildingName"],
        city: json["city"],
        createdOn: json["createdOn"],
        houseName: json["houseName"],
        houseNumber: json["houseNumber"],
        landmark: json["landmark"],
        pinCode: json["pinCode"],
        street: json["street"],
        updatedOn: json["updatedOn"],
      );

  Map<String, dynamic> toJson() => {
        "addressId": addressId,
        "area": area,
        "buildingName": buildingName,
        "city": city,
        "createdOn": createdOn,
        "houseName": houseName,
        "houseNumber": houseNumber,
        "landmark": landmark,
        "pinCode": pinCode,
        "street": street,
        "updatedOn": updatedOn,
      };
}
