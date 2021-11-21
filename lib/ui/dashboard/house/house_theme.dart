import 'package:flutter/material.dart';

class HouseTheme {
  HouseTheme._();

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Colors.white;
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextTheme textTheme = TextTheme(
    headline1: titleLight,
    headline2: titleDark,
    headline3: appbarSubtitle,
    headline4: appbarTitle,
    headline5: headline,
    headline6: titleRegular,
    bodyText1: bodyLight,
    subtitle1: subTitleLight,
    subtitle2: subTitleDark,
    bodyText2: bodyDark,
    caption: caption,
  );

  static const TextStyle appbarTitle = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    letterSpacing: 0.7,
    color: lightText,
  );

  static const TextStyle appbarSubtitle = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    letterSpacing: 0.7,
    color: lightText,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.w100,
    fontSize: 24,
    letterSpacing: 0.27,
    color: lightText,
  );

  static const TextStyle subTitleLight = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: 0.2,
    color: lightText,
  );

  static const TextStyle subTitleDark = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: 0.2,
    color: darkerText,
  );

  static const TextStyle titleDark = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );
  static const TextStyle titleLight = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: lightText,
  );

  static const TextStyle titleRegular = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkerText,
  );

  static const TextStyle bodyDark = TextStyle(
    // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkerText,
  );

  static const TextStyle bodyLight = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.05,
    color: lightText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
