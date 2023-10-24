import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../component/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: AppTheme.appThemeData[Themes.lightTheme])) {
    _SwitchMode();
  }

  void _SwitchMode() {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeEvent) {
        // Determine the new theme and yield it
        final newTheme =
            state.themeData == AppTheme.appThemeData[Themes.lightTheme]
                ? AppTheme.appThemeData[Themes.darkTheme]
                : AppTheme.appThemeData[Themes.lightTheme];

        emit(ThemeState(themeData: newTheme));
      }
    });
  }
}
