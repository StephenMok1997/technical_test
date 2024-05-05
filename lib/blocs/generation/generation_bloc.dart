import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_list_response.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_response.dart';
import 'package:technical_test/repositories/pokemon_repository.dart';

part 'generation_event.dart';
part 'generation_state.dart';

class GenerationBloc extends Bloc<GenerationEvent, GenerationState> {
  GenerationBloc(
    BuildContext context,
  ) : super(GenerationInitial()) {
    on<GenerationEvent>((event, emit) async {
      if (event is GenerationFetched) {
        await _generationFetched(event, emit, context);
      }
    });
  }
  Future<void> _generationFetched(
    GenerationFetched event,
    Emitter<GenerationState> emit,
    BuildContext context,
  ) async {
    try {
      emit(
        GenerationFetchedLoading(),
      );
      final PokemonRepository pokemonRepository =
          context.read<PokemonRepository>();
      final GenerationListResponse response =
          await pokemonRepository.getGeneration();

      final List<GenerationResponse> generations = await Future.wait(
        List.generate(
          response.count,
          (index) => pokemonRepository.getGenerationById(id: index + 1),
        ),
      );
      emit(
        GenerationFetchedSuccess(
          generations: generations,
          total: generations.fold(0, (a, b) => a + b.pokemonSpecies.length),
        ),
      );
    } catch (e) {
      emit(
        GenerationFetchedFailure(),
      );
    }
  }
}
