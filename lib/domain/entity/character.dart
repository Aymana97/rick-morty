import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/domain/entity/character_detail_info.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterDetailInfo origin;
  final CharacterDetailInfo location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  Character(this.id, this.name, this.status, this.species, this.type, this.gender, this.origin, this.location, this.image, this.episode, this.url, this.created);

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

}