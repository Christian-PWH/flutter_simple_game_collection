import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_event.dart';
import 'package:flutter_simple_game_collection/utilities/app_themes.dart';
import 'package:flutter_simple_game_collection/utilities/constanst.dart';
import 'package:flutter_simple_game_collection/utilities/preferences.dart';

Future<bool> settingsDialog({
  required BuildContext context,
}) async {
  return await showDialog(
    context: context,
    builder: (context) => const SettingsDialogView(),
  );
}

class SettingsDialogView extends StatelessWidget {
  const SettingsDialogView({super.key});

  _setTheme(BuildContext context, bool darkTheme) async {
    AppTheme selectedTheme =
        darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeBlocEvent(appTheme: selectedTheme));
    Preferences.saveTheme(selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          height: 250,
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'SETTING',
                  style: kHeaderTextStyle,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Icon(
                        Icons.dark_mode,
                        color: kDarkBgColor,
                        size: 50.0,
                      ),
                    ),
                    Switch(
                      value: Preferences.getTheme() == AppTheme.lightTheme,
                      onChanged: (val) async {
                        _setTheme(context, val);
                      },
                    ),
                    const Center(
                      child: Icon(
                        Icons.light_mode,
                        color: Colors.white,
                        size: 50.0,
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
