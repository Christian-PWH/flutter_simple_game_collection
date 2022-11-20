import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

Future<bool> tictactoeGameModeSelectionDialog({
  required BuildContext context,
}) async {
  return await showDialog(
    context: context,
    builder: (context) => const TicTacToeGameModeSelection(),
  );
}

class TicTacToeGameModeSelection extends StatelessWidget {
  const TicTacToeGameModeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Card(
            margin: const EdgeInsets.all(20.0),
            color: Theme.of(context).cardColor,
            elevation: 7.0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 7.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'GAME MODE',
                  style: kHeaderTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 125.0,
                      height: 125.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          backgroundColor: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.backgroundColor,
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2.5,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Vs-CPU',
                                style: kLabelTextStyle(context),
                              ),
                            ),
                            const Center(
                              child: Icon(
                                Icons.android,
                                size: 50.0,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    SizedBox(
                      width: 125.0,
                      height: 125.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          backgroundColor: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.backgroundColor,
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 2.5,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                              ),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                '2-Player',
                                style: kLabelTextStyle(context),
                              ),
                            ),
                            const Center(
                              child: Icon(
                                Icons.people_alt,
                                size: 50.0,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
