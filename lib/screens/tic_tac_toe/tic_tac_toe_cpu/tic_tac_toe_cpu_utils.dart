class TicTacToeUtils {
  static const int human = 1;
  static const int aiCpu = -1;
  static const int noWinnerYet = 0;
  static const int draw = 2;

  static const int empty = 0;
  static const symbols = {empty: "", human: "X", aiCpu: "O"};

  static const winConditionList = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  static bool isBoardFull(List<int> board) {
    for (var val in board) {
      if (val == empty) return false;
    }

    return true;
  }

  static bool isMoveLegal(List<int> board, int move) {
    if (move < 0 || move >= board.length || board[move] != empty) {
      return false;
    }

    return true;
  }

  static int checkWinner(List<int> board) {
    for (var list in winConditionList) {
      if (board[list[0]] != empty &&
          board[list[0]] == board[list[1]] &&
          board[list[0]] == board[list[2]]) {
        return board[list[0]];
      }
    }

    if (isBoardFull(board)) {
      return draw;
    }

    return noWinnerYet;
  }

  static int changePlayer(int currentPlayer) {
    return -1 * currentPlayer;
  }
}
