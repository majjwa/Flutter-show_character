import 'package:equatable/equatable.dart';
import 'package:show_character_app/domain/entities/location.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String image;
  final Location location;

  const Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.image,
      required this.location});

  @override
  List<Object?> get props => [id, name, status, image, location];
  bool get isAlive => status == 'Alive';
}
