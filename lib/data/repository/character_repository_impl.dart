import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/data/datasource/character_remote_datasource.dart';
import 'package:rick_and_morty/domain/entity/api_response.dart';
import 'package:rick_and_morty/domain/repository/character_repository.dart';

@Singleton(as: CharacterRepository)
class CharacterRepositoryImpl extends CharacterRepository {

  final CharacterRemoteDatasource _characterRemoteDatasource;

  CharacterRepositoryImpl(this._characterRemoteDatasource);

  @override
  Future<APIResponse> getAll(String path) {
    return _characterRemoteDatasource.getAllCharactersFromAPI(path);
  }

}