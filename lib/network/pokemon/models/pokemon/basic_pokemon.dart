import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'basic_pokemon.g.dart';

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
