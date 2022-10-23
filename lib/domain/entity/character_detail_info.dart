import 'package:json_annotation/json_annotation.dart';

part 'character_detail_info.g.dart';

@JsonSerializable()
class CharacterDetailInfo {
  final String name;
  final String url;

  CharacterDetailInfo(this.name, this.url);

  factory CharacterDetailInfo.fromJson(Map<String, dynamic> json) => _$CharacterDetailInfoFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterDetailInfoToJson(this);
}