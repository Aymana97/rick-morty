import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/usecase.dart';
import 'package:rick_and_morty/domain/entity/api_response.dart';
import 'package:rick_and_morty/domain/repository/character_repository.dart';


@injectable
class GetAllCharactersUseCase extends UseCase<APIResponse, GetAllCharactersUseCaseParams> {

  final CharacterRepository _characterRepository;

  GetAllCharactersUseCase(this._characterRepository);

  @override
  Future<APIResponse> perform(GetAllCharactersUseCaseParams params) async {
    return _characterRepository.getAll(params.path);
  }
}

class GetAllCharactersUseCaseParams extends Params {

  final String path;

  GetAllCharactersUseCaseParams(this.path);

}