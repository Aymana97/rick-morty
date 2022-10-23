import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/domain/entity/api_response_info.dart';
import 'package:rick_and_morty/domain/entity/character.dart';

part 'api_response.g.dart';

@JsonSerializable()
class APIResponse {
  final APIResponseInfo info;
  final List<Character> results;

  APIResponse(this.info, this.results);

  factory APIResponse.fromJson(Map<String, dynamic> json) => _$APIResponseFromJson(json);
  Map<String, dynamic> toJson() => _$APIResponseToJson(this);
}