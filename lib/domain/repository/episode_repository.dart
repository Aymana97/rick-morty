import 'package:rick_and_morty/domain/entity/episode.dart';

abstract class EpisodeRepository {
  Future<List<Episode>> getMultipleEpisodes(List<String> ids);
}