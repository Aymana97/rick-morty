import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/data/datasource/episode_remote_datasource.dart';
import 'package:rick_and_morty/domain/entity/episode.dart';
import 'package:rick_and_morty/domain/repository/episode_repository.dart';

@Singleton(as: EpisodeRepository)
class EpisodeRepositoryImpl extends EpisodeRepository {

  final EpisodeRemoteDatasource _episodeRemoteDatasource;

  EpisodeRepositoryImpl(this._episodeRemoteDatasource);

  @override
  Future<List<Episode>> getMultipleEpisodes(List<String> ids) {
    return _episodeRemoteDatasource.getMultipleEpisodesFromAPI(ids);
  }

}