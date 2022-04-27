import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_planner/constant/api_constants.dart';
import 'package:my_planner/main.dart';
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

  Future<GetUserDetails> getUserDetails(String authToken) async {
    var uri = Uri.parse(userDetailsApi);

    Response response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer " + authToken
    });

    if (response.statusCode == 200) {
      print(response.body);
      var userDetails = getUserDetailsFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return userDetails;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('An account already exists with this email');
    } else if (response.statusCode == 401) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Please try after some time');
    }
  }

  Future<GenericResponseDto> validateEmailToken(
      ValidateTokenRequestDto validateTokenRequestDto) async {
    var uri = Uri.parse(validateTokenApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Basic " + authorizationBase64EncodeString()
      },
      body: jsonEncode(validateTokenRequestDto.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.body);
      var genericResponse = genericResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return genericResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<UserProfileResponseDto> updateProfile(
      CreateProfileRequestDto createProfileRequestDto, bool isNew) async {
    Uri uri;
    if (isNew) {
      uri = Uri.parse(updateNewProfileApi);
    } else {
      uri = Uri.parse(updateProfileApi);
    }

    print(MyApp.userInfo.authToken);
    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + MyApp.userInfo.authToken
      },
      body: jsonEncode(createProfileRequestDto.toJson()),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      var userProfileResponse = userProfileResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return userProfileResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Unable to update profile');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<List<SearchHouseResponseDto>> searchHouse(
      SearchHouseRequestDto searchHouseRequestDto) async {
    Uri uri = Uri.parse(searchHouseApi);

    print(MyApp.userInfo.authToken);
    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + MyApp.userInfo.authToken
      },
      body: jsonEncode(searchHouseRequestDto.toJson()),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      var searchHouseList = searchHouseResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return searchHouseList;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Unable to search house');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<ActiveHouseMemberResponseDto> searchHouseByMemberMobileNumber(
      SearchHouseMemberByMobileRequestDto
          searchHouseMemberByMobileRequestDto) async {
    Uri uri = Uri.parse(searchHouseByMemberMobileApi);

    print(MyApp.userInfo.authToken);
    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + MyApp.userInfo.authToken
      },
      body: jsonEncode(searchHouseMemberByMobileRequestDto.toJson()),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      var searchMember = activeHouseMemberResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return searchMember;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('No House available');
    } else if (response.statusCode == 404) {
      // If that call was not successful, throw an error.
      throw StringException('No House available');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<GenericResponseDto> addHouseMember(
      AddHouseMemberRequestDto addHouseMemberRequestDto) async {
    var uri = Uri.parse(addHouseMemberApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + MyApp.userInfo.authToken
      },
      body: jsonEncode(addHouseMemberRequestDto.toJson()),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      var genericResponse = genericResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return genericResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<HouseResponseDto> addHouseAddress(
      CreateHouseRequestDto createHouseRequestDto) async {
    var uri = Uri.parse(addHouseAddressApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + MyApp.userInfo.authToken
      },
      body: jsonEncode(createHouseRequestDto.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      var houseResponse = houseResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return houseResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<List<IncomeSourceResponseDto>> getAllIncomeCategory() async {
    var uri = Uri.parse(getAllIncomeCategoryApi);

    Response response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer " + MyApp.userInfo.authToken
    });

    if (response.statusCode == 200) {
      print(response.body);
      var incomeCategory = incomeSourceResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return incomeCategory;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('No Income category found');
    } else if (response.statusCode == 401) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Please try after some time');
    }
  }

  Future<AddIncomeResponseDto> addIncome(
      AddIncomeRequestDto addIncomeRequestDto) async {
    var uri = Uri.parse(addIncomeApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + MyApp.userInfo.authToken
      },
      body: jsonEncode(addIncomeRequestDto.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      var addIncomeResponse = addIncomeResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return addIncomeResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<List<ExpenseCategoryResponseDto>> getAllExpenseCategory() async {
    var uri = Uri.parse(getAllExpenseCategoryApi);

    Response response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer " + MyApp.userInfo.authToken
    });
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      var expenseCategory = expenseCategoryResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return expenseCategory;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('No Expense category found');
    } else if (response.statusCode == 401) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Please try after some time');
    }
  }

  Future<ExpenseSubCategoryResponseDto> getAllExpenseSubCategory(
      int expenseCategoryId) async {
    var uri = Uri.parse(getAllExpenseSubCategoryApi + "/$expenseCategoryId");

    Response response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer " + MyApp.userInfo.authToken
    });

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      var expenseSubCategory =
          expenseSubCategoryResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return expenseSubCategory;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('No Expense category found');
    } else if (response.statusCode == 401) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Please try after some time');
    }
  }


  Future<ExpenseResponseDto> addExpense(
      AddExpenseRequestDto addExpenseRequestDto) async {
    var uri = Uri.parse(addExpenseApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + MyApp.userInfo.authToken
      },
      body: jsonEncode(addExpenseRequestDto.toJson()),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      var addExpenseResponse = expenseResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return addExpenseResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }

  Future<List<ExpenseResponseDto>> getMyExpenses(SearchByDateRequestDto searchByDateRequestDto) async {
    var uri = Uri.parse(getAllMyExpenseApi);

    Response response = await client.post(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer " + MyApp.userInfo.authToken
    },
      body: jsonEncode(searchByDateRequestDto.toJson()),
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);
      var expenses = expenseResponseDtoListFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return expenses;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('No Expense found');
    } else if (response.statusCode == 401) {
      // If that call was not successful, throw an error.
      throw StringException('Invalid Token');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Please try after some time');
    }
  }
/*Future<UserProfileResponseDto> updateProfile(
      CreateProfileRequestDto createProfileRequestDto) async {
    var uri = Uri.parse(validateTokenApi);

    Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "bearer " + authorizationBase64EncodeString()
      },
      body: jsonEncode(createProfileRequestDto.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.body);
      var userProfileResponse = userProfileResponseDtoFromJson(response.body);
      // If the call to the server was successful, parse the JSON
      return userProfileResponse;
    } else if (response.statusCode == 400) {
      // If that call was not successful, throw an error.
      throw StringException('Unable to update profile');
    } else {
      // If that call was not successful, throw an error.
      throw StringException('Unknown Error');
    }
  }*/
}
