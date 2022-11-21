import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

Widget rockPaperScissorScoreCard(
    BuildContext context, int playerWin, int cpuWin, bool isCpuScoreCard) {
  return SizedBox(
    width: 100.0,
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
            isCpuScoreCard ? 'CPU' : 'YOU',
            style: kLabelTextStyle(context),
          ),
          Text(
            isCpuScoreCard ? 'Win : $cpuWin' : 'Win : $playerWin',
            style: kLabelTextStyle(context),
          ),
        ],
      ),
    ),
  );
}
