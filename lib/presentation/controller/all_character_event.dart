part of 'all_character_bloc.dart';

abstract class AllCharacterEvent extends Equatable {
  const AllCharacterEvent();

}

class GetAllCharactersEvent extends AllCharacterEvent {
  final int page;

  const GetAllCharactersEvent({ required this.page});

  @override
  List<Object> get props => [page];
}