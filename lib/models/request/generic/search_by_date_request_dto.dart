class SearchByDateRequestDto {
  final String searchDate;

  SearchByDateRequestDto(
    this.searchDate,
  );

  SearchByDateRequestDto.fromJsonMap(Map<String, dynamic> map)
      : searchDate = map["searchDate"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchDate'] = searchDate;
    return data;
  }

  @override
  String toString() {
    return 'SearchByDateRequestDto{searchDate: $searchDate}';
  }
}
