
import 'package:flutter/cupertino.dart';
import 'package:my_planner/models/response/login_succes_response_dto.dart';
import 'package:my_planner/service/api_provider.dart';

class OnBoardRepository{

  final apiProvider = ApiProvider();
  Future<LoginSuccessResponseDto> login(String userName,String password)=>apiProvider.login(userName, password);



}