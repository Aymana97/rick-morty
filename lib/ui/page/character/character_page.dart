import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morty/domain/entity/character.dart';
import 'package:rick_and_morty/l10n/generated/l10n.dart';
import 'package:rick_and_morty/ui/page/character/character_controller.dart';

class CharacterPage extends StatefulWidget {

  final Character character;

  const CharacterPage({super.key, required this.character});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {

  final CharacterPageController controller = GetIt.I();

  @override
  void initState() {
    super.initState();
    controller.init(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.character;
    final tr = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            children: [
              Image.network(c.image),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${tr.character_page_name}${c.name}"),
                  Text("${tr.character_page_status}${c.status}"),
                  Text("${tr.character_page_specie}${c.species}"),
                  Text("${tr.character_page_type}${c.type == "" ? "-" : c.type}"),
                  Text("${tr.character_page_gender}${c.gender}"),
                  Text("${tr.character_page_date}${DateFormat('d/M/y').format(DateTime.parse(c.created))}")
                ]
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => controller.openCharacterEpisodesMenu(context, c),
                child: Obx(() => Text(tr.character_page_episode_list(controller.episodes.length)))
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(tr.back_button)
              )
            ]
          )
        )
      )
    );
  }

}