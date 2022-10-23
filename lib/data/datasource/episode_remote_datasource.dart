import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty/core/constants.dart';
import 'package:rick_and_morty/domain/entity/episode.dart';

part 'episode_remote_datasource.g.dart';

@singleton
class EpisodeRemoteDatasource {
  final Dio dio = GetIt.I();
  EpisodeRestClient get _episodeRestClient => EpisodeRestClient(dio);
  
  Future<List<Episode>> getMultipleEpisodesFromAPI(List<String> ids) async {
    return await _episodeRestClient.multipleEpisodes(ids.toString());
  } 
}

// API
@RestApi(baseUrl: apiBaseUrl)
abstract class EpisodeRestClient {
  factory EpisodeRestClient(Dio dio) = _EpisodeRestClient;

  @GET("/episode/{ids}")
  Future<List<Episode>> multipleEpisodes(@Path("ids") String ids);
}