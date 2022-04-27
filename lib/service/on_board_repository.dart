
import 'package:flutter/cupertino.dart';
import 'package:my_planner/models/request/expense/add_expense_request_dto.dart';
import 'package:my_planner/models/request/generic/search_by_date_request_dto.dart';
import 'package:my_planner/models/request/house/create_house_request_dto.dart';
import 'package:my_planner/models/request/house/search_house_request_dto.dart';
import 'package:my_planner/models/request/house_member/add_house_member_request_dto.dart';
import 'package:my_planner/models/request/house_member/search_house_member_mobile_request_dto.dart';
import 'package:my_planner/models/request/income/add_income_request_dto.dart';
import 'package:my_planner/models/request/user/create_account_request_dto.dart';
import 'package:my_planner/models/request/user/create_profile_request_dto.dart';
import 'package:my_planner/models/request/user/validate_token_request_dto.dart';
import 'package:my_planner/models/response/expense/expense_category_response_dto.dart';
import 'package:my_planner/models/response/expense/expense_response_dto.dart';
import 'package:my_planner/models/response/expense/expense_sub_category_response_dto.dart';
import 'package:my_planner/models/response/generic/generic_response_dto.dart';
import 'package:my_planner/models/response/house/house_response_dto.dart';
import 'package:my_planner/models/response/house/search_house_response_dto.dart';
import 'package:my_planner/models/response/house_member/active_house_member_response_dto.dart';
import 'package:my_planner/models/response/income/add_income_response_dto.dart';
import 'package:my_planner/models/response/income/income_source_response_dto.dart';
import 'package:my_planner/models/response/login/get_user_details_response_dto.dart';
import 'package:my_planner/models/response/login/login_succes_response_dto.dart';
import 'package:my_planner/models/response/user/user_profile_response_dto.dart';
import 'package:my_planner/service/api_provider.dart';

class OnBoardRepository{

  final apiProvider = ApiProvider();
  Future<LoginSuccessResponseDto> login(String userName,String password)=>apiProvider.login(userName, password);
  Future<GetUserDetails> getUserDetails(String authToken)=>apiProvider.getUserDetails(authToken);
  Future<GenericResponseDto> createAccount(CreateAccountRequestDto createAccountRequestDto)=>apiProvider.createAccount(createAccountRequestDto);
  Future<GenericResponseDto> validateEmailToken(ValidateTokenRequestDto validateTokenRequestDto)=>apiProvider.validateEmailToken(validateTokenRequestDto);
  Future<UserProfileResponseDto> updateProfile(CreateProfileRequestDto createProfileRequestDto,bool isNew)=>apiProvider.updateProfile(createProfileRequestDto,isNew);
  Future<List<SearchHouseResponseDto>> searchHouse(SearchHouseRequestDto searchHouseRequestDto)=>apiProvider.searchHouse(searchHouseRequestDto);
  Future<ActiveHouseMemberResponseDto> searchHouseByMemberMobileNumber(SearchHouseMemberByMobileRequestDto searchHouseMemberByMobileRequestDto)=>apiProvider.searchHouseByMemberMobileNumber(searchHouseMemberByMobileRequestDto);
  Future<GenericResponseDto> addHouseMember(AddHouseMemberRequestDto addHouseMemberRequestDto)=>apiProvider.addHouseMember(addHouseMemberRequestDto);
  Future<HouseResponseDto> addHouseAddress(CreateHouseRequestDto createHouseRequestDto)=>apiProvider.addHouseAddress(createHouseRequestDto);


  //income Methods

  Future<List<IncomeSourceResponseDto>> getAllIncomeCategory()=>apiProvider.getAllIncomeCategory();
  Future<AddIncomeResponseDto> addIncome(AddIncomeRequestDto addIncomeRequestDto)=>apiProvider.addIncome(addIncomeRequestDto);
  Future<ExpenseSubCategoryResponseDto> getAllExpenseSubCategory(int expenseCategoryId)=>apiProvider.getAllExpenseSubCategory(expenseCategoryId);
  Future<List<ExpenseCategoryResponseDto>> getAllExpenseCategory()=>apiProvider.getAllExpenseCategory();
  Future<ExpenseResponseDto> addExpense(AddExpenseRequestDto addExpenseRequestDto)=>apiProvider.addExpense(addExpenseRequestDto);
  Future<List<ExpenseResponseDto>> getMyExpenses(SearchByDateRequestDto searchByDateRequestDto)=>apiProvider.getMyExpenses(searchByDateRequestDto);



}