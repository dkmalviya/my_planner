const String baseUrlAuthServer="http://192.168.24.155:9090/authorizationserver/";
const String baseUrlResourceServer="http://192.168.24.155:8080/";
const String loginApi = baseUrlAuthServer + "login";
const String userDetails = baseUrlResourceServer + "api/user/getUserProfile";
const String validateTokenApi = baseUrlResourceServer + "API=Get_UserStatus_V1";
const String forgotPasswordApi = baseUrlResourceServer + "API=Get_UserStatus_V1";
const String newPasswordApi = baseUrlResourceServer + "API=Get_UserStatus_V1";
const String registerApi = baseUrlResourceServer + "api/public/account/registration";
