import 'package:json_annotation/json_annotation.dart';

part 'api_response_info.g.dart';

@JsonSerializable()
class APIResponseInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  APIResponseInfo(this.count, this.pages, this.next, this.prev);

  factory APIResponseInfo.fromJson(Map<String, dynamic> json) => _$APIResponseInfoFromJson(json);
  Map<String, dynamic> toJson() => _$APIResponseInfoToJson(this);
}