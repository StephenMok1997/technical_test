import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonListResponse {
  final int count;
  final List<BasicPokemon> results;
  @OffsetConverter()
  final int? next;
  @OffsetConverter()
  final int? previous;

  PokemonListResponse({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicPokemon {
  @CapitalizeConverter()
  final String name;
  @SpeciesUrlToIndexConverter()
  @JsonKey(name: 'url')
  final int urlIndex;

  BasicPokemon({
    required this.name,
    required this.urlIndex,
  });

  factory BasicPokemon.fromJson(Map<String, dynamic> json) =>
      _$BasicPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$BasicPokemonToJson(this);
}
