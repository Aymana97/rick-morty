import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/domain/entity/character.dart';
import 'package:rick_and_morty/domain/entity/episode.dart';
import 'package:rick_and_morty/domain/usecase/get_multiple_episodes_usecase.dart';
import 'package:rick_and_morty/ui/widget/character_episodes_menu.dart';

@injectable
class CharacterPageController {

  final GetMultipleEpisodesUseCase _getMultipleEpisodesUseCase;

  CharacterPageController(this._getMultipleEpisodesUseCase);

  final RxList<Episode> _episodes = RxList.empty();
  List<Episode> get episodes => _episodes;

  init(Character character) async {
    var ids = character.episode.map((e) => e.split("/").last).toList();
    _episodes.value = await _getMultipleEpisodesUseCase.perform(GetMultipleEpisodesUseCaseParams(ids));
  }

  // Open Filter Menu
  openCharacterEpisodesMenu(BuildContext context, Character character) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CharacterEpisodesMenu(
          character: character,
          episodes: episodes
        );
      }
    );
  }

}