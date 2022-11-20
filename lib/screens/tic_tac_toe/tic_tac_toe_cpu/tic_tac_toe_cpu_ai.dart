import 'package:flutter_simple_game_collection/screens/tic_tac_toe/tic_tac_toe_cpu/tic_tac_toe_cpu_utils.dart';

class TicTacToeAi {
  static const int winScore = 100;
  static const int drawScore = 0;
  static const int loseScore = -100;

  int play(List<int> board, int currentPlayer) {
    return _getAiMove(board, currentPlayer).move;
  }

  Move _getAiMove(List<int> board, int currentPlayer) {
    List<int> newBoard;
    Move bestMove = Move(score: -10000, move: -1);

    for (int currentMove = 0; currentMove < board.length; currentMove++) {
      if (!TicTacToeUtils.isMoveLegal(board, currentMove)) continue;

      newBoard = List.from(board);
      newBoard[currentMove] = currentPlayer;
      int newScore = -_getBestScore(
        newBoard,
        TicTacToeUtils.changePlayer(currentPlayer),
      );

      if (newScore > bestMove.score) {
        bestMove.score = newScore;
        bestMove.move = currentMove;
      }
    }

    return bestMove;
  }

  int _getBestScore(List<int> board, int currentPlayer) {
    int evaluation = TicTacToeUtils.checkWinner(board);

    if (evaluation == currentPlayer) return winScore;

    if (evaluation == TicTacToeUtils.draw) return drawScore;

    if (evaluation == TicTacToeUtils.changePlayer(currentPlayer)) {
      return loseScore;
    }

    return _getAiMove(board, currentPlayer).score;
  }
}

class Move {
  int score;
  int move;

  Move({required this.score, required this.move});
}
