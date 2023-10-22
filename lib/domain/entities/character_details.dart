import 'package:equatable/equatable.dart';
import 'package:show_character_app/domain/entities/location.dart';
import 'package:show_character_app/domain/entities/origin.dart';

class CharacterDetails extends Equatable {
  final String image;
  final int id;
  final String name;
  final String status;
  final Origin origin;
  final Location location;
  final String species;
  final String type;
  final String gender;
  final List<dynamic> episode;

  const CharacterDetails({
    required this.image,
    required this.id,
    required this.name,
    required this.status,
    required this.origin,
    required this.location,
    required this.species,
    required this.type,
    required this.gender,
    required this.episode,
  });

  @override
  List<Object?> get props => [
        image,
        id,
        name,
        status,
        origin,
        location,
        species,
        type,
        gender,
        episode,
      ];
}
