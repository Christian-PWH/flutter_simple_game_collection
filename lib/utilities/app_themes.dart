import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: FlexThemeData.light(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
      blendLevel: 27,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        blendOnColors: false,
        toggleButtonsRadius: 10.0,
        cardRadius: 25.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      background: Colors.transparent,
      textTheme: FlexThemeData.light().textTheme.apply(
            bodyColor: kLightTextTheme,
            displayColor: kLightTextTheme,
          ),
    ),
    AppTheme.darkTheme: FlexThemeData.dark(
      scheme: FlexScheme.indigo,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 30,
        blendOnColors: false,
        toggleButtonsRadius: 10.0,
        cardRadius: 25.0,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      background: Colors.transparent,
      textTheme: FlexThemeData.dark().textTheme.apply(
            bodyColor: kDarkTextTheme,
            displayColor: kDarkTextTheme,
          ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
