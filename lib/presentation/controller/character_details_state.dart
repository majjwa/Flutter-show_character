part of 'character_details_bloc.dart';

class CharacterDetailsState extends Equatable {
  final CharacterDetails? characterDetail;
  final CharacterState state;

  const CharacterDetailsState({
    this.characterDetail,
    this.state = CharacterState.loading,
  });

  CharacterDetailsState copyWith({
    CharacterDetails? characterDetail,
    CharacterState? state,
    String? detailsMessages,
  }) {
    return CharacterDetailsState(
      characterDetail: characterDetail ?? this.characterDetail,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [state, characterDetail];
}
