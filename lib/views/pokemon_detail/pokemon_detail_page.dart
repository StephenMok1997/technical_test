import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:technical_test/network/pokemon/models/pokemon_response.dart';

class PokemonDetailPage extends StatefulWidget {
  final int urlId;
  const PokemonDetailPage({
    super.key,
    required this.urlId,
  });

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _image(pokemon.sprites.frontDefault),
                    _sectionTitle('Pokedex Data'),
                    _dataRow(
                      'National No.',
                      pokemon.species.id.toString(),
                    ),
                    _dataRow(
                      'Name',
                      pokemon.species.name,
                    ),
                    _dataRow(
                      'Weight',
                      '${pokemon.weight / 10}kg',
                    ),
                    _dataRow(
                      'Height',
                      '${pokemon.height / 10}m',
                    ),
                    _dataRow(
                      'Type',
                      pokemon.types.map((item) => item.type.name).join(', '),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    _sectionTitle('Base Stats'),
                    ...List.generate(
                      pokemon.stats.length,
                      (index) => _dataRow(
                        pokemon.stats[index].statType.name,
                        pokemon.stats[index].value.toString(),
                      ),
                    ),
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

  Widget _image(String url) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _dataRow(
    String name,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            '$name: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }
}
