
class ValidateTokenRequestDto {


  final String token;


  ValidateTokenRequestDto(this.token );

  ValidateTokenRequestDto.fromJsonMap(Map<String, dynamic> map):
        token = map["token"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
