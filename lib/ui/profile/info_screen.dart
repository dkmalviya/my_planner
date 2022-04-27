import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/profile/step.dart';
import 'package:my_planner/util/ui_utils.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  String stageName = "Email";
  TextEditingController tokenTextController = TextEditingController();

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  /*Widget infoMessage() {
    if (stageName == accountStatusEmailApproval) {
    return Text(
        "\t \t \t \t \t \t \t \t We would like to inform you that ur account is not yet approved.\nTo verify your account please click on verify button below.",
        style: HouseTheme.bodyLight,
      )

  }
    else if (stageName == accountStatusEmailApproval){
      return Text(
        "\t \t \t \t \t \t \t \t We would like to inform you that ur account is not yet approved.\nTo verify your account please click on verify button below.",
        style: HouseTheme.bodyLight,
      )
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const StepView([true, false, false, false]),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.all(Constants.kPadding * 2),
            padding: const EdgeInsets.all(Constants.kPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome !!",
                  style: HouseTheme.titleLight,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Deepeshmalviya@outlook.com",
                  style: HouseTheme.titleLight,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "\t \t \t \t \t \t \t \t We would like to inform you that ur account is not yet completed.\nTo complete your account details please click on ok button below.",
                  style: HouseTheme.bodyLight,
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: secondaryButtonStyle,
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pushNamed("/add_profile");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "OK",
                          style: HouseTheme.bodyDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            decoration: infoCardDecoration,
          ),
        ]),
      ),
    );
  }
}
