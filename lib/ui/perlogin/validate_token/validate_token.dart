import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/string_constant.dart';
import 'package:my_planner/models/request/user/validate_token_request_dto.dart';
import 'package:my_planner/service/on_board_repository.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/ui/dashboard/house/ui_view/widgets/alert_dialog.dart';
import 'package:my_planner/util/ui_utils.dart';
import 'package:my_planner/widget/progress_loader.dart';

class ValidateToken extends StatefulWidget {
  const ValidateToken({Key? key}) : super(key: key);

  @override
  _ValidateTokenState createState() => _ValidateTokenState();
}

class _ValidateTokenState extends State<ValidateToken> {
  TextEditingController tokenTextController = TextEditingController();

  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

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

    return Scaffold(
      backgroundColor: Colors.white,
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
                "User",
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
                    style: loginButtonStyle,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();

                      validateTokenForm();
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
    );
  }

  void validateTokenCall() async {
    ValidateTokenRequestDto validateTokenRequestDto =
        ValidateTokenRequestDto(tokenTextController.text);

    try {
      ProgressLoader.show(context);
      var onBoardRepository = OnBoardRepository();
      var validateTokenResponse =
          await onBoardRepository.validateEmailToken(validateTokenRequestDto);
      ProgressLoader.hide();
      if (validateTokenResponse.responseCode == 0) {
        Navigator.of(context).pop();
      } else {
        Fluttertoast.showToast(msg: msgUnableToValidateToken);
      }
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

  void validateTokenForm() {
    if (tokenTextController.text != "") {
      validateTokenCall();
    } else {
      Fluttertoast.showToast(msg: msgValidToken);
    }
  }
}
