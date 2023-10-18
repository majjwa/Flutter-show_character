import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:show_character_app/domain/usecases/get_all_character_usecase.dart';
import '../../core/enum.dart';
import '../../domain/entities/character.dart';

part 'all_character_event.dart';
part 'all_character_state.dart';

class AllCharacterBloc extends Bloc<AllCharacterEvent, AllCharacterState> {
  final GetAllCharacterUseCases getAllCharacterUseCases;

  AllCharacterBloc(this.getAllCharacterUseCases)
      : super(const AllCharacterState()) {
    on<GetAllCharactersEvent>(_getAllCharacter);
  }

  FutureOr<void> _getAllCharacter(
      GetAllCharactersEvent event, Emitter<AllCharacterState> emit) async {
    final result = await getAllCharacterUseCases();
   emit(state.copyWith(
     character: result,
       state: CharacterState.loaded

   ));

  }


}
