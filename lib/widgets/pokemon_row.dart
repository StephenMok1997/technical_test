import 'package:flutter/material.dart';
import 'package:technical_test/network/pokemon/models/pokemon/basic_pokemon.dart';
import 'package:technical_test/routing/route_handler.dart';

class PokemonRow extends StatelessWidget {
  const PokemonRow({
    super.key,
    required this.index,
    required this.pokemon,
  });
  final int index;
  final BasicPokemon pokemon;

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
        color: index % 2 == 0
            ? Theme.of(context).primaryColor.withOpacity(0.2)
            : null,
        child: Text(
          '${index + 1}. ${pokemon.name}',
        ),
      ),
    );
  }
}
