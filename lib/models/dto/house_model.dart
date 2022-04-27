class HouseModel{
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

  HouseModel(
      this.addressId,
      this.area,
      this.buildingName,
      this.city,
      this.houseName,
      this.houseNumber,
      this.landmark,
      this.pinCode,
      this.societyName,
      this.street);

  @override
  String toString() {
    return '$societyName, $street, $area, $city-$pinCode $street.\nlandmark: $landmark';
  }
}