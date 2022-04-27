// To parse this JSON data, do
//
//     final searchHouseResponseDto = searchHouseResponseDtoFromJson(jsonString);

import 'dart:convert';

List<SearchHouseResponseDto> searchHouseResponseDtoFromJson(String str) => List<SearchHouseResponseDto>.from(json.decode(str).map((x) => SearchHouseResponseDto.fromJson(x)));

String searchHouseResponseDtoToJson(List<SearchHouseResponseDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchHouseResponseDto {
  SearchHouseResponseDto({
    required this.addressId,
    required this.area,
    required this.buildingName,
    required this.city,
    required this.houseName,
    required this.houseNumber,
    required this.landmark,
    required this.pinCode,
    required this.societyName,
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
  String societyName;
  String street;


  factory SearchHouseResponseDto.fromJson(Map<String, dynamic> json) => SearchHouseResponseDto(
    addressId: json["addressId"],
    area: json["area"],
    buildingName: json["buildingName"],
    city: json["city"],
    houseName: json["houseName"],
    houseNumber: json["houseNumber"],
    landmark: json["landmark"],
    pinCode: json["pinCode"],
    societyName: json["societyName"],
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
    "societyName": societyName,
    "street": street,
  };
}

