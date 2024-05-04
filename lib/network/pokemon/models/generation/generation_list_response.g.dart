// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationListResponse _$GenerationListResponseFromJson(
        Map<String, dynamic> json) =>
    GenerationListResponse(
      count: (json['count'] as num).toInt(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => BasicGeneration.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      next: const OffsetConverter().fromJson(json['next'] as String?),
      previous: const OffsetConverter().fromJson(json['previous'] as String?),
    );

Map<String, dynamic> _$GenerationListResponseToJson(
        GenerationListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'next': const OffsetConverter().toJson(instance.next),
      'previous': const OffsetConverter().toJson(instance.previous),
    };

BasicGeneration _$BasicGenerationFromJson(Map<String, dynamic> json) =>
    BasicGeneration(
      name: const CapitalizeConverter().fromJson(json['name'] as String),
      urlIndex: const UrlToIndexConverter().fromJson(json['url'] as String),
    );

Map<String, dynamic> _$BasicGenerationToJson(BasicGeneration instance) =>
    <String, dynamic>{
      'name': const CapitalizeConverter().toJson(instance.name),
      'url': const UrlToIndexConverter().toJson(instance.urlIndex),
    };
