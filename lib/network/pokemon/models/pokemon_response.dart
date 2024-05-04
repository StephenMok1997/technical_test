import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';
import 'package:technical_test/network/pokemon/models/pokemon_type_data.dart';
import 'package:technical_test/network/pokemon/models/species.dart';
import 'package:technical_test/network/pokemon/models/sprites.dart';
import 'package:technical_test/network/pokemon/models/statistic.dart';

part 'pokemon_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonResponse {
  @CapitalizeConverter()
  final Species species;
  final List<Statistic> stats;
  final Sprites sprites;
  final List<PokemonTypeData> types;
  final int height;
  final int weight;

  PokemonResponse({
    required this.species,
    this.stats = const [],
    this.types = const [],
    required this.sprites,
    required this.height,
    required this.weight,
  });

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}
