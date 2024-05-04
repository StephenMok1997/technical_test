// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      species: Species.fromJson(json['species'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
              ?.map((e) => Statistic.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => PokemonTypeData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      height: (json['height'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'species': instance.species.toJson(),
      'stats': instance.stats.map((e) => e.toJson()).toList(),
      'sprites': instance.sprites.toJson(),
      'types': instance.types.map((e) => e.toJson()).toList(),
      'height': instance.height,
      'weight': instance.weight,
    };
