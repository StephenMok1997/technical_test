// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeResponse _$TypeResponseFromJson(Map<String, dynamic> json) => TypeResponse(
      id: (json['id'] as num).toInt(),
      pokeType: const PokeTypeConverter().fromJson(json['name'] as String),
      pokemons: (json['pokemon'] as List<dynamic>?)
              ?.map((e) => PokemonData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TypeResponseToJson(TypeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': const PokeTypeConverter().toJson(instance.pokeType),
      'pokemon': instance.pokemons.map((e) => e.toJson()).toList(),
    };

PokemonData _$PokemonDataFromJson(Map<String, dynamic> json) => PokemonData(
      pokemon: BasicPokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonDataToJson(PokemonData instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon.toJson(),
    };
