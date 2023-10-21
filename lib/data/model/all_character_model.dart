import 'package:show_character_app/data/model/location_model.dart';
import 'package:show_character_app/domain/entities/character.dart';

class AllCharacterModel extends Character {
  const AllCharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.image,
    required super.location,
  });
  factory AllCharacterModel.fromJson(Map<String, dynamic> json) =>
      AllCharacterModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        image: json["image"],
        location: LocationModel.fromMap(json["location"]),
      );
}
