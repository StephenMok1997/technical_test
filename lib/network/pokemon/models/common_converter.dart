import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/enum/poke_stat.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/http/http_client.dart';

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

class CapitalizeConverter implements JsonConverter<String, String> {
  const CapitalizeConverter();

  @override
  String fromJson(String json) =>
      json[0].toUpperCase() + json.substring(1).replaceAll('-', ' ');

  @override
  String toJson(String name) => name.toLowerCase()..replaceAll('', '-');
}

class SpeciesUrlToIndexConverter implements JsonConverter<int, String> {
  const SpeciesUrlToIndexConverter();

  @override
  int fromJson(String json) {
    final List<String> list = json.split('/');
    return int.parse(
      list[list.length - 2],
    );
  }

  @override
  String toJson(int i) =>
      '${HttpClient.dio.options.baseUrl}/pokemon-species/$i/';
}

class PokeTypeConverter implements JsonConverter<PokeType, String> {
  const PokeTypeConverter();

  @override
  PokeType fromJson(String json) {
    return PokeType.values.firstWhere(
      (e) => json == e.name.toLowerCase(),
      orElse: () => PokeType.unknown,
    );
  }

  @override
  String toJson(PokeType type) => type.name;
}

class PokeStatConverter implements JsonConverter<PokeStat, String> {
  const PokeStatConverter();

  @override
  PokeStat fromJson(String json) {
    return PokeStat.values.firstWhere(
      (e) => json == e.name.toLowerCase(),
      orElse: () => PokeStat.attack,
    );
  }

  @override
  String toJson(PokeStat stat) => stat.name;
}
