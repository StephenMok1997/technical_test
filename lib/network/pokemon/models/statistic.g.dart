// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statistic _$StatisticFromJson(Map<String, dynamic> json) => Statistic(
      value: (json['base_stat'] as num).toInt(),
      statType: StatisticType.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatisticToJson(Statistic instance) => <String, dynamic>{
      'base_stat': instance.value,
      'stat': instance.statType.toJson(),
    };

StatisticType _$StatisticTypeFromJson(Map<String, dynamic> json) =>
    StatisticType(
      name: const CapitalizeConverter().fromJson(json['name'] as String),
    );

Map<String, dynamic> _$StatisticTypeToJson(StatisticType instance) =>
    <String, dynamic>{
      'name': const CapitalizeConverter().toJson(instance.name),
    };
