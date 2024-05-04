import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'statistic.g.dart';

@JsonSerializable(explicitToJson: true)
class Statistic {
  @JsonKey(name: 'base_stat')
  final int value;
  @JsonKey(name: 'stat')
  final StatisticType statType;

  Statistic({
    required this.value,
    required this.statType,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) =>
      _$StatisticFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatisticType {
  @CapitalizeConverter()
  final String name;

  StatisticType({required this.name});

  factory StatisticType.fromJson(Map<String, dynamic> json) =>
      _$StatisticTypeFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticTypeToJson(this);
}
