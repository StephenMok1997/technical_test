import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/common_converter.dart';

part 'pokemon_type_data.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonTypeData {
  final PokemonType type;

  PokemonTypeData({
    required this.type,
  });

  factory PokemonTypeData.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PokemonType {
  @PokeTypeConverter()
  @JsonKey(name: 'name')
  final PokeType pokeType;

  PokemonType({required this.pokeType});

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);
}
