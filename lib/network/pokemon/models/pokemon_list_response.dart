import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonListResponse {
  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);
  PokemonListResponse({
    required this.count,
    this.results = const [],
    this.next,
    this.previous,
  });

  final int count;
  final List<BasicPokemon> results;
  @OffsetConverter()
  final int? next;
  @OffsetConverter()
  final int? previous;

  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicPokemon {
  factory BasicPokemon.fromJson(Map<String, dynamic> json) =>
      _$BasicPokemonFromJson(json);
  BasicPokemon({
    required this.name,
    required this.urlIndex,
  });

  @CapitalizeConverter()
  final String name;
  @SpeciesUrlToIndexConverter()
  @JsonKey(name: 'url')
  final int urlIndex;

  Map<String, dynamic> toJson() => _$BasicPokemonToJson(this);
}
