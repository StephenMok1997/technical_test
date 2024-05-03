import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:technical_test/network/pokemon/models/pokemon_list_response.dart';

part 'pokemon_service.g.dart';

@RestApi()
abstract class PokemonService {
  factory PokemonService(Dio dio, {String baseUrl}) = _PokemonService;

  @GET('/pokemon')
  Future<PokemonListResponse> getPokemonList({
    @Query('offset') int? offset,
    @Query('limit') int? limit,
  });
}
