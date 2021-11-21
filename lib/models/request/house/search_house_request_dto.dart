class SearchHouseRequestDto {
   final String area;
  final String buildingName;
  final String houseNumber;
  final String city;

  SearchHouseRequestDto(
      this.area,
      this.buildingName,
      this.houseNumber,
      this.city,
      );

  SearchHouseRequestDto.fromJsonMap(Map<String, dynamic> map)
      :
        area = map["area"],
        buildingName = map["buildingName"],
        houseNumber = map["houseNumber"],
        city = map["city"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['area'] = area;
    data['buildingName'] = buildingName;
    data['houseNumber'] = houseNumber;
    data['city'] = city;
    return data;
  }
}
