import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/screens/tic_tac_toe/tic_tac_toe_cpu/tic_tac_toe_cpu_utils.dart';
import 'package:flutter_simple_game_collection/screens/tic_tac_toe/tic_tac_toe_widgets/tic_tac_toe_presenter.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  int scorePlayer = 0;
  int scoreAi = 0;
  int scoreDraw = 0;
  bool turnOfx = true;
  bool singlePlayer = true;
  int currentPlayer = TicTacToeUtils.human;

  late TicTacToePresenter presenter;

  List<int> idItemListXOSinglePlayer = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  int filledBoxesMultiPlayer = 0;

  final List<String> itemListXOMultiPlayer = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  _TicTacToeState() {
    presenter = TicTacToePresenter(_movePlayedSingle, _onGameEnd);
  }

  @override
  void initState() {
    super.initState();
    singlePlayer = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100.0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text(
          'Tic Tac Toe',
          style: kAppbarTextStyle,
        ),
      ),
      body: Column(
        children: [
          _buildPointsTable(),
          _buildGrid(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _buildPointsTable() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      singlePlayer ? 'YOU ( X )' : 'Player1 ( X )',
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    scorePlayer.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      singlePlayer ? 'CPU ( O )' : 'Player2 ( O )',
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    scoreAi.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Draw',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    scoreDraw.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              String gameSymbols = '';
              if (singlePlayer) {
                if (idItemListXOSinglePlayer[index] == 1) gameSymbols = 'X';
                if (idItemListXOSinglePlayer[index] == -1) gameSymbols = 'O';
              } else {
                if (itemListXOMultiPlayer[index] == 'X') gameSymbols = 'X';
                if (itemListXOMultiPlayer[index] == 'O') gameSymbols = 'O';
              }

              return GestureDetector(
                onTap: () {
                  singlePlayer == true
                      ? idItemListXOSinglePlayer[index] != 0
                          ? null
                          : _movePlayedSingle(index)
                      : _tappedFuncMultiPlayer(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).toggleableActiveColor)),
                  child: Center(
                    child: Text(
                      gameSymbols,
                      style: TextStyle(
                        color: gameSymbols == 'X' ? Colors.blue : Colors.red,
                        fontSize: 75.0,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildTurn() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          turnOfx ? 'Turn of X' : 'Turn of O',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _tappedFuncMultiPlayer(int index) {
    if (singlePlayer == false) {
      setState(() {
        if (turnOfx && itemListXOMultiPlayer[index] == '') {
          itemListXOMultiPlayer[index] = 'O';
          filledBoxesMultiPlayer += 1;
        } else if (!turnOfx && itemListXOMultiPlayer[index] == '') {
          itemListXOMultiPlayer[index] = 'X';
          filledBoxesMultiPlayer += 1;
        }

        turnOfx = !turnOfx;
        _checkTheWinnerMultiPlayer();
      });
    }
  }

  void _checkTheWinnerMultiPlayer() {
    // check first row
    if (itemListXOMultiPlayer[0] == itemListXOMultiPlayer[1] &&
        itemListXOMultiPlayer[0] == itemListXOMultiPlayer[2] &&
        itemListXOMultiPlayer[0] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[0]);
      return;
    }

    // check second row
    if (itemListXOMultiPlayer[3] == itemListXOMultiPlayer[4] &&
        itemListXOMultiPlayer[3] == itemListXOMultiPlayer[5] &&
        itemListXOMultiPlayer[3] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[3]);
      return;
    }

    // check third row
    if (itemListXOMultiPlayer[6] == itemListXOMultiPlayer[7] &&
        itemListXOMultiPlayer[6] == itemListXOMultiPlayer[8] &&
        itemListXOMultiPlayer[6] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[6]);
      return;
    }

    // check first column
    if (itemListXOMultiPlayer[0] == itemListXOMultiPlayer[3] &&
        itemListXOMultiPlayer[0] == itemListXOMultiPlayer[6] &&
        itemListXOMultiPlayer[0] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[0]);
      return;
    }

    // check second column
    if (itemListXOMultiPlayer[1] == itemListXOMultiPlayer[4] &&
        itemListXOMultiPlayer[1] == itemListXOMultiPlayer[7] &&
        itemListXOMultiPlayer[1] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[1]);
      return;
    }

    // check third column
    if (itemListXOMultiPlayer[2] == itemListXOMultiPlayer[5] &&
        itemListXOMultiPlayer[2] == itemListXOMultiPlayer[8] &&
        itemListXOMultiPlayer[2] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[2]);
      return;
    }

    // check diagonal
    if (itemListXOMultiPlayer[0] == itemListXOMultiPlayer[4] &&
        itemListXOMultiPlayer[0] == itemListXOMultiPlayer[8] &&
        itemListXOMultiPlayer[0] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[0]);
      return;
    }

    // check diagonal
    if (itemListXOMultiPlayer[2] == itemListXOMultiPlayer[4] &&
        itemListXOMultiPlayer[2] == itemListXOMultiPlayer[6] &&
        itemListXOMultiPlayer[2] != '') {
      _showAlertDialog('Winner', itemListXOMultiPlayer[2]);
      return;
    }

    if (filledBoxesMultiPlayer == 9) {
      _showAlertDialog('Draw', '');
    }
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}',
        defaultActionText: 'OK',
        onOkPressed: () {
          _clearBoardMultiPlayer();
          Navigator.of(context).pop();
        });

    if (winner == 'O') {
      scoreAi += 1;
    } else if (winner == 'X') {
      scorePlayer += 1;
    } else {
      scoreDraw += 1;
    }
  }

  void _clearBoardMultiPlayer() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        itemListXOMultiPlayer[i] = '';
      }
    });

    filledBoxesMultiPlayer = 0;
  }

  void reinitialize() {
    currentPlayer = TicTacToeUtils.human;
    idItemListXOSinglePlayer = List.generate(9, (idx) => 0);
  }

  String? getSymbolForIdx(int idx) {
    return TicTacToeUtils.symbols[idItemListXOSinglePlayer[idx]];
  }

  void _movePlayedSingle(int idx) {
    setState(() {
      idItemListXOSinglePlayer[idx] = currentPlayer;

      if (currentPlayer == TicTacToeUtils.human) {
        currentPlayer = TicTacToeUtils.aiCpu;
        presenter.onHumanPlayed(idItemListXOSinglePlayer, currentPlayer);
      } else {
        currentPlayer = TicTacToeUtils.human;
      }

      turnOfx = !turnOfx;
    });
  }

  void _onGameEnd(int winner) {
    var title = "Game over!";
    var content = "You lose :(";
    switch (winner) {
      case TicTacToeUtils.human: // will never happen :)
        title = "Congratulations!";
        content = "You managed to beat an unbeatable AI!";
        scorePlayer += 1;
        break;
      case TicTacToeUtils.aiCpu:
        title = "Game Over!";
        content = "You lose, retry again";
        scoreAi += 1;
        break;
      default:
        title = "Draw!";
        content = "No winners here.";
        scoreDraw += 1;
    }

    showAlertDialog(
      context: context,
      title: title,
      content: content,
      defaultActionText: 'Restart',
      onOkPressed: () {
        setState(() {
          reinitialize();
          Navigator.of(context).pop();
        });
      },
    );
  }
}
