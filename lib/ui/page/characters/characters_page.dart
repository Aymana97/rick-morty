import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/l10n/generated/l10n.dart';
import 'package:rick_and_morty/ui/page/characters/characters_controller.dart';
import 'package:rick_and_morty/ui/widget/character_card.dart';
import 'package:rick_and_morty/ui/widget/navigation_button.dart';

class CharactersPage extends StatefulWidget {

  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharactersPageController controller = GetIt.I();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                tr.characters_page_title,
                style: const TextStyle(fontSize: 20)
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(tr.characters_page_characters_count(controller.nbCharacters))),
                        Obx(() => Text(tr.characters_page_selected_filters(controller.getFilters())))
                      ]
                    ),
                    Expanded(child: Container()),
                    // Filter button
                    ElevatedButton(
                      onPressed: () => controller.openFilterMenu(context),
                      child: Text(tr.filter_button)
                    ),
                  ]
                ),
              ),
              const SizedBox(height: 20),
              // Display all characters in a Grid View
              Expanded(
                child: Obx(() => GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  shrinkWrap: true,
                  controller: controller.scrollController,
                  children: controller.characters.map((c) => CharacterCard(character: c)).toList()
                ))
              ),
              const SizedBox(height: 20),
              // Navigation + Filter buttons
              Row(
                children: [
                  const SizedBox(width: 15),
                  // Previous button
                  Obx(() => NavigationButton(visible: controller.previous, action: () => controller.getPreviousPage(), icon: Icons.arrow_left)),
                  Expanded(child: Container()),
                  // Next button
                  Obx(() => NavigationButton(visible: controller.next, action: () => controller.getNextPage(), icon: Icons.arrow_right)),
                  const SizedBox(width: 15),
                ]
              ),
              const SizedBox(height: 20)
            ]
          )
        )
      )
    );
  }

}