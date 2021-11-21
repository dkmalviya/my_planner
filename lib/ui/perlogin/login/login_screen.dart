import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/util/utils.dart';
import 'package:my_planner/widget/progress_loader.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerPasswordConfirm =
      TextEditingController();

  @override
  initState() {
    // TODO: implement initState
    super.initState();
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
                    const SizedBox(
                      height: 20,
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
                              /*showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox(
                                        "Success",
                                        "Registration Successfully..!!",
                                        "OK",
                                        alertIcon, () {
                                      Navigator.of(context).pop();
                                    });
                                  });*/

                              loginApiCall();

                            //  Navigator.of(context).pushNamed("/home");
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
                          child: ElevatedButton(
                            style: clearButtonStyle,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              Navigator.of(context).pushNamed("/registration");

                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
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
    try{
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();
      var login =
      await onBoardRepository.login("deepeshkumar03@gmail.com", "abc123");
      ProgressLoader.hide();
      Navigator.of(context).pushNamed("/home");
    }
    catch(e){
      ProgressLoader.hide();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CustomDialogBox(
                "Failed",
                e.toString(),
                "OK",
                alertIcon, () {
              Navigator.of(context).pop();
            });
          });
    }
  }
}