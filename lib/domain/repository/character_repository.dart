import 'package:rick_and_morty/domain/entity/api_response.dart';

abstract class CharacterRepository {
  Future<APIResponse> getAll(String path);
}