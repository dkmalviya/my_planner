
import 'package:flutter/cupertino.dart';
import 'package:my_planner/models/request/user/create_account_request_dto.dart';
import 'package:my_planner/models/response/generic/generic_response_dto.dart';
import 'package:my_planner/models/response/house_member/active_house_member_response_dto.dart';
import 'package:my_planner/models/response/login/get_user_details_response_dto.dart';
import 'package:my_planner/models/response/login/login_succes_response_dto.dart';
import 'package:my_planner/service/api_provider.dart';

class OnBoardRepository{

  final apiProvider = ApiProvider();
  Future<LoginSuccessResponseDto> login(String userName,String password)=>apiProvider.login(userName, password);
  Future<GetUserDetails> getUserDetails(String authToken)=>apiProvider.getUserDetails(authToken);
  Future<GenericResponseDto> createAccount(CreateAccountRequestDto createAccountRequestDto)=>apiProvider.createAccount(createAccountRequestDto);



}