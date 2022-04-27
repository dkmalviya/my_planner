
class CreateProfileRequestDto {


  final String dateOfBirth;
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String maritalStatus;
  final String mobile;


  CreateProfileRequestDto(this.dateOfBirth, this.firstName, this.middleName,
      this.lastName, this.gender, this.maritalStatus, this.mobile);

  CreateProfileRequestDto.fromJsonMap(Map<String, dynamic> map):
        dateOfBirth = map["dateOfBirth"],
        firstName = map["firstName"],
        middleName = map["middleName"],
        lastName = map["lastName"],
        gender = map["gender"],
        maritalStatus = map["maritalStatus"],
        mobile = map["mobile"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dateOfBirth'] = dateOfBirth;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['maritalStatus'] = maritalStatus;
    data['mobile'] = mobile;
    return data;
  }

  @override
  String toString() {
    return 'CreateProfileRequestDto{dateOfBirth: $dateOfBirth, firstName: $firstName, middleName: $middleName, lastName: $lastName, gender: $gender, maritalStatus: $maritalStatus, mobile: $mobile}';
  }
}
