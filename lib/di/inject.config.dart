// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasource/character_remote_datasource.dart' as _i3;
import '../data/datasource/episode_remote_datasource.dart' as _i6;
import '../data/repository/character_repository_impl.dart' as _i5;
import '../data/repository/episode_repository_impl.dart' as _i8;
import '../domain/repository/character_repository.dart' as _i4;
import '../domain/repository/episode_repository.dart' as _i7;
import '../domain/usecase/get_all_characters_usecase.dart' as _i9;
import '../domain/usecase/get_multiple_episodes_usecase.dart' as _i10;
import '../ui/page/character/character_controller.dart' as _i12;
import '../ui/page/characters/characters_controller.dart' as _i13;
import '../ui/page/splash_screen/splash_screen_controller.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.CharacterRemoteDatasource>(_i3.CharacterRemoteDatasource());
  gh.singleton<_i4.CharacterRepository>(
      _i5.CharacterRepositoryImpl(get<_i3.CharacterRemoteDatasource>()));
  gh.singleton<_i6.EpisodeRemoteDatasource>(_i6.EpisodeRemoteDatasource());
  gh.singleton<_i7.EpisodeRepository>(
      _i8.EpisodeRepositoryImpl(get<_i6.EpisodeRemoteDatasource>()));
  gh.factory<_i9.GetAllCharactersUseCase>(
      () => _i9.GetAllCharactersUseCase(get<_i4.CharacterRepository>()));
  gh.factory<_i10.GetMultipleEpisodesUseCase>(
      () => _i10.GetMultipleEpisodesUseCase(get<_i7.EpisodeRepository>()));
  gh.factory<_i11.SplashScreenPageController>(
      () => _i11.SplashScreenPageController());
  gh.factory<_i12.CharacterPageController>(() =>
      _i12.CharacterPageController(get<_i10.GetMultipleEpisodesUseCase>()));
  gh.factory<_i13.CharactersPageController>(
      () => _i13.CharactersPageController(get<_i9.GetAllCharactersUseCase>()));
  return get;
}
