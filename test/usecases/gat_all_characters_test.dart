import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/core/constants.dart';
import 'package:rick_and_morty/core/enum/character_gender.dart';
import 'package:rick_and_morty/core/enum/character_status.dart';
import 'package:rick_and_morty/data/datasource/character_remote_datasource.dart';
import 'package:rick_and_morty/data/repository/character_repository_impl.dart';
import 'package:rick_and_morty/domain/repository/character_repository.dart';
import 'package:rick_and_morty/domain/usecase/get_all_characters_usecase.dart';

void getAllCharacters() async {
  final CharacterRemoteDatasource characterRemoteDatasource = CharacterRemoteDatasource();
  final CharacterRepository characterRepository = CharacterRepositoryImpl(characterRemoteDatasource);
  final GetAllCharactersUseCase getAllCharactersUseCase = GetAllCharactersUseCase(characterRepository);

  final result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams(charactersAPI));
  expect(result.info.count, 826);
  expect(result.info.pages, 42);
  expect(result.info.next!.length, greaterThan(0));
  expect(result.info.prev, null);
  expect(result.results.length, 20);
}

void filterCharacters() async {
  final CharacterRemoteDatasource characterRemoteDatasource = CharacterRemoteDatasource();
  final CharacterRepository characterRepository = CharacterRepositoryImpl(characterRemoteDatasource);
  final GetAllCharactersUseCase getAllCharactersUseCase = GetAllCharactersUseCase(characterRepository);

  const anyFilter = "/?";
  const bothFilter = "&";
  const status = "status=";
  const gender = "gender=";

  final String deadStatus = CharacterStatus.Dead.name;
  final String aliveStatus = CharacterStatus.Alive.name;
  final String unknownStatus = CharacterStatus.Unknown.name;

  final String femaleGender = CharacterGender.Female.name;
  final String maleGender = CharacterGender.Male.name;
  final String genderlessGender = CharacterGender.Genderless.name;
  final String unknownGender = CharacterGender.Unknown.name;

  // Test status
  var result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$aliveStatus"));
  expect(result.info.count, 439);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$deadStatus"));
  expect(result.info.count, 287);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$unknownStatus"));
  expect(result.info.count, 100);

  // Test gender
  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$gender$femaleGender"));
  expect(result.info.count, 148);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$gender$maleGender"));
  expect(result.info.count, 610);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$gender$genderlessGender"));
  expect(result.info.count, 19);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$gender$unknownGender"));
  expect(result.info.count, 49);

  // Test combinations
  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$aliveStatus$bothFilter$gender$femaleGender"));
  expect(result.info.count, 95);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$aliveStatus$bothFilter$gender$maleGender"));
  expect(result.info.count, 309);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$aliveStatus$bothFilter$gender$genderlessGender"));
  expect(result.info.count, 10);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$aliveStatus$bothFilter$gender$unknownGender"));
  expect(result.info.count, 25);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$deadStatus$bothFilter$gender$femaleGender"));
  expect(result.info.count, 43);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$deadStatus$bothFilter$gender$maleGender"));
  expect(result.info.count, 221);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$deadStatus$bothFilter$gender$genderlessGender"));
  expect(result.info.count, 5);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$deadStatus$bothFilter$gender$unknownGender"));
  expect(result.info.count, 18);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$unknownStatus$bothFilter$gender$femaleGender"));
  expect(result.info.count, 10);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$unknownStatus$bothFilter$gender$maleGender"));
  expect(result.info.count, 80);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$unknownStatus$bothFilter$gender$genderlessGender"));
  expect(result.info.count, 4);

  result = await getAllCharactersUseCase.perform(GetAllCharactersUseCaseParams("$charactersAPI$anyFilter$status$unknownStatus$bothFilter$gender$unknownGender"));
  expect(result.info.count, 6);
}
