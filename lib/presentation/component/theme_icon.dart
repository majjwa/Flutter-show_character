import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_character_app/theme/component/app_theme.dart';
import 'package:show_character_app/theme/controller/theme_bloc.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
      return IconButton(
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context)
                .add(ThemeEvent(appTheme: AppTheme()));
          },
          icon: Icon(
            Icons.light_mode_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ));
    });
  }
}
