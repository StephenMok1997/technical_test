import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';
import 'package:technical_test/network/pokemon/models/pokemon/basic_pokemon.dart';

part 'type_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TypeResponse {
  factory TypeResponse.fromJson(Map<String, dynamic> json) =>
      _$TypeResponseFromJson(json);
  TypeResponse({
    required this.id,
    required this.pokeType,
    this.pokemons = const [],
  });

  final int id;
  @PokeTypeConverter()
  @JsonKey(name: 'name')
  final PokeType pokeType;
  @JsonKey(name: 'pokemon')
  final List<PokemonData> pokemons;

  Map<String, dynamic> toJson() => _$TypeResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PokemonData {
  factory PokemonData.fromJson(Map<String, dynamic> json) =>
      _$PokemonDataFromJson(json);
  PokemonData({
    required this.pokemon,
  });

  @JsonKey(name: 'pokemon')
  final BasicPokemon pokemon;

  Map<String, dynamic> toJson() => _$PokemonDataToJson(this);
}
