
class CredentialRequestDto {

  String accountCategory;
  String accountName;
  int credentialId;
  String pin;
  String primaryPassword;
  String recoveryEmail;
  String secondaryPassword;
  String userName;

	CredentialRequestDto.fromJsonMap(Map<String, dynamic> map): 
		accountCategory = map["accountCategory"],
		accountName = map["accountName"],
		credentialId = map["credentialId"],
		pin = map["pin"],
		primaryPassword = map["primaryPassword"],
		recoveryEmail = map["recoveryEmail"],
		secondaryPassword = map["secondaryPassword"],
		userName = map["userName"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['accountCategory'] = accountCategory;
		data['accountName'] = accountName;
		data['credentialId'] = credentialId;
		data['pin'] = pin;
		data['primaryPassword'] = primaryPassword;
		data['recoveryEmail'] = recoveryEmail;
		data['secondaryPassword'] = secondaryPassword;
		data['userName'] = userName;
		return data;
	}
}
