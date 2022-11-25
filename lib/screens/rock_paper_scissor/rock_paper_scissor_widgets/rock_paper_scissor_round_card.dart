import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/components/settings_dialog.dart';
import 'package:flutter_simple_game_collection/utilities/app_themes.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';
import 'package:flutter_simple_game_collection/utilities/preferences.dart';

Widget rockPaperScissorBottomView(
  BuildContext context,
  int gameRound,
  int draw,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: 75.0,
        height: 75.0,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor:
                Theme.of(context).elevatedButtonTheme.style?.backgroundColor,
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  width: 2.5,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.error,
              size: 50.0,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      SizedBox(
        width: 100.0,
        height: 100.0,
        child: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          tooltip: "Setting",
          iconSize: 75.0,
          icon: Icon(
            color: Preferences.getTheme() == AppTheme.lightTheme
                ? kDarkBgColor
                : kLightBgColor,
            Icons.settings,
          ),
          onPressed: () {
            settingsDialog(context: context);
          },
        ),
      ),
    ],
  );
}
