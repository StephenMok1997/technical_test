import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_list_response.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_response.dart';
import 'package:technical_test/network/pokemon/models/pokemon/pokemon_list_response.dart';
import 'package:technical_test/network/pokemon/models/pokemon/pokemon_response.dart';

part 'pokemon_service.g.dart';

@RestApi()
abstract class PokemonService {
  factory PokemonService(Dio dio, {String baseUrl}) = _PokemonService;

  @GET('/pokemon')
  Future<PokemonListResponse> getPokemonList({
    @Query('offset') int? offset,
    @Query('limit') int? limit,
  });

  @GET('/pokemon/{id}')
  Future<PokemonResponse> getPokemon({
    @Path('id') required int id,
  });

  @GET('/generation')
  Future<GenerationListResponse> getGeneration();

  @GET('/generation/{id}')
  Future<GenerationResponse> getGenerationById({
    @Path('id') required int id,
  });
}
