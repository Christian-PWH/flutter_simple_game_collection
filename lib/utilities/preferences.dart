import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_themes.dart';

class Preferences {
  //
  static late SharedPreferences preferences;
  static const String keySelectedTheme = 'keySelectedTheme';

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveTheme(AppTheme selectedTheme) async {
    String theme = jsonEncode(selectedTheme.toString());
    preferences.setString(keySelectedTheme, theme);
  }

  static AppTheme? getTheme() {
    String? theme = preferences.getString(keySelectedTheme);
    if (null == theme) {
      return AppTheme.lightTheme;
    }
    return getThemeFromString(jsonDecode(theme));
  }

  static AppTheme? getThemeFromString(String themeString) {
    for (AppTheme theme in AppTheme.values) {
      if (theme.toString() == themeString) {
        return theme;
      }
    }
    return null;
  }
}
