part of 'character_details_bloc.dart';


class  CharacterDetailsState extends Equatable{

  final List<CharacterDetails> characterDetails;
  final CharacterState state;
  final String detailsMessages;

  const CharacterDetailsState({
  this.characterDetails = const [],
  this.state = CharacterState.loading,
  this.detailsMessages = '',
  });

  CharacterDetailsState copyWith({
  List<CharacterDetails>? characterDetails,
  CharacterState? state,
  String? detailsMessages,
  }) {
  return CharacterDetailsState(
  characterDetails: characterDetails ?? this.characterDetails,
  state: state ?? this.state,
  detailsMessages: detailsMessages ?? this.detailsMessages,
  );
  }

  @override
  List<Object> get props => [characterDetails, state, detailsMessages];


}
