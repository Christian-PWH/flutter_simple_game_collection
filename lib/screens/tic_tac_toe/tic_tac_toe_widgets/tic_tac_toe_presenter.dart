import 'dart:async';

import 'package:flutter_simple_game_collection/screens/tic_tac_toe/tic_tac_toe_cpu/tic_tac_toe_cpu_ai.dart';
import 'package:flutter_simple_game_collection/screens/tic_tac_toe/tic_tac_toe_cpu/tic_tac_toe_cpu_utils.dart';

class TicTacToePresenter {
  // callbacks into our UI
  void Function(int idx) showMoveOnUi;
  void Function(int winningPlayer) showGameEnd;

  TicTacToeAi? _aiPlayer;

  TicTacToePresenter(this.showMoveOnUi, this.showGameEnd) {
    _aiPlayer = TicTacToeAi();
  }

  void onHumanPlayed(List<int> board, int currentPlayer) async {
    int evaluation = TicTacToeUtils.checkWinner(board);
    if (evaluation != TicTacToeUtils.noWinnerYet) {
      onGameEnd(evaluation);
      return;
    }

    await Future.delayed(const Duration(milliseconds: 500));
    int aiMove = await Future(() => _aiPlayer!.play(board, currentPlayer));

    board[aiMove] = TicTacToeUtils.aiCpu;
    evaluation = TicTacToeUtils.checkWinner(board);
    showMoveOnUi(aiMove);
    if (evaluation != TicTacToeUtils.noWinnerYet) {
      onGameEnd(evaluation);
    }
  }

  void onGameEnd(int winner) {
    showGameEnd(winner);
  }
}
