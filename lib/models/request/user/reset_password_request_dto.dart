
class ResetPasswordRequestDto {


  final String newPassword;
  final String newPasswordConfirm;
  final String oldPassword;


  ResetPasswordRequestDto(
      this.newPassword, this.newPasswordConfirm, this.oldPassword);

  ResetPasswordRequestDto.fromJsonMap(Map<String, dynamic> map):
        newPassword = map["newPassword"],
        newPasswordConfirm = map["newPasswordConfirm"],
        oldPassword = map["oldPassword"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newPassword'] = newPassword;
    data['newPasswordConfirm'] = newPasswordConfirm;
    data['oldPassword'] = oldPassword;
    return data;
  }
}
