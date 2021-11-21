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
    final tokenFormField = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        decoration: BoxDecoration(
            color: Constants.purpleDark,
            border: Border.all(color: Constants.purpleLight),
            borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          style: HouseTheme.bodyLight,
          controller: tokenTextController,
          decoration: const InputDecoration(
            hintText: "Enter token here",
            border: InputBorder.none,
            hintStyle: HouseTheme.bodyLight,
          ),
        ));
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
                  "\t \t \t \t \t \t \t \t We would like to inform you that ur account is not yet approved.\nTo verify your account please insert token on below text field and click on verify button below.",
                  style: HouseTheme.bodyLight,
                ),
                const SizedBox(
                  height: 12,
                ),
                tokenFormField,
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

                        if (tokenTextController.text != "") {
                          Navigator.of(context).pushNamed("/add_profile");
                          //TODO Verify Token api call
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Verify",
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
