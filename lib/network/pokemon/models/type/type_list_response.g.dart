// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeListResponse _$TypeListResponseFromJson(Map<String, dynamic> json) =>
    TypeListResponse(
      count: (json['count'] as num).toInt(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => BasicType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      next: const OffsetConverter().fromJson(json['next'] as String?),
      previous: const OffsetConverter().fromJson(json['previous'] as String?),
    );

Map<String, dynamic> _$TypeListResponseToJson(TypeListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'next': const OffsetConverter().toJson(instance.next),
      'previous': const OffsetConverter().toJson(instance.previous),
    };

BasicType _$BasicTypeFromJson(Map<String, dynamic> json) => BasicType(
      pokeType: const PokeTypeConverter().fromJson(json['name'] as String),
      urlIndex: const UrlToIndexConverter().fromJson(json['url'] as String),
    );

Map<String, dynamic> _$BasicTypeToJson(BasicType instance) => <String, dynamic>{
      'name': const PokeTypeConverter().toJson(instance.pokeType),
      'url': const UrlToIndexConverter().toJson(instance.urlIndex),
    };
