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
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: 125.0,
        height: 75.0,
        child: Card(
          color: Theme.of(context).cardColor,
          elevation: 7.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 5.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DRAW',
                style: kLabelTextStyle(context),
              ),
              Text(
                '$draw',
                style: kLabelTextStyle(context),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: 125.0,
        height: 75.0,
        child: Card(
          color: Theme.of(context).cardColor,
          elevation: 7.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: 5.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ROUND',
                style: kLabelTextStyle(context),
              ),
              Text(
                '$gameRound',
                style: kLabelTextStyle(context),
              ),
            ],
          ),
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
