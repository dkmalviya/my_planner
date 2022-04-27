import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_planner/constant/app_constants.dart';
import 'package:my_planner/constant/data.dart';
import 'package:my_planner/ui/dashboard/house/house_theme.dart';
import 'package:my_planner/util/utils.dart';

LinearGradient linearGrayGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      hexToColor('#395E7E'),
      hexToColor('#18334B'),
    ]);

final ButtonStyle clearButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Constants.redLight,
  primary: Constants.redLight,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Constants.purpleDark,
  primary: Constants.purpleDark,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Constants.yellowDark,
  primary: Constants.yellowDark,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Constants.white,
  primary: Constants.white,
  textStyle: HouseTheme.bodyDark,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle transparentButtonStyle = TextButton.styleFrom(
  primary: Colors.transparent,
  textStyle:const TextStyle(fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: -0.05,
      color: Constants.yellow),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    side: BorderSide(
        color: Constants.yellow,
        width: 1,
        style: BorderStyle.solid
    ),
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final ButtonStyle transparentBorderButtonStyle = TextButton.styleFrom(
  primary: Colors.transparent,
  textStyle:const TextStyle(fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: -0.05,
      color: Constants.purpleDark),
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    side: BorderSide(
        color: Constants.purpleDark,
        width: 1,
        style: BorderStyle.solid
    ),
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

final BoxDecoration backgroundCardDecoration = BoxDecoration(
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
    gradient: const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Constants.purple,
          Constants.purpleDark,
        ]),
    boxShadow: customDarkShadow);
final BoxDecoration infoCardDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  gradient: const LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Constants.purple,
        Constants.purpleDark,
      ]),
  boxShadow: [
    BoxShadow(
      color: hexToColor("#000000"),
      offset: const Offset(0.0, 5.0), //(x,y)
      blurRadius: 8.0,
    ),
  ],
);

final BoxDecoration foregroundCardDecoration = BoxDecoration(
  gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Constants.purple,
        Constants.purpleMedium,
      ]),
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      color: hexToColor("#000000"),
      offset: const Offset(0.0, 5.0), //(x,y)
      blurRadius: 8.0,
    ),
  ],
);

final BoxDecoration stepCardDecoration = BoxDecoration(
  gradient: const LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Constants.purple,
        Constants.purpleDark,
      ]),
  boxShadow: [
    BoxShadow(
      color: hexToColor("#000000"),
      offset: const Offset(0.0, 5.0), //(x,y)
      blurRadius: 8.0,
    ),
  ],
);

final BoxDecoration tileLeadingDecoration = BoxDecoration(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    gradient: const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Constants.purple,
          Constants.purpleDark,
          Constants.purpleMedium,
        ]),
    boxShadow: customDarkShadow);

const Gradient redGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Constants.redDark,
      Constants.redLight,
    ]);
const Gradient greenGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Constants.greenDark,
      Constants.greenLight,
    ]);
const Gradient yellowGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Constants.yellowDark,
      Constants.yellowLight,
    ]);

const Icon successIcon = Icon(
  Icons.verified,
  size: 36,
  color: Constants.greenLight,
);
const Icon infoIcon = Icon(
  Icons.info,
  size: 36,
  color: Colors.blue,
);
const Icon alertIcon = Icon(
  Icons.warning_rounded,
  size: 36,
  color: Constants.orange,
);
const Icon failIcon = Icon(
  Icons.highlight_off,
  size: 36,
  color: Constants.redDark,
);
