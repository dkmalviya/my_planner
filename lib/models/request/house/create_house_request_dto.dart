class CreateHouseRequestDto {
  final String area;
  final String buildingName;
  final String houseName;
  final String houseNumber;
  final String landmark;
  final String pinCode;
  final String city;
  final String societyName;
  final String street;

  CreateHouseRequestDto(
      this.area,
      this.buildingName,
      this.houseName,
      this.houseNumber,
      this.landmark,
      this.pinCode,
      this.street,
      this.societyName,
      this.city);

  CreateHouseRequestDto.fromJsonMap(Map<String, dynamic> map)
      : area = map["area"],
        buildingName = map["buildingName"],
        houseNumber = map["houseNumber"],
        houseName = map["houseName"],
        landmark = map["landmark"],
        pinCode = map["pinCode"],
        street = map["street"],
        city = map["city"],
        societyName = map["societyName"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['area'] = area;
    data['buildingName'] = buildingName;
    data['houseNumber'] = houseNumber;
    data['houseName'] = houseName;
    data['landmark'] = landmark;
    data['pinCode'] = pinCode;
    data['street'] = street;
    data['city'] = city;
    data['societyName'] = societyName;
    return data;
  }

  @override
  String toString() {
    return 'CreateHouseRequestDto{area: $area, buildingName: $buildingName, houseName: $houseName, houseNumber: $houseNumber, landmark: $landmark, pinCode: $pinCode, city: $city, societyName: $societyName, street: $street}';
  }
}
