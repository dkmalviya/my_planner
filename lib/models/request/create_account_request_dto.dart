
class CreateAccountRequestDto {


  final String email;
  final String password;
  final String passwordRepeat;


	CreateAccountRequestDto(this.email, this.password, this.passwordRepeat);

  CreateAccountRequestDto.fromJsonMap(Map<String, dynamic> map):
				email = map["email"],
				password = map["password"],
				passwordRepeat = map["passwordRepeat"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['email'] = email;
		data['password'] = password;
		data['passwordRepeat'] = passwordRepeat;
		return data;
	}
}
