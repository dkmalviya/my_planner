import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/string_constant.dart';
import 'package:my_planner/main.dart';
import 'package:my_planner/models/dto/user_info.dart';
import 'package:my_planner/models/response/login/get_user_details_response_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/util/house_db.dart';
import 'package:my_planner/util/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HouseDB houseDB = HouseDB();

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () => navigateUser());
  }

  void navigateUser() async {
    bool loginStatus = await houseDB.readLoginStatus(Constants.loginStatusKey);
    try {
      if (loginStatus) {
        var readEncryptedUserData =
            await houseDB.readEncryptedUserData(Constants.userDataKey);

        if (readEncryptedUserData != null || readEncryptedUserData != "") {
          MyApp.userInfo = UserInfo.fromJson(readEncryptedUserData);
          print(MyApp.userInfo);
          var onBoardRepository = OnBoardRepository();
          var userDetails =
              await onBoardRepository.getUserDetails(MyApp.userInfo.authToken);
          saveUserDetails(userDetails, MyApp.userInfo.authToken);
        }
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } on Exception catch (e) {
      await houseDB.saveLoginStatus(Constants.loginStatusKey, true);
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  void saveUserDetails(GetUserDetails userDetails, String authToken) async {
    if (userDetails.profileStatus != accountStatusInActive) {
      MyApp.userInfo.mobileNumber = userDetails.mobile;
      MyApp.userInfo.gender = userDetails.gender;
      MyApp.userInfo.firstName = userDetails.firstName;
      MyApp.userInfo.lastName = userDetails.lastName;
      MyApp.userInfo.notificationEnable = userDetails.notificationEnable;
      MyApp.userInfo.maritalStatus = userDetails.maritalStatus;
      MyApp.userInfo.userId = 2;

    }

    MyApp.userInfo.email = userDetails.email;
    MyApp.userInfo.authToken = authToken;
    MyApp.userInfo.refreshToken = authToken;
    MyApp.userInfo.profileStatus = userDetails.profileStatus;



    await houseDB.saveLoginStatus(Constants.loginStatusKey, true);
    await houseDB.saveEncryptedUserData(Constants.userDataKey, MyApp.userInfo);

    flowDecider(userDetails.profileStatus);
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
              width: 220,
              height: 220,
              child: Image(
                image: AssetImage("assets/images/app_logo.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'NovaSquare',
                      color: HexColor('#395E7E')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 00.0, 0.0, 0.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Budget Planner',
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 30,
                              color: HexColor('#395E7E'))),
                    ],
                    isRepeatingAnimation: false,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
