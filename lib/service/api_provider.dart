import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_planner/constant/api_constants.dart';
import 'package:my_planner/models/request/create_account_request_dto.dart';
import 'package:my_planner/models/response/generic/generic_response_dto.dart';
import 'package:my_planner/models/response/login_succes_response_dto.dart';
import 'package:my_planner/util/string_exception.dart';

class ApiProvider {
  Client client = Client();

  String noInternetConnectionText = "Please check your internet connection";
  String expiredToken = "Session Expired";

  String authorizationBase64EncodeString() {
    var str = "Mobile:test";
    var bytes = utf8.encode(str);
    var base64 = base64Encode(bytes);
    print(base64);

    return base64;
  }

  Future<LoginSuccessResponseDto> login(
      String userName, String password) async {
    var uri = Uri.parse(loginApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Basic " + authorizationBase64EncodeString()
      },
      body: {
        "username": userName,
        "password": password,
        "scope": "read write",
        "grant_type": "password",
        "client_id": "Mobile"
      },
    );

    if (response.statusCode == 200) {
      var loginResponseDto = loginSuccessResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return loginResponseDto;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Credentials');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<GenericResponseDto> createAccount(
   CreateAccountRequestDto createAccountRequestDto) async {
    var uri = Uri.parse(registerApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic " + authorizationBase64EncodeString()
      },
      body: jsonEncode(createAccountRequestDto.toJson()),
    );

    if (response.statusCode == 200) {

      print(response.body);
      var genericResponse = genericResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return genericResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('An account already exists with this email');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }




}
