import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_character_app/theme/controller/theme_bloc.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        buildWhen: (previous, current) => previous.themeMode != current.themeMode,
        builder: (BuildContext context, state) {
          ThemeMode? themeMode = state.themeMode;
          return IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.light_mode_rounded,
                color: Theme.of(context).colorScheme.secondary,
              ));
        });
  }
}
