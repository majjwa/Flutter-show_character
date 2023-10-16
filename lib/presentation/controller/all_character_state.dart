part of 'all_character_bloc.dart';

class AllCharacterState extends Equatable {
  final List<Character> character;
  final CharacterState state;
  final  String characterMessage;

  const AllCharacterState({
    this.character = const [],
    this.state = CharacterState.loding,
    this.characterMessage='',
  });

  AllCharacterState copyWith({
    List<Character>? character,
    CharacterState? state,
    String? characterMessage,
  }) {
    return AllCharacterState(
      character: character ?? this.character,
      state: state ?? this.state,
      characterMessage :characterMessage?? this.characterMessage
    );
  }

  @override
  List<Object> get props => [character, state];
}
