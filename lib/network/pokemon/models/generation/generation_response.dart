import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';
import 'package:technical_test/network/pokemon/models/species.dart';

part 'generation_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GenerationResponse {
  factory GenerationResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerationResponseFromJson(json);
  GenerationResponse({
    required this.id,
    required this.name,
    this.pokemonSpecies = const [],
  });

  final int id;
  @CapitalizeConverter()
  final String name;
  @JsonKey(name: 'pokemon_species')
  @SpeciesUrlToIndexConverter()
  final List<Species> pokemonSpecies;

  Map<String, dynamic> toJson() => _$GenerationResponseToJson(this);
}
