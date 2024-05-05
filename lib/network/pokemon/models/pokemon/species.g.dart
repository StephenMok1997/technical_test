// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      name: const CapitalizeConverter().fromJson(json['name'] as String),
      id: const SpeciesUrlToIndexConverter().fromJson(json['url'] as String),
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'name': const CapitalizeConverter().toJson(instance.name),
      'url': const SpeciesUrlToIndexConverter().toJson(instance.id),
    };
