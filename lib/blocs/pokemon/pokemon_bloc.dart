import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/network/pokemon/models/pokemon_list_response.dart';
import 'package:technical_test/repositories/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc(
    BuildContext context,
  ) : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      if (event is PokemonListFetched) {
        await _pokemonListFetched(event, emit, context);
      }
    });
  }

  Future<void> _pokemonListFetched(
    PokemonListFetched event,
    Emitter<PokemonState> emit,
    BuildContext context,
  ) async {
    try {
      final PokemonRepository pokemonRepository =
          context.read<PokemonRepository>();

      final PokemonListResponse response =
          await pokemonRepository.getPokemonList(
        offset: event.offset,
        limit: event.limit,
      );

      if (response.next == null) {
        emit(
          PokemonListFetchedNoMoreData(
            count: response.count,
            pokemons: response.results,
          ),
        );
      } else {
        emit(
          PokemonListFetchedSuccess(
            count: response.count,
            pokemons: response.results,
            next: response.next,
          ),
        );
      }
    } catch (e) {
      emit(
        PokemonListFetchedFailure(),
      );
    }
  }
}
