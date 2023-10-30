import 'package:show_character_app/data/model/origin_model.dart';
import 'package:show_character_app/domain/entities/character_details.dart';
import 'location_model.dart';

class CharacterDetailsModel extends CharacterDetails {
  const CharacterDetailsModel({
    required super.image,
    required super.id,
    required super.name,
    required super.status,
    required super.origin,
    required super.location,
    required super.species,
    required super.type,
    required super.gender,
    required super.episode,
  });
  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) =>
      CharacterDetailsModel(
        image: json['image'],
        id: json['id'],
        name: json['name'],
        status: json['status'],
        origin: OriginModel.fromMap(json["origin"]),
        location: LocationModel.fromMap(json["location"]),
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        episode: json['episode'],
      );
}
