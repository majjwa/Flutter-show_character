import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_character_app/presentation/component/all_character_list_loaded.dart';
import 'package:show_character_app/presentation/controller/all_character_bloc.dart';
import 'package:show_character_app/core/enum.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCharacterBloc, AllCharacterState>(
      buildWhen: (previous, current) => previous.state != current.state,
      builder: (BuildContext context, state) {
        switch (state.state) {
          case CharacterState.loading:
            return const Center(
                child: CircularProgressIndicator(color: Colors.purple,));
          case CharacterState.loaded:
            return  CharacterListLoaded(page: 1,);
          case CharacterState.error:
            return Container();
        }
      },
    );
  }
}
