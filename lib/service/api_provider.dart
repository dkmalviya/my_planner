import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_planner/constant/api_constants.dart';
import 'package:my_planner/models/response/login_succes_response_dto.dart';
import 'package:my_planner/util/string_exception.dart';

class ApiProvider {
  Client client = Client();

  String noInternetConnectionText = "Please check your internet connection";
  String expiredToken = "Session Expired";

//const String USER_ID_KEY_TEXT = "UserId";
//const String IMEI_NO_KEY_TEXT = "IMEINo";
//const String IP_ADDRESS_KEY_TEXT = "IPAddress";
//const String OS_KEY_TEXT = "OS";
//const String AUTH_TOKEN_KEY_TEXT = "AuthToken";
//const String OCP_APIM_SUBSCRIPTION_KEY_TEXT = "Ocp-Apim-Subscription-Key";
//const String CONTENT_TYPE_TEXT = "Content-Type";
//const String HANDSET_MODEL_KEY_TEXT = "HandsetModel";
//Todo Header changes for PROD

  /*Map<String, String> preLoginHeaders = {
    CONTENT_TYPE_TEXT: MyApp.headers.contentType,
    IP_ADDRESS_KEY_TEXT: MyApp.headers.ipAddress,
    IMEI_NO_KEY_TEXT: MyApp.headers.imeiNumber,
    OS_KEY_TEXT: MyApp.headers.os
  };
*/
//
//  bool isApiIsAvailableForEncryption(String apiName){
//    bool isEncryptionRequired=false;
//    for(API api in MyApp.configDetails.apis){
//      if(api.apiMethod==apiName){
//        isEncryptionRequired=true;
//      }
//      else{
//        isEncryptionRequired=false;
//      }
//    }
//    return isEncryptionRequired;
//  }

  Future<LoginSuccessResponseDto> login(
      String userName, String password) async {

    var str = "Mobile:test";
    var bytes = utf8.encode(str);
    var base64 = base64Encode(bytes);
    print(base64);
    var uri = Uri.parse(loginApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization":"Basic "+ base64
      },
      body: {
        "username": userName,
        "password": password,
        "scope": "read write",
        "grant_type": "password",
        "client_id": "Mobile"
      },
    );

    print(response.statusCode.toString());

    if (response.statusCode == 200) {

      print("response" + response.body);
      var loginResponseDto = loginSuccessResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return loginResponseDto;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Credentials');
    }
    else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }
/*
  Future<GenerateOTPResponseDto> sendOTP(
      GenerateOTPRequestDto generateOTPRequestDto) async {
    bool isConnected = await isNetworkConnected();
    if (!isConnected) throw StringException(noInternetConnectionText);

    Response response = await client.post(SEND_OTP,
        headers: MyApp.headers.getPreloginHeaders(),
        body: jsonEncode(generateOTPRequestDto.toJson()));

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return GenerateOTPResponseDto.fromJsonMap(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Failed to generate OTP');
    }
  }*/

}
