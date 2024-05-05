// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatisticData _$StatisticDataFromJson(Map<String, dynamic> json) =>
    StatisticData(
      value: (json['base_stat'] as num).toInt(),
      statType: StatisticType.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatisticDataToJson(StatisticData instance) =>
    <String, dynamic>{
      'base_stat': instance.value,
      'stat': instance.statType.toJson(),
    };

StatisticType _$StatisticTypeFromJson(Map<String, dynamic> json) =>
    StatisticType(
      pokeStat: const PokeStatConverter().fromJson(json['name'] as String),
    );

Map<String, dynamic> _$StatisticTypeToJson(StatisticType instance) =>
    <String, dynamic>{
      'name': const PokeStatConverter().toJson(instance.pokeStat),
    };
