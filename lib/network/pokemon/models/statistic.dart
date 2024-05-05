import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/enum/poke_stat.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'statistic.g.dart';

@JsonSerializable(explicitToJson: true)
class StatisticData {
  StatisticData({
    required this.value,
    required this.statType,
  });

  factory StatisticData.fromJson(Map<String, dynamic> json) =>
      _$StatisticDataFromJson(json);
  @JsonKey(name: 'base_stat')
  final int value;
  @JsonKey(name: 'stat')
  final StatisticType statType;

  Map<String, dynamic> toJson() => _$StatisticDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatisticType {
  StatisticType({
    required this.pokeStat,
  });

  factory StatisticType.fromJson(Map<String, dynamic> json) =>
      _$StatisticTypeFromJson(json);
  @PokeStatConverter()
  @JsonKey(name: 'name')
  final PokeStat pokeStat;

  Map<String, dynamic> toJson() => _$StatisticTypeToJson(this);
}
