
class ForgotPasswordRequestDto {


  final String email;


  ForgotPasswordRequestDto(this.email );

  ForgotPasswordRequestDto.fromJsonMap(Map<String, dynamic> map):
        email = map["email"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
