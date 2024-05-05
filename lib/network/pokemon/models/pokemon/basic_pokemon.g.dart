// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicPokemon _$BasicPokemonFromJson(Map<String, dynamic> json) => BasicPokemon(
      name: const CapitalizeConverter().fromJson(json['name'] as String),
      urlIndex:
          const SpeciesUrlToIndexConverter().fromJson(json['url'] as String),
    );

Map<String, dynamic> _$BasicPokemonToJson(BasicPokemon instance) =>
    <String, dynamic>{
      'name': const CapitalizeConverter().toJson(instance.name),
      'url': const SpeciesUrlToIndexConverter().toJson(instance.urlIndex),
    };
