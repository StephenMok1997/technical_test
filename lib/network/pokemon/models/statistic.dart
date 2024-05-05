import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/enum/poke_stat.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'statistic.g.dart';

@JsonSerializable(explicitToJson: true)
class StatisticData {
  @JsonKey(name: 'base_stat')
  final int value;
  @JsonKey(name: 'stat')
  final StatisticType statType;

  StatisticData({
    required this.value,
    required this.statType,
  });

  factory StatisticData.fromJson(Map<String, dynamic> json) =>
      _$StatisticDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatisticType {
  @PokeStatConverter()
  @JsonKey(name: 'name')
  final PokeStat pokeStat;

  StatisticType({
    required this.pokeStat,
  });

  factory StatisticType.fromJson(Map<String, dynamic> json) =>
      _$StatisticTypeFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticTypeToJson(this);
}
