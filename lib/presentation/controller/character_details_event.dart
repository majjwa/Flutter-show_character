part of 'character_details_bloc.dart';


abstract class CharacterDetailsEvent extends Equatable {
  const CharacterDetailsEvent();
}

class GetCharacterDetailsEvent extends CharacterDetailsEvent {
  final int id;
  const GetCharacterDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
