import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/data/datasource/episode_remote_datasource.dart';
import 'package:rick_and_morty/data/repository/episode_repository_impl.dart';
import 'package:rick_and_morty/domain/repository/episode_repository.dart';
import 'package:rick_and_morty/domain/usecase/get_multiple_episodes_usecase.dart';

void getMultipleEpisodes() async {
  final EpisodeRemoteDatasource episodeRemoteDatasource = EpisodeRemoteDatasource();
  final EpisodeRepository episodeRepository = EpisodeRepositoryImpl(episodeRemoteDatasource);
  final GetMultipleEpisodesUseCase getMultipleEpisodesUseCase = GetMultipleEpisodesUseCase(episodeRepository);

  final result = await getMultipleEpisodesUseCase.perform(GetMultipleEpisodesUseCaseParams(['1', '2', '3', '4']));
  expect(result.length, 4);
}
