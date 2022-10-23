// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponseInfo _$APIResponseInfoFromJson(Map<String, dynamic> json) =>
    APIResponseInfo(
      json['count'] as int,
      json['pages'] as int,
      json['next'] as String?,
      json['prev'] as String?,
    );

Map<String, dynamic> _$APIResponseInfoToJson(APIResponseInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
