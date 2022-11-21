import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_game_collection/screens/rock_paper_scissor/rock_paper_scissor_cpu/rock_paper_scissor_cpu.dart';
import 'package:flutter_simple_game_collection/screens/rock_paper_scissor/rock_paper_scissor_cpu/rock_paper_scissor_utils.dart';
import 'package:flutter_simple_game_collection/screens/rock_paper_scissor/rock_paper_scissor_widgets/rock_paper_scissor_result_dialog.dart';
import 'package:flutter_simple_game_collection/screens/rock_paper_scissor/rock_paper_scissor_widgets/rock_paper_scissor_round_card.dart';
import 'package:flutter_simple_game_collection/screens/rock_paper_scissor/rock_paper_scissor_widgets/rock_paper_scissor_score_card.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';

class RockPaperScissor extends StatefulWidget {
  const RockPaperScissor({super.key});

  @override
  RockPaperScissorState createState() => RockPaperScissorState();
}

class RockPaperScissorState extends State<RockPaperScissor> {
  CarouselController cpuItemController = CarouselController();
  Timer? countdownTimer;
  Duration gameDuration = const Duration(seconds: 10);

  int gameRound = 1;
  int playerWin = 0;
  int cpuWin = 0;
  int draw = 0;

  int? cpuRNG = RockPaperScissorCpu().generateChoiceRNG();
  int? cpuFakeRNG = RockPaperScissorCpu().generateFakeChoiceRNG();
  bool cpuHasChoice = false;
  late Map<String, dynamic> cpuChoiceAssets;

  List gameAssets = [];
  Map<String, dynamic> rockPaperScissorAssets = Map.from({
    "datas": [
      {
        "label": "Rock",
        "image_path": "assets/images/rock_paper_scissor_assets/rock.png",
      },
      {
        "label": "Paper",
        "image_path": "assets/images/rock_paper_scissor_assets/paper.png",
      },
      {
        "label": "Scissor",
        "image_path": "assets/images/rock_paper_scissor_assets/scissor.png",
      }
    ]
  });

  @override
  void initState() {
    super.initState();
    _loadAssets();
    startTimer();
  }

  void reinitialize() {
    resetTimer();
    setState(() {
      cpuHasChoice = false;
      cpuRNG = RockPaperScissorCpu().generateChoiceRNG();
      cpuFakeRNG = RockPaperScissorCpu().generateFakeChoiceRNG();
    });
    startTimer();
  }

  void _loadAssets() {
    setState(() {
      gameAssets = rockPaperScissorAssets["datas"];
    });
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => gameDuration = const Duration(seconds: 10));
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = gameDuration.inSeconds - reduceSecondsBy;
      if (seconds == 7) {
        cpuHasChoice = true;
        cpuChoiceAssets = gameAssets[cpuRNG!];
        cpuItemController.animateToPage(
          cpuFakeRNG!,
        );
      }
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        gameDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final gameDurationSeconds = strDigits(gameDuration.inSeconds.remainder(60));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 100.0,
        backgroundColor: Theme.of(context).backgroundColor,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        title: const Text(
          'Rock Paper\nScissor',
          style: kAppbarTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: _body(gameDurationSeconds),
        ),
      ),
    );
  }

  Widget _body(String gameDuration) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 2,
          child: Stack(
            children: [
              CarouselSlider(
                carouselController: cpuItemController,
                options: CarouselOptions(
                  height: 250.0,
                  aspectRatio: 16 / 9,
                  autoPlay: cpuHasChoice ? false : true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  autoPlayInterval: const Duration(milliseconds: 750),
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  scrollDirection: Axis.horizontal,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 0.5,
                  initialPage: 0,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                ),
                items: rockPaperScissorItemSlider(true),
              ),
              Visibility(
                visible: cpuHasChoice,
                child: Container(
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context)
                      .colorScheme
                      .onInverseSurface
                      .withOpacity(0.75),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Text(
                        'Cpu has selected an item',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontFamily: 'PixelEmulator',
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              offset: const Offset(2.5, 2.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: rockPaperScissorScoreCard(
                      context, playerWin, cpuWin, true)),
              SizedBox(
                width: 75.0,
                height: 75.0,
                child: Card(
                  color: Theme.of(context).cardColor,
                  elevation: 7.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      width: 5.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  ),
                  child: Center(
                    child: Text(
                      gameDuration,
                      style: kHeaderTextStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: rockPaperScissorScoreCard(
                      context, playerWin, cpuWin, false)),
            ],
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 250.0,
            aspectRatio: 16 / 9,
            autoPlay: false,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            scrollDirection: Axis.horizontal,
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 0.5,
            initialPage: 1,
          ),
          items: rockPaperScissorItemSlider(false),
        ),
        rockPaperScissorBottomView(context, gameRound, draw),
      ],
    );
  }

  void validateWinner(Map<String, dynamic> playerChoice, bool cpu) {
    if (cpu == false) {
      String? getGameValidation = GameValidation
          .winCondition[playerChoice['label']]![cpuChoiceAssets['label']];
      if (getGameValidation == "You Win") {
        setState(() {
          playerWin += 1;
        });
      }
      if (getGameValidation == "You Lose") {
        setState(() {
          cpuWin += 1;
        });
      }
      if (getGameValidation == "It's a Draw") {
        setState(() {
          draw += 1;
        });
      }
      rockPaperScissorResultDialog(
        context: context,
        gameValidation: getGameValidation,
        playerChoice: playerChoice,
        cpuChoice: cpuChoiceAssets,
      ).then(
        (value) {
          if (value) {
            setState(() {
              gameRound += 1;
            });
            reinitialize();
          }
        },
      );
    }
  }

  List<Widget> rockPaperScissorItemSlider(bool cpu) {
    return gameAssets
        .map(
          (item) => SafeArea(
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 7.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 7.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                splashColor: Theme.of(context).splashColor,
                onTap: cpu
                    ? null
                    : () {
                        validateWinner(item, cpu);
                      },
                child: SizedBox(
                  width: 250.0,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(15.0),
                          child: cpu
                              ? const SizedBox(
                                  width: 200.0,
                                  child: Center(
                                    child: Icon(
                                      Icons.question_mark,
                                      size: 150.0,
                                    ),
                                  ),
                                )
                              : item['image_path'] != null
                                  ? Image.asset(
                                      item['image_path'],
                                      fit: BoxFit.contain,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                      width: 200.0,
                                    )
                                  : const SizedBox(
                                      width: 200.0,
                                      child: Center(
                                        child: Icon(
                                          Icons.question_mark,
                                          size: 150.0,
                                        ),
                                      ),
                                    ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: cpu
                              ? Text(
                                  'CPU',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  item['label'] ?? '-',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
