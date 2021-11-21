import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/string_constant.dart';
import 'package:my_planner/main.dart';
import 'package:my_planner/models/dto/user_info.dart';
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
    if (loginStatus) {
      var readEncryptedUserData =
          await houseDB.readEncryptedUserData(Constants.userDataKey);

      if (readEncryptedUserData != null || readEncryptedUserData != "") {
        MyApp.userInfo = UserInfo.fromJson(readEncryptedUserData);
        print(MyApp.userInfo);

        if (MyApp.userInfo.profileStatus == accountStatusCompleted) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      }
    } else {
      MyApp.userInfo.userId = 1;
      MyApp.userInfo.userName = "Deepesh Malviya";
      MyApp.userInfo.email = "deepeshmalviya@outlook.com";
      MyApp.userInfo.password = "abc123";
      MyApp.userInfo.mobileNumber = "7774043339";
      MyApp.userInfo.profileStatus = accountStatusHouse;

      await houseDB.saveLoginStatus(Constants.loginStatusKey, true);
      await houseDB.saveEncryptedUserData(
          Constants.userDataKey, MyApp.userInfo);
      Navigator.of(context).pushReplacementNamed('/login');
    }
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
