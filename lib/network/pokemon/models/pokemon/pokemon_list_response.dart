import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';
import 'package:technical_test/network/pokemon/models/pokemon/basic_pokemon.dart';

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
