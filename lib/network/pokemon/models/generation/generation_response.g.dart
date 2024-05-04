// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationResponse _$GenerationResponseFromJson(Map<String, dynamic> json) =>
    GenerationResponse(
      id: (json['id'] as num).toInt(),
      species: (json['species'] as List<dynamic>?)
              ?.map((e) => Species.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GenerationResponseToJson(GenerationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'species': instance.species.map((e) => e.toJson()).toList(),
    };
