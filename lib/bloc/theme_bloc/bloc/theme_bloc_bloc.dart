import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_event.dart';
import 'package:flutter_simple_game_collection/bloc/theme_bloc/bloc/theme_bloc_state.dart';
import 'package:flutter_simple_game_collection/utilities/app_themes.dart';

class ThemeBloc extends Bloc<ThemeBlocEvent, ThemeBlocState> {
  ThemeBloc()
      : super(
          ThemeBlocState(
              themeData: AppThemes.appThemeData[AppTheme.lightTheme]!),
        ) {
    on<ThemeBlocEvent>(_changeTheme);
  }

  void _changeTheme(ThemeBlocEvent event, Emitter<ThemeBlocState> emit) async {
    try {
      emit(ThemeBlocState(
        themeData: AppThemes.appThemeData[event.appTheme]!,
      ));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
