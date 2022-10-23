import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/usecase.dart';
import 'package:rick_and_morty/domain/entity/episode.dart';
import 'package:rick_and_morty/domain/repository/episode_repository.dart';


@injectable
class GetMultipleEpisodesUseCase extends UseCase<List<Episode>, GetMultipleEpisodesUseCaseParams> {

  final EpisodeRepository _characterRepository;

  GetMultipleEpisodesUseCase(this._characterRepository);

  @override
  Future<List<Episode>> perform(GetMultipleEpisodesUseCaseParams params) async {
    return _characterRepository.getMultipleEpisodes(params.ids);
  }
}

class GetMultipleEpisodesUseCaseParams extends Params {

  final List<String> ids;

  GetMultipleEpisodesUseCaseParams(this.ids);

}