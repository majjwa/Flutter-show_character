import 'package:show_character_app/domain/entities/origin.dart';

class OriginModel extends Origin {
  const OriginModel({
    required super.name,
    super.originUrl});



  factory OriginModel.fromMap(Map<String, dynamic> json) =>
      OriginModel(
          name: json["name"],
          originUrl: json["url"],
      );


}
