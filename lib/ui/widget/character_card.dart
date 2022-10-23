import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/core/navigation/app_routes.gr.dart';
import 'package:rick_and_morty/domain/entity/character.dart';

class CharacterCard extends StatelessWidget {
  
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(CharacterRoute(character: character)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(character.image),
          Positioned(
            bottom: 5,
            left: 15,
            right: 15,
            child: Container(
              color: Colors.grey.withOpacity(.9),
              child: AutoSizeText(
                character.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center
              )
            )
          )
        ]
      ),
    );
  }

}