
class ValidateForgotPasswordRequestDto {


  final String newPassword;
  final String newPasswordConfirm;
  final String token;


  ValidateForgotPasswordRequestDto(
      this.newPassword, this.newPasswordConfirm, this.token);

  ValidateForgotPasswordRequestDto.fromJsonMap(Map<String, dynamic> map):
        newPassword = map["newPassword"],
        newPasswordConfirm = map["newPasswordConfirm"],
        token = map["token"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newPassword'] = newPassword;
    data['newPasswordConfirm'] = newPasswordConfirm;
    data['token'] = token;
    return data;
  }
}
