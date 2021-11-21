class UserInfo {
  int userId = 0;
  String userName = "NA";
  String mobileNumber = "NA";
  String email = "NA";
  String password = "NA";
  String profileStatus = "NA";

  UserInfo();

  factory UserInfo.fromJson(dynamic json) {
    var u = UserInfo();
    u.userId = json['userId'];
    u.userName = json['userName'];
    u.mobileNumber = json['mobileNumber'];
    u.email = json['email'];
    u.password = json['password'];
    u.profileStatus = json['profileStatus'];
    return u;
  }

  Map toJson() => {
        'userId': userId,
        'userName': userName,
        'mobileNumber': mobileNumber,
        'email': email,
        'password': password,
        'profileStatus': profileStatus,
      };

  @override
  String toString() {
    return 'UserInfo{userId: $userId, userName: $userName, mobileNumber: $mobileNumber, email: $email, password: $password, profileStatus: $profileStatus}';
  }
}
