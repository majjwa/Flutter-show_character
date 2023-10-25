import 'package:show_character_app/domain/entities/character.dart';
import 'package:show_character_app/domain/repository/base_all_character_repo.dart';

class GetAllCharacterUseCases {
  final BaseAllCharacterRepo baseAllCharacterRepo;
  GetAllCharacterUseCases(this.baseAllCharacterRepo);

  Future<List<Character>> call() async {
    return await baseAllCharacterRepo.getAllCharacter();
  }
}
