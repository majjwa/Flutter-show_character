import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../core/enum.dart';
import '../component/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: AppTheme.appThemeData[Themes.lightTheme])) {
    _switchMode();
  }

  void _switchMode() {
    on<ThemeEvent>((event, emit) {
      final newTheme =
          state.themeData == AppTheme.appThemeData[Themes.lightTheme]
              ? AppTheme.appThemeData[Themes.darkTheme]
              : AppTheme.appThemeData[Themes.lightTheme];

      emit(ThemeState(themeData: newTheme));
        });
  }
}
