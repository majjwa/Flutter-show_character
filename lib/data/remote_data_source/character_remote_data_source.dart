import 'package:dio/dio.dart';
import 'package:show_character_app/data/model/all_character_model.dart';
import '../../core/app_constant.dart';

abstract class BaseCharacterRemoteDataSource{

  Future <List<AllCharacterModel>> getAllCharacter();


}
class CharacterRemoteDataSource extends BaseCharacterRemoteDataSource{
  @override
  Future<List<AllCharacterModel>> getAllCharacter() async{

    final response = await Dio().get(AppConstant.allCharacter);
    if (response.statusCode == 200) {
      return List<AllCharacterModel>.from((response.data["results"] as List)
          .map((e) => AllCharacterModel.fromJson(e)));
    } else {
      throw Exception();
    }
  }

}