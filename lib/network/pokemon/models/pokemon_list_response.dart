import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/network/http/http_client.dart';

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
  final String name;
  @UrlToIndexConverter()
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

class UrlToIndexConverter implements JsonConverter<int, String> {
  const UrlToIndexConverter();

  @override
  int fromJson(String json) {
    final List<String> list = json.split('/');
    return int.parse(
      list[list.length - 2],
    );
  }

  @override
  String toJson(int i) => '${HttpClient.dio.options.baseUrl}/pokemon/$i/';
}

class OffsetConverter implements JsonConverter<int?, String?> {
  const OffsetConverter();

  @override
  int? fromJson(String? json) {
    if (json != null) {
      final Uri url = Uri.parse(json);
      final String? offset = url.queryParameters['offset'];
      if (offset != null) {
        return int.parse(offset);
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  String? toJson(int? offset) => null;
}
