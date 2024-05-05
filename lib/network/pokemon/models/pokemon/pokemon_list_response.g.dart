// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) =>
    PokemonListResponse(
      count: (json['count'] as num).toInt(),
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => BasicPokemon.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      next: const OffsetConverter().fromJson(json['next'] as String?),
      previous: const OffsetConverter().fromJson(json['previous'] as String?),
    );

Map<String, dynamic> _$PokemonListResponseToJson(
        PokemonListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'next': const OffsetConverter().toJson(instance.next),
      'previous': const OffsetConverter().toJson(instance.previous),
    };
