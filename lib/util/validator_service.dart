bool isEmptyField(String value) {
  if (value.isEmpty) {
    return true;
  }
  return false;
}

bool isNotEmptyField(String value) {
  if (value.isEmpty) {
    return false;
  }
  return true;
}

bool isValidLength(String value,int validLength){
  if (value.length>=validLength) {
    return true;
  }
  return false;
}

bool validatePhoneNumber(String value) {
  int len = value.length;

  if (len != 10) {
    return false;
  }
  return true;
}

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool validatePassword(String value) {
  return true;
  String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return false; //"Minimum eight characters, at least one letter and one number";
  }
  return true;
}

bool validateName(String value) {
  String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}


