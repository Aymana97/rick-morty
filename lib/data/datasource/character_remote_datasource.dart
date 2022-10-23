import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/domain/entity/api_response.dart';

part 'character_remote_datasource.g.dart';

@singleton
class CharacterRemoteDatasource {
  final Dio dio = GetIt.I();
  CharacterRestClient get _characterRestClient => CharacterRestClient(dio);
  
  Future<APIResponse> getAllCharactersFromAPI(String path) async {
    return await _characterRestClient.characters(path);
  } 
}

// API
@RestApi()
abstract class CharacterRestClient {
  factory CharacterRestClient(Dio dio) = _CharacterRestClient;

  @GET("{path}")
  Future<APIResponse> characters(@Path("path") String path);
}