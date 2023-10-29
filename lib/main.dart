import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_character_app/presentation/screens/all_character_screen.dart';
import 'package:show_character_app/theme/controller/theme_bloc.dart';
import 'core/service_locator.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          ThemeData? themeData = state.themeData;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home:AllCharacterScreen(),
          );
        },
      ),
    );
  }
}
