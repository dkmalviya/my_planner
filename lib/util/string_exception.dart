class StringException implements Exception {
  String errorMessage(){
    return error;
  }

  String error = "";

  StringException(this.error);

  @override
  String toString() {
    // TODO: implement toString
    return error;
  }
}