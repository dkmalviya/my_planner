class UserInfo {
  int userId = 2;
  String authToken="NA";
  String refreshToken="NA";
  String userName = "NA";
  String mobileNumber = "NA";
  String email = "NA";
  String firstName = "NA";
  String lastName = "NA";
  String gender = "NA";
  String maritalStatus = "NA";
  bool notificationEnable = false;
  String profileStatus = "NA";

  UserInfo();

  factory UserInfo.fromJson(dynamic json) {
    var u = UserInfo();
    u.userId = json['userId'];
    u.userName = json['userName'];
    u.mobileNumber = json['mobileNumber'];
    u.email = json['email'];
    u.profileStatus = json['profileStatus'];
    u.firstName = json['firstName'];
    u.lastName = json['lastName'];
    u.gender = json['gender'];
    u.maritalStatus = json['maritalStatus'];
    u.notificationEnable=json['notificationEnable'];
    u.authToken=json['authToken'];
    u.refreshToken=json['refreshToken'];
    return u;
  }

  Map toJson() => {
        'userId': userId,
        'userName': userName,
        'mobileNumber': mobileNumber,
        'email': email,
        'profileStatus': profileStatus,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'maritalStatus': maritalStatus,
        'notificationEnable': notificationEnable,
        'authToken': authToken,
        'refreshToken': refreshToken,
      };

  @override
  String toString() {
    return 'UserInfo{userId: $userId, authToken: $authToken, refreshToken: $refreshToken, userName: $userName, mobileNumber: $mobileNumber, email: $email, firstName: $firstName, lastName: $lastName, gender: $gender, maritalStatus: $maritalStatus, notificationEnable: $notificationEnable, profileStatus: $profileStatus}';
  }
}
