import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:technical_test/blocs/pokemon/pokemon_bloc.dart';
import 'package:technical_test/network/pokemon/models/pokemon_list_response.dart';
import 'package:technical_test/widgets/pokemon_row.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  final PagingController<int, BasicPokemon> pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();

    pagingController.addPageRequestListener(
      (int? pageKey) {
        context.read<PokemonBloc>().add(
              PokemonListFetched(limit: 120, offset: pageKey),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokemonBloc, PokemonState>(
      listener: (context, state) {
        if (state is PokemonListFetchedSuccess) {
          pagingController.appendPage(
            state.pokemons,
            state.next,
          );
        } else if (state is PokemonListFetchedNoMoreData) {
          pagingController.appendLastPage(
            state.pokemons,
          );
        } else if (state is PokemonListFetchedFailure) {
          pagingController.error = Exception();
        }
      },
      child: PagedListView<int, BasicPokemon>(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<BasicPokemon>(
          itemBuilder: (context, item, index) => PokemonRow(
            index: index,
            pokemon: item,
          ),
        ),
      ),
    );
  }
}
