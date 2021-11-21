class CreateHouseRequestDto {
  final String addressId;
  final String area;
  final String buildingName;
  final String houseName;
  final String houseNumber;
  final String landmark;
  final String pinCode;
  final String street;

  CreateHouseRequestDto(
      this.addressId,
      this.area,
      this.buildingName,
      this.houseName,
      this.houseNumber,
      this.landmark,
      this.pinCode,
      this.street);

  CreateHouseRequestDto.fromJsonMap(Map<String, dynamic> map)
      : addressId = map["addressId"],
        area = map["area"],
        buildingName = map["buildingName"],
        houseNumber = map["houseNumber"],
        houseName = map["houseName"],
        landmark = map["landmark"],
        pinCode = map["pinCode"],
        street = map["street"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressId'] = addressId;
    data['area'] = area;
    data['buildingName'] = buildingName;
    data['houseNumber'] = houseNumber;
    data['houseName'] = houseName;
    data['landmark'] = landmark;
    data['pinCode'] = pinCode;
    data['street'] = street;
    return data;
  }
}
