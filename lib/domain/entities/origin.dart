 import 'package:equatable/equatable.dart';

class Origin extends Equatable{
  final String name;
  final String? originUrl;

  const Origin({

required this.name,
   this.originUrl
  });

  @override

  List<Object?> get props => [name,originUrl];
}