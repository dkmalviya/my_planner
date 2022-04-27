import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/util/ui_utils.dart';

class CustomDialogBoxWithMultipleButton extends StatelessWidget {
  final String title, message, actionButtonTitle,cancelButtonTitle;
  final Icon icon;

  final VoidCallback onActionButtonClicked;
  final VoidCallback onCancelButtonClicked;

  const CustomDialogBoxWithMultipleButton(this.title, this.message, this.actionButtonTitle,this.cancelButtonTitle,
      this.icon, this.onActionButtonClicked,this.onCancelButtonClicked,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.kPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: Constants.kPadding,
              top: 36 + Constants.kPadding,
              right: Constants.kPadding,
              bottom: Constants.kPadding),
          margin: const EdgeInsets.only(top: 36),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Constants.purpleLight,
              borderRadius: BorderRadius.circular(Constants.kPadding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: HouseTheme.titleDark,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                message,
                style: HouseTheme.bodyDark,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),

                 Row(

                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: primaryButtonStyle,
                        onPressed: onActionButtonClicked,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Constants.kPadding,
                              horizontal: Constants.kPadding * 2),
                          child: Text(
                            actionButtonTitle,
                            style: HouseTheme.subTitleLight,
                          ),
                        )),
                    const SizedBox(width: 20,),
                    TextButton(
                        style: transparentBorderButtonStyle,
                        onPressed: onCancelButtonClicked,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Constants.kPadding,
                              horizontal: Constants.kPadding * 2),
                          child: Text(
                            cancelButtonTitle,
                            style: HouseTheme.subTitleDark,
                          ),
                        )),
                  ],
                ),

            ],
          ),
        ),
        Positioned(
          left: Constants.kPadding,
          right: Constants.kPadding,
          child: CircleAvatar(
            backgroundColor: Constants.purpleLight,
            radius: 36,
            child: icon,
          ),
        ),
      ],
    );
  }
}
