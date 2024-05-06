import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:technical_test/network/pokemon/models/pokemon/pokemon_response.dart';
import 'package:technical_test/widgets/stat_progress_bar.dart';
import 'package:technical_test/widgets/shadow_container.dart';
import 'package:technical_test/widgets/type_tag.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({
    super.key,
    required this.urlId,
  });
  final int urlId;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  int get urlId => widget.urlId;

  @override
  void initState() {
    super.initState();
    context.read<PokemonDetailBloc>().add(
          PokemonFetched(
            urlId: urlId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
        builder: (context, state) {
          switch (state) {
            case PokemonDetailInitial():
            case PokemonFetchedLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PokemonFetchedSuccess():
              final PokemonResponse pokemon = state.pokemon;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _image(pokemon.sprites.frontDefault),
                    _nationalNumber(pokemon),
                    const SizedBox(height: 20.0),
                    _name(pokemon),
                    const SizedBox(height: 20.0),
                    _heightAndWeight(pokemon),
                    const SizedBox(height: 20.0),
                    _types(pokemon),
                    const SizedBox(height: 40.0),
                    ...baseStatistic(context, pokemon),
                  ],
                ),
              );
            case PokemonFetchedFailure():
              return const Text('Error');
          }
        },
      ),
    );
  }

  Wrap _types(PokemonResponse pokemon) {
    return Wrap(
      spacing: 32.0,
      children: List.generate(
        pokemon.types.length,
        (index) => TypeTag(
          type: pokemon.types[index].type.pokeType,
        ),
      ),
    );
  }

  Row _heightAndWeight(PokemonResponse pokemon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _data(
          'Weight',
          '${pokemon.weight / 10}kg',
        ),
        _data(
          'Height',
          '${pokemon.height / 10}m',
        ),
      ],
    );
  }

  Text _name(PokemonResponse pokemon) {
    return Text(
      pokemon.species.name,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _nationalNumber(PokemonResponse pokemon) {
    return Text(
      '#${pokemon.species.id}',
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> baseStatistic(BuildContext context, PokemonResponse pokemon) {
    return [
      const Text(
        'Base Statistic',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      ShadowContainer(
        child: Column(
          children: List.generate(
            pokemon.stats.length,
            (index) => StatProgressBar(
              stat: pokemon.stats[index],
              type: pokemon.types.first.type.pokeType,
            ),
          ),
        ),
      )
    ];
  }

  Widget _image(String url) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _data(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Text(
            '$name: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
          ),
        ],
      ),
    );
  }
}
