class AddHouseMemberRequestDto {
  final int addressId;
  final String startDate;
  final String endDate;


  AddHouseMemberRequestDto(this.addressId, this.startDate, this.endDate);

  AddHouseMemberRequestDto.fromJsonMap(Map<String, dynamic> map)
      : addressId = map["addressId"],
        startDate = map["startDate"],
        endDate = map["endDate"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressId'] = addressId;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    return data;
  }


}
