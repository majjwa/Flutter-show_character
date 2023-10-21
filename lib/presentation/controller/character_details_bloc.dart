import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/enum.dart';
import '../../domain/entities/character_details.dart';
import '../../domain/usecases/get_character_details_usecase.dart';

part 'character_details_event.dart';
part 'character_details_state.dart';

class CharacterDetailsBloc
    extends Bloc<CharacterDetailsEvent, CharacterDetailsState> {
  final GetCharacterDetailsUseCase getCharacterDetailsUseCase;
  CharacterDetailsBloc(this.getCharacterDetailsUseCase)
      : super(const CharacterDetailsState()) {
    on<GetCharacterDetailsEvent>(_getCharacterDetails);
  }

  FutureOr<void> _getCharacterDetails(GetCharacterDetailsEvent event,
      Emitter<CharacterDetailsState> emit) async {
    final result = await getCharacterDetailsUseCase(event.id);
    emit(state.copyWith(
      characterDetails: result,
      state: CharacterState.loaded,
    ));
  }
}
