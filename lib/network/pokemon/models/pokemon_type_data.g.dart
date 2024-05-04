// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonTypeData _$PokemonTypeDataFromJson(Map<String, dynamic> json) =>
    PokemonTypeData(
      type: PokemonType.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeDataToJson(PokemonTypeData instance) =>
    <String, dynamic>{
      'type': instance.type.toJson(),
    };

PokemonType _$PokemonTypeFromJson(Map<String, dynamic> json) => PokemonType(
      name: const CapitalizeConverter().fromJson(json['name'] as String),
    );

Map<String, dynamic> _$PokemonTypeToJson(PokemonType instance) =>
    <String, dynamic>{
      'name': const CapitalizeConverter().toJson(instance.name),
    };
