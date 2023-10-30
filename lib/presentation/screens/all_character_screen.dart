import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_character_app/presentation/component/theme_icon.dart';
import 'package:show_character_app/presentation/controller/all_character_bloc.dart';
import '../../core/service_locator.dart';
import '../component/all_character_list.dart';

class AllCharacterScreen extends StatelessWidget {
  const AllCharacterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AllCharacterBloc(sl())..add(const GetAllCharactersEvent());
      },
      child: Scaffold(
        body: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Text(
                      "Rick & Morty",
                      style: GoogleFonts.aclonica(
                          textStyle: const TextStyle(fontSize: 35),
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10, top: 40),
                    child: ThemeIcon(),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 180,
            bottom: 0,
            left: 0,
            right: 0,
            child: CharacterList(),
          )
        ]),
      ),
    );
  }
}
