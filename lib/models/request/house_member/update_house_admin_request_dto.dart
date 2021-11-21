class UpdateHouseAdminRequestDto {
  final int memberId;
  final String status;

  UpdateHouseAdminRequestDto(
    this.memberId,
    this.status,
  );

  UpdateHouseAdminRequestDto.fromJsonMap(Map<String, dynamic> map)
      : memberId = map["memberId"],
        status = map["status"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['status'] = status;
    return data;
  }
}
