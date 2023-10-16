import 'package:show_character_app/data/remote_data_source/character_remote_data_source.dart';
import 'package:show_character_app/domain/entities/character.dart';
import 'package:show_character_app/domain/repository/base_all_character_repo.dart';

class AllCharacterRepo extends BaseAllCharacterRepo{
  final BaseCharacterRemoteDataSource baseCharacterRemoteDataSource;

  AllCharacterRepo(this.baseCharacterRemoteDataSource);


  @override
  Future<List<Character>> GetAllCharacter() async{
    final result= await baseCharacterRemoteDataSource.getAllCharacter();
    print(result);
    return result;

  }

}