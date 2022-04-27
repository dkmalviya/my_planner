import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/string_constant.dart';
import 'package:my_planner/main.dart';
import 'package:my_planner/models/response/login/get_user_details_response_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/util/house_db.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/util/utils.dart';
import 'package:my_planner/util/validator_service.dart';
import 'package:my_planner/widget/progress_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();


  @override
  initState() {
    // TODO: implement initState
    super.initState();
    setInitialValue();
  }


  setInitialValue(){


    textEditingControllerEmail.text="deepeshmalviya@outlook.com";
    textEditingControllerPassword.text="abc123";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: hexToColor("#F5F5F5"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 120,
              height: 120,
              child: Image(
                image: AssetImage("assets/images/app_logo.png"),
              ),
            ),
            const FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Welcome to',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'NovaSquare',
                    color: Constants.purpleMedium),
              ),
            ),
            const FittedBox(
              fit: BoxFit.fitWidth,
              child: SizedBox(
                height: 40,
                child: Text('Budget Planner',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                        color: Constants.purpleDark)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: Constants.kPadding * 3,
                    horizontal: Constants.kPadding * 2),
                decoration: infoCardDecoration,
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: HouseTheme.appbarTitle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 0),
                        decoration: BoxDecoration(
                            color: Constants.purpleDark,
                            border: Border.all(color: Constants.purpleLight),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            style: HouseTheme.bodyLight,
                            controller: textEditingControllerEmail,
                            decoration: const InputDecoration(
                              hintText: "Enter Email name here",
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Constants.white,
                              ),
                              hintStyle: HouseTheme.bodyLight,
                            ),
                            textAlignVertical: TextAlignVertical.center)),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 0),
                        decoration: BoxDecoration(
                            color: Constants.purpleDark,
                            border: Border.all(color: Constants.purpleLight),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            style: HouseTheme.bodyLight,
                            controller: textEditingControllerPassword,
                            decoration: const InputDecoration(
                              hintText: "Enter password name here",
                              border: InputBorder.none,
                              hintStyle: HouseTheme.bodyLight,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Constants.white,
                              ),
                            ),
                            textAlignVertical: TextAlignVertical.center)),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                      child:  InkWell(
                        child: const Text("Forgot Password?",style: HouseTheme.caption,),
                        onTap: (){
                          //Todo Navigate to forgot password.
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: loginButtonStyle,
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              validateLoginForm();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Constants.purpleDark, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: TextButton(
                            style: transparentButtonStyle,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).pushNamed("/registration");
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Constants.yellow, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  const SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.bottomCenter,
                      child:  InkWell(
                        child: const Text("To validate token please click here!!",style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: 12,
                          letterSpacing: 0.2,
                          color: Constants.yellow),),
                        onTap: (){
                          FocusScope.of(context).unfocus();
                        Navigator.of(context).pushNamed("/validate_token");

                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void loginApiCall() async {
    var userName = textEditingControllerEmail.text;
    var password = textEditingControllerPassword.text;

    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();
      var login = await onBoardRepository.login(userName, password);
      ProgressLoader.hide();

      getUserDetails(login.accessToken);
    } catch (e) {
      ProgressLoader.hide();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox("Failed", e.toString(), "OK", alertIcon, () {
              Navigator.of(context).pop();
            });
          });
    }
  }

  void getUserDetails(String authToken) async {
    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();
      var userDetails = await onBoardRepository.getUserDetails(authToken);
      ProgressLoader.hide();
      saveUserDetails(userDetails,authToken);
    } catch (e) {
      ProgressLoader.hide();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox("Failed", e.toString(), "OK", alertIcon, () {
              Navigator.of(context).pop();
            });
          });
    }
  }

  void validateLoginForm() {
    if (textEditingControllerEmail.text != "" &&
        validateEmail(textEditingControllerEmail.text)) {
      if (textEditingControllerPassword.text != "" &&
          validatePassword(textEditingControllerPassword.text)) {
        loginApiCall();
      } else {
        Fluttertoast.showToast(msg: msgValidPassword);
      }
    } else {
      Fluttertoast.showToast(msg: msgValidEmail);
    }
  }

  Future<void> saveUserDetails(GetUserDetails userDetails, String authToken) async {
    if(userDetails.profileStatus!=accountStatusInActive){
      MyApp.userInfo.mobileNumber = userDetails.mobile;
      MyApp.userInfo.gender = userDetails.gender;
      MyApp.userInfo.firstName = userDetails.firstName;
      MyApp.userInfo.lastName = userDetails.lastName;
      MyApp.userInfo.notificationEnable = userDetails.notificationEnable;
      MyApp.userInfo.maritalStatus = userDetails.maritalStatus;
    }

    MyApp.userInfo.email = userDetails.email;
    MyApp.userInfo.authToken = authToken;
    MyApp.userInfo.refreshToken = authToken;
    MyApp.userInfo.profileStatus = userDetails.profileStatus;
    HouseDB houseDB = HouseDB();

    await houseDB.saveLoginStatus(Constants.loginStatusKey, true);
    await houseDB.saveEncryptedUserData(
        Constants.userDataKey, MyApp.userInfo);

    flowDecider(userDetails.profileStatus);
    //TODO persist data in shared preference
  }

  void flowDecider(String status) {
    print(status);
    if (status == accountStatusInActive) {
      Navigator.of(context).pushReplacementNamed("/verify_token");
    } else if (status == accountStatusTokenVerified) {
      Navigator.of(context).pushReplacementNamed("/add_profile");
    } else if (status == accountStatusProfile) {
      Navigator.of(context).pushReplacementNamed("/search_house");
    } else if (status == accountStatusHouse) {
      Navigator.of(context).pushReplacementNamed("/success");
    } else if (status == accountStatusActive) {
      Navigator.of(context).pushReplacementNamed("/home");
    }

    //TODO persist data in shared preference
  }
}
