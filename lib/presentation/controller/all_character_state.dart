part of 'all_character_bloc.dart';

class AllCharacterState extends Equatable {
  final List<Character> character;
  final CharacterState state;


  const AllCharacterState({
    this.character= const [],
    this.state = CharacterState.loding,

  });

  AllCharacterState copyWith({
    List<Character>? character,
    CharacterState? state,

  }) {
    return AllCharacterState(
      character: character ?? this.character,
      state: state ?? this.state,

    );
  }

  @override
  List<Object> get props => [character, state];
}
