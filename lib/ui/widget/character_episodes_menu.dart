import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entity/character.dart';
import 'package:rick_and_morty/domain/entity/episode.dart';
import 'package:rick_and_morty/l10n/generated/l10n.dart';

class CharacterEpisodesMenu extends StatelessWidget {
  
  final Character character;
  final List<Episode> episodes;

  const CharacterEpisodesMenu({super.key, required this.character, required this.episodes});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return AlertDialog(
      title: Text(tr.episodes_menu_title(character.name)),
      // List of charcter's episodes
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: episodes.map((e) =>
            Text(tr.episodes_menu_episode_name(e.episode, e.name))
          ).toList()
        )
      ),
      // Alert dialog action buttons
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text(tr.back_button)
        )
      ]
    );
  }

}