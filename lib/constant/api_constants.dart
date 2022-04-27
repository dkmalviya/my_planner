const String baseUrlAuthServer="http://192.168.24.155:9090/authorizationserver/";
const String baseUrlResourceServer="http://192.168.24.155:8080/";
const String loginApi = baseUrlAuthServer + "login";
const String userDetailsApi = baseUrlResourceServer + "api/user/getUserProfile";
const String validateTokenApi = baseUrlResourceServer + "api/public/account/registration/validate";
const String updateNewProfileApi = baseUrlResourceServer + "api/user/newUserProfile";
const String updateProfileApi = baseUrlResourceServer + "api/user/updateProfile";
const String registerApi = baseUrlResourceServer + "api/public/account/registration";
const String forgotPasswordApi = baseUrlResourceServer + "API=Get_UserStatus_V1";
const String newPasswordApi = baseUrlResourceServer + "API=Get_UserStatus_V1";
const String searchHouseApi = baseUrlResourceServer + "api/house/searchHouse";
const String searchHouseByMemberMobileApi = baseUrlResourceServer + "api/house/member/searchHouseByMembersMobileNumber";
const String addHouseMemberApi = baseUrlResourceServer + "api/house/member/addMember";
const String addHouseAddressApi = baseUrlResourceServer + "api/public/addHouse";


//income

const String getAllIncomeCategoryApi = baseUrlResourceServer + "api/income/incomeSource/getAllIncomeSource";
const String addIncomeApi = baseUrlResourceServer + "api/income/addIncome";

const String getAllExpenseCategoryApi = baseUrlResourceServer + "api/expense/expenseCategory/getAllExpenseCategory";
const String getAllExpenseSubCategoryApi = baseUrlResourceServer + "api/expense/expenseCategory/getAllExpenseSubCategory";
const String addExpenseApi = baseUrlResourceServer + "api/expense/addExpense";
const String getAllMyExpenseApi = baseUrlResourceServer + "api/expense/getAllExpense";

