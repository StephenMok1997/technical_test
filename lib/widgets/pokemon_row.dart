import 'package:flutter/material.dart';
import 'package:technical_test/network/pokemon/models/pokemon_list_response.dart';
import 'package:technical_test/routing/route_handler.dart';

class PokemonRow extends StatelessWidget {
  final int index;
  final BasicPokemon pokemon;

  const PokemonRow({
    super.key,
    required this.index,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RouteHandler.goPokemonDetailPage(
        urlId: pokemon.urlIndex,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        color: index % 2 == 0 ? Colors.black12 : null,
        child: Text(
          '${index + 1}. ${pokemon.name}',
        ),
      ),
    );
  }
}
