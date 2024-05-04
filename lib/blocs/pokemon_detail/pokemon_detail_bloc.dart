import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/network/pokemon/models/pokemon_response.dart';
import 'package:technical_test/repositories/pokemon_repository.dart';

part 'pokemon_detail_event.dart';
part 'pokemon_detail_state.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {
  PokemonDetailBloc(
    BuildContext context,
  ) : super(PokemonDetailInitial()) {
    on<PokemonDetailEvent>((event, emit) async {
      if (event is PokemonFetched) {
        await _pokemonFetched(event, emit, context);
      }
    });
  }

  Future<void> _pokemonFetched(
    PokemonFetched event,
    Emitter<PokemonDetailState> emit,
    BuildContext context,
  ) async {
    try {
      emit(
        PokemonFetchedLoading(),
      );
      final PokemonRepository pokemonRepository =
          context.read<PokemonRepository>();

      final PokemonResponse response = await pokemonRepository.getPokemonById(
        id: event.urlId,
      );

      emit(
        PokemonFetchedSuccess(
          pokemon: response,
        ),
      );
    } catch (e) {
      emit(
        PokemonFetchedFailure(),
      );
    }
  }
}
