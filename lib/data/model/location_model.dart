import 'package:show_character_app/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.name,
   super.locationUrl,
  });
  factory LocationModel.fromMap(Map<String, dynamic> json) =>
      LocationModel(
          name: json["name"],
          locationUrl: json["url"]);

  Map<String, dynamic> toMap() => {
    'name': name,
    'url': locationUrl,
  };
}
