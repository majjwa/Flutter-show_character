part of 'all_character_bloc.dart';

class AllCharacterState extends Equatable {
  final List<Character> character;
  final CharacterState state;
  final String messages;

  const AllCharacterState({
    this.character = const [],
    this.state = CharacterState.loading,
    this.messages = '',
  });

  AllCharacterState copyWith({
    List<Character>? character,
    CharacterState? state,
    String? messages,
  }) {
    return AllCharacterState(
      character: character ?? this.character,
      state: state ?? this.state,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object> get props => [character, state, messages];
}
