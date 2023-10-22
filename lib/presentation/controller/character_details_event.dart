part of 'character_details_bloc.dart';


abstract class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();
}

class GetCharacterDetailsEvent extends CharacterDetailsEvent {
  final int characterId;
  const GetCharacterDetailsEvent(this.characterId);

  @override
  List<Object?> get props => [characterId];
}
