import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_state.dart';
import 'package:flutter_simple_game_collection/screens/home_screen.dart';
import 'package:flutter_simple_game_collection/screens/splash_screen.dart';
import 'package:flutter_simple_game_collection/screens/tic_tac_toe/tic_tac_toe.dart';
import 'package:flutter_simple_game_collection/utilities/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeBlocState>(
        builder: (context, themeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            title: 'Simple Game Collection',
            home: const SplashScreen(),
            routes: <String, WidgetBuilder>{
              '/splash': (BuildContext context) => const SplashScreen(),
              '/homeLobby': (BuildContext context) => const HomeScreen(),
              '/homeTicTacToe': (BuildContext context) => const TicTacToe(),
            },
          );
        },
      ),
    );
  }
}
