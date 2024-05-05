import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'pokemon_type_data.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonTypeData {
  factory PokemonTypeData.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeDataFromJson(json);
  PokemonTypeData({
    required this.type,
  });

  final PokemonType type;

  Map<String, dynamic> toJson() => _$PokemonTypeDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PokemonType {
  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
  PokemonType({
    required this.pokeType,
  });

  @PokeTypeConverter()
  @JsonKey(name: 'name')
  final PokeType pokeType;

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
