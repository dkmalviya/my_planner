class SearchHouseRequestDto {
  final String societyName;
  final String pinCode;
  final String houseNumber;

  SearchHouseRequestDto(
      this.societyName,
      this.pinCode,
      this.houseNumber,

      );

  SearchHouseRequestDto.fromJsonMap(Map<String, dynamic> map)
      :
        societyName = map["societyName"],
        pinCode = map["pinCode"],
        houseNumber = map["houseNumber"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['societyName'] = societyName;
    data['pinCode'] = pinCode;
    data['houseNumber'] = houseNumber;
    return data;
  }
}
