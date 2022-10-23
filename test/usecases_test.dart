import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/di/inject.dart';
import 'usecases/gat_all_characters_test.dart';
import 'usecases/get_multiple_episodes_test.dart';

void main() {
  injectDependencies();

  test('Get all characters from API', getAllCharacters);

  test('Get multiple episodes', getMultipleEpisodes);

  test('Get characters with filters', filterCharacters);
}
