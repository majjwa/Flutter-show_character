import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String name;
  final String? locationUrl;

  const Location({required this.name, this.locationUrl});

  @override
  List<Object?> get props => [name, locationUrl];
}
