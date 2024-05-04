import 'package:technical_test/network/http/http_client.dart';
import 'package:technical_test/network/pokemon/models/pokemon_list_response.dart';
import 'package:technical_test/network/pokemon/models/pokemon_response.dart';
import 'package:technical_test/network/pokemon/services/pokemon_service.dart';

class PokemonRepository {
  final PokemonService _pokemonService = PokemonService(
    HttpClient.dio,
  );

  Future<PokemonListResponse> getPokemonList({
    int? offset,
    int? limit,
  }) async {
    final PokemonListResponse response = await _pokemonService.getPokemonList(
      offset: offset,
      limit: limit,
    );

    return response;
  }

  Future<PokemonResponse> getPokemonById({
    required int id,
  }) async {
    final PokemonResponse response = await _pokemonService.getPokemon(
      id: id,
    );
    return response;
  }
}
