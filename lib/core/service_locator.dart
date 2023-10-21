import 'package:get_it/get_it.dart';
import 'package:show_character_app/data/remote_data_source/character_remote_data_source.dart';
import 'package:show_character_app/data/repository/all_character_repo.dart';
import 'package:show_character_app/domain/repository/base_all_character_repo.dart';
import 'package:show_character_app/domain/usecases/get_all_character_usecase.dart';
import 'package:show_character_app/domain/usecases/get_character_details_usecase.dart';
import 'package:show_character_app/presentation/controller/all_character_bloc.dart';
import 'package:show_character_app/presentation/controller/character_details_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerFactory(() => AllCharacterBloc(sl()));
    sl.registerFactory(() => CharacterDetailsBloc(sl()));
    sl.registerLazySingleton<BaseCharacterRemoteDataSource>(
        () => CharacterRemoteDataSource());
    sl.registerLazySingleton<BaseAllCharacterRepo>(
        () => AllCharacterRepo(sl()));
    sl.registerLazySingleton(() => GetAllCharacterUseCases(sl()));
    sl.registerLazySingleton(() => GetCharacterDetailsUseCase(sl()));
  }
}
