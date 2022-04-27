class MemberModel {
  int memberId;
  String houseMemberName;
  int age;
  String gender;
  String memberType;
  String relation;
  String profilePictureUrl;
  bool isActive;
  String mobile;
  String email;
  String createdOn;

  MemberModel(
      this.memberId,
      this.houseMemberName,
      this.age,
      this.gender,
      this.memberType,
      this.relation,
      this.profilePictureUrl,
      this.isActive,
      this.mobile,
      this.email,
      this.createdOn);

  @override
  String toString() {
    return 'HouseMemberModel{memberId: $memberId, houseMemberName: $houseMemberName, age: $age, gender: $gender, memberType: $memberType, relation: $relation, profilePictureUrl: $profilePictureUrl, isActive: $isActive, mobile: $mobile, email: $email, createdOn: $createdOn}';
  }
}
