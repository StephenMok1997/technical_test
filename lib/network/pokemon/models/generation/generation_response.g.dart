// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationResponse _$GenerationResponseFromJson(Map<String, dynamic> json) =>
    GenerationResponse(
      id: (json['id'] as num).toInt(),
      name: const CapitalizeConverter().fromJson(json['name'] as String),
      pokemonSpecies: (json['pokemon_species'] as List<dynamic>?)
              ?.map((e) => Species.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GenerationResponseToJson(GenerationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': const CapitalizeConverter().toJson(instance.name),
      'pokemon_species':
          instance.pokemonSpecies.map((e) => e.toJson()).toList(),
    };
