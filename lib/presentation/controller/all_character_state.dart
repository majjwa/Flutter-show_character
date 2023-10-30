part of 'all_character_bloc.dart';

class AllCharacterState extends Equatable {
  final List<Character> character;
  final CharacterState state;
  final int currentPage;
  const AllCharacterState({
    this.character = const [],
    this.state = CharacterState.loading,
    this.currentPage = 0,
  });

  AllCharacterState copyWith({
    List<Character>? character,
    CharacterState? state,
    int? currentPage,
  }) {
    return AllCharacterState(
      character: character ?? this.character,
      state: state ?? this.state,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [character, state, currentPage];
}
