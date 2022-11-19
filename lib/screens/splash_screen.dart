import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_event.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';
import 'package:flutter_simple_game_collection/utilities/preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _loadTheme() async {
    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeBlocEvent(appTheme: Preferences.getTheme()!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              child: ScaleTransition(
                scale: Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
                    parent: _controller, curve: Curves.easeOutQuint)),
                child: const Image(
                  height: 150.0,
                  image: AssetImage('assets/images/splash_screen.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  textAlign: TextAlign.center,
                  'GAME\nCOLLECTION',
                  textStyle: kSplashTextStyle,
                  colors: colorizeColors,
                ),
              ],
              onFinished: () {
                Navigator.of(context).pushReplacementNamed('/homeLobby');
              },
              totalRepeatCount: 2,
              isRepeatingAnimation: true,
            ),
          ],
        ),
      ),
    );
  }
}
