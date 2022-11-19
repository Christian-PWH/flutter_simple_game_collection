import 'package:flutter/material.dart';

const kSplashTextStyle = TextStyle(
  fontSize: 35.0,
  fontFamily: 'PixelEmulator',
  letterSpacing: 0.5,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
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
  shadows: [
    Shadow(
      blurRadius: 2.0,
      color: Colors.black,
      offset: Offset(2.5, 2.5),
    ),
  ],
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
const kLightBgColor = Color(0xFFE9EFDA);
const kLightThemeModeColor = Color(0xFF002347);
const kLightTextTheme = Color(0xFFEAECF5);

//dark theme
const kDarkBgColor = Colors.black;
const kDarkThemeModeColor = Color(0xFFE6EAD8);
const kDarkTextTheme = Color(0xFFF1F3F9);
