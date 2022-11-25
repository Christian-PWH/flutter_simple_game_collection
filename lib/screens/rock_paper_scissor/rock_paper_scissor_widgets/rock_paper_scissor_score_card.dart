import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

Widget rockPaperScissorStatusCard(BuildContext context, int playerWin,
    int cpuWin, int gameRound, int draw, int viewId) {
  String? statusLabel = '';
  String? statusContent = '';

  if (viewId == 0) {
    statusLabel = 'ROUND';
    statusContent = '$gameRound';
  } else if (viewId == 1) {
    statusLabel = 'DRAW';
    statusContent = '$draw';
  } else if (viewId == 2) {
    statusLabel = 'YOU';
    statusContent = 'win : $playerWin';
  } else if (viewId == 3) {
    statusLabel = 'CPU';
    statusContent = 'win : $cpuWin';
  }
  return SizedBox(
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
            statusLabel,
            style: kLabelTextStyle(context),
          ),
          Text(
            statusContent,
            style: kLabelTextStyle(context),
          ),
        ],
      ),
    ),
  );
}
