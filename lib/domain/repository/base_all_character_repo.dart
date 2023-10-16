import 'package:show_character_app/domain/entities/character.dart';

abstract class BaseAllCharacterRepo {

  Future<List<Character>>GetAllCharacter();

}