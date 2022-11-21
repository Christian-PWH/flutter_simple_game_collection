import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

Future<bool> rockPaperScissorResultDialog({
  required BuildContext context,
  required String? gameValidation,
  required Map<String, dynamic> playerChoice,
  required Map<String, dynamic> cpuChoice,
}) async {
  return await showDialog(
    context: context,
    builder: (context) => RockPaperScissorResultView(
      gameValidation: gameValidation,
      playerChoice: playerChoice,
      cpuChoice: cpuChoice,
    ),
  );
}

class RockPaperScissorResultView extends StatelessWidget {
  const RockPaperScissorResultView(
      {super.key,
      required this.gameValidation,
      required this.playerChoice,
      required this.cpuChoice});

  final String? gameValidation;
  final Map<String, dynamic> playerChoice;
  final Map<String, dynamic> cpuChoice;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
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
                Text(
                  gameValidation!,
                  style: kHeaderTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.0,
                      height: 200.0,
                      child: Card(
                        color: Theme.of(context).cardColor,
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            width: 2.5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'CPU',
                                style: kLabelTextStyle(context),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  cpuChoice['image_path'],
                                  fit: BoxFit.contain,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                cpuChoice['label'],
                                style: kLabelTextStyle(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 200.0,
                      child: Card(
                        color: Theme.of(context).cardColor,
                        elevation: 7.0,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                            width: 2.5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'YOU',
                                style: kLabelTextStyle(context),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Image.asset(
                                  playerChoice['image_path'],
                                  fit: BoxFit.contain,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                playerChoice['label'],
                                style: kLabelTextStyle(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const SizedBox(
                    width: 150.0,
                    height: 75.0,
                    child: Center(
                      child: Text(
                        'PLAY AGAIN',
                        style: kElevatedButtonTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
