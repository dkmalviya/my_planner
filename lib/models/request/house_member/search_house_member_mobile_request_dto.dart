class SearchHouseMemberByMobileRequestDto {
  final String houseMemberMobileNumber;

  SearchHouseMemberByMobileRequestDto(
      this.houseMemberMobileNumber,
      );

  SearchHouseMemberByMobileRequestDto.fromJsonMap(Map<String, dynamic> map)
      : houseMemberMobileNumber = map["houseMemberMobileNumber"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['houseMemberMobileNumber'] = houseMemberMobileNumber;
    return data;
  }
}
