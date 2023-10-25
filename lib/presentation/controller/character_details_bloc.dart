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
  CharacterDetailsBloc(this.getCharacterDetailsUseCase)
      : super(const CharacterDetailsState()) {
    on<GetCharacterDetailsEvent>(_getCharacterDetails);
  }
  final GetCharacterDetailsUseCase getCharacterDetailsUseCase;

  FutureOr<void> _getCharacterDetails(GetCharacterDetailsEvent event,
      Emitter<CharacterDetailsState> emit) async {
    final result = await getCharacterDetailsUseCase(event.characterId);
    emit(state.copyWith(
      characterDetail: result,
      state: CharacterState.loaded,
    ));
  }
}
