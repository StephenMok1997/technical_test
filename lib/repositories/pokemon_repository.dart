import 'package:dio/dio.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_list_response.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_response.dart';
import 'package:technical_test/network/pokemon/models/pokemon/pokemon_list_response.dart';
import 'package:technical_test/network/pokemon/models/pokemon/pokemon_response.dart';
import 'package:technical_test/network/pokemon/models/type/type_list_response.dart';
import 'package:technical_test/network/pokemon/models/type/type_response.dart';

class PokemonRepository {
  PokemonRepository(this.dio);

  final Dio dio;

  Future<PokemonListResponse> getPokemonList({
    int? offset,
    int? limit,
  }) async {
    try {
      final response = await dio.get(
        '/pokemon',
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
      );
      return PokemonListResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<PokemonResponse> getPokemonById({
    required int id,
  }) async {
    try {
      final response = await dio.get(
        '/pokemon/$id',
      );

      return PokemonResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<GenerationListResponse> getGenerationList({
    int? offset,
    int? limit,
  }) async {
    try {
      final response = await dio.get(
        '/generation',
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
      );
      return GenerationListResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<GenerationResponse> getGenerationById({
    required int id,
  }) async {
    try {
      final response = await dio.get(
        '/generation/$id',
      );
      return GenerationResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<TypeListResponse> getTypeList({
    int? offset,
    int? limit,
  }) async {
    try {
      final response = await dio.get(
        '/type',
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
      );
      return TypeListResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<TypeResponse> getTypeById({
    required int id,
  }) async {
    try {
      final response = await dio.get(
        '/type/$id',
      );
      return TypeResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
