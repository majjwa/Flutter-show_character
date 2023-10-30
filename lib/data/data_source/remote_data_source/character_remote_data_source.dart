import 'package:dio/dio.dart';
import 'package:show_character_app/data/model/all_character_model.dart';
import 'package:show_character_app/data/model/character_details_model.dart';
import 'package:show_character_app/core/app_constant.dart';

abstract class BaseCharacterRemoteDataSource {
  Future<List<AllCharacterModel>> getAllCharacter(int page);
  Future<CharacterDetailsModel> getCharacterDetails(int characterId);
}

class CharacterRemoteDataSource extends BaseCharacterRemoteDataSource {

  @override
  Future<List<AllCharacterModel>> getAllCharacter(int page) async {
    final response = await Dio().get(AppConstant.allCharacter(page));
    if (response.statusCode == 200) {
      return List<AllCharacterModel>.from((response.data["results"] as List)
          .map((e) => AllCharacterModel.fromJson(e)));
    } else {
      throw Exception();
    }
  }


  @override
  Future<CharacterDetailsModel> getCharacterDetails(int characterId) async {
    final response = await Dio().get(AppConstant.characterDetail(characterId));
    if (response.statusCode == 200) {
      return CharacterDetailsModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
