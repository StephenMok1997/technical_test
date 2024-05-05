import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';
import 'package:technical_test/network/pokemon/models/pokemon/pokemon_type_data.dart';
import 'package:technical_test/network/pokemon/models/pokemon/species.dart';
import 'package:technical_test/network/pokemon/models/pokemon/sprites.dart';
import 'package:technical_test/network/pokemon/models/pokemon/statistic_data.dart';

part 'pokemon_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonResponse {
  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);
  PokemonResponse({
    required this.species,
    this.stats = const [],
    this.types = const [],
    required this.sprites,
    required this.height,
    required this.weight,
  });

  @CapitalizeConverter()
  final Species species;
  final List<StatisticData> stats;
  final Sprites sprites;
  final List<PokemonTypeData> types;
  final int height;
  final int weight;

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
