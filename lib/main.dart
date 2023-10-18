import 'package:flutter/material.dart';
import 'package:show_character_app/data/remote_data_source/character_remote_data_source.dart';
import 'package:show_character_app/data/repository/all_character_repo.dart';
import 'package:show_character_app/domain/repository/base_all_character_repo.dart';
import 'package:show_character_app/presentation/screens/all_character_screen.dart';

import 'core/service_locator.dart';

void main() async {
// BaseCharacterRemoteDataSource baseCharacterRemoteDataSource =CharacterRemoteDataSource();
// BaseAllCharacterRepo baseAllCharacterRepo = AllCharacterRepo(baseCharacterRemoteDataSource);
// await baseAllCharacterRepo.GetAllCharacter();
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black38,
        useMaterial3: true,
      ),
      home:
       const AllCharacterScreen(),
    );
  }
}


