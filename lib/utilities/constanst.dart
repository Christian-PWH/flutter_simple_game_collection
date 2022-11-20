import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const kSplashTextStyle = TextStyle(
  fontSize: 35.0,
  fontFamily: 'PixelEmulator',
  letterSpacing: 0.5,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: kDarkTextTheme,
  shadows: [
    Shadow(
      blurRadius: 2.5,
      offset: Offset(2.5, 2.5),
    ),
  ],
);

const kAppbarTextStyle = TextStyle(
  fontSize: 35.0,
  fontFamily: 'PixelEmulator',
  letterSpacing: 0.5,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.italic,
  color: kDarkTextTheme,
  shadows: [
    Shadow(
      blurRadius: 2.0,
      color: Colors.black,
      offset: Offset(2.5, 2.5),
    ),
  ],
);

const kElevatedButtonTextStyle = TextStyle(
  fontSize: 15.0,
  letterSpacing: 0.5,
  fontFamily: 'PixelEmulator',
  fontWeight: FontWeight.normal,
);

const colorizeColors = [
  Colors.white,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
  Colors.white,
];

//light theme
const kLightBgColor = Color(0xFFBDC2E0);
const kLightThemeModeColor = Color(0xFF002347);
const kLightTextTheme = Color(0xF20D112C);

//dark theme
const kDarkBgColor = Color(0xFF131416);
const kDarkThemeModeColor = Color(0xFFE6EAD8);
const kDarkTextTheme = Color(0xFFF1F3F9);

Future<void> showAlertDialog(
    {required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    required final VoidCallback onOkPressed}) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => onOkPressed(),
          child: Text(defaultActionText),
        ),
      ],
    ),
  );
}
