import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/type/type_list_response.dart';
import 'package:technical_test/network/pokemon/models/type/type_response.dart';
import 'package:technical_test/repositories/pokemon_repository.dart';

part 'type_event.dart';
part 'type_state.dart';

class TypeBloc extends Bloc<TypeEvent, TypeState> {
  TypeBloc(
    BuildContext context,
  ) : super(TypeInitial()) {
    on<TypeEvent>((event, emit) async {
      if (event is TypeFetched) {
        await _typeFetched(event, emit, context);
      }
    });
  }

  Future<void> _typeFetched(
    TypeFetched event,
    Emitter<TypeState> emit,
    BuildContext context,
  ) async {
    try {
      emit(
        TypeFetchedLoading(),
      );
      final PokemonRepository pokemonRepository =
          context.read<PokemonRepository>();
      final TypeListResponse response = await pokemonRepository.getTypeList(
        limit: event.limit,
        offset: event.offset,
      );

      final List<TypeResponse> types = await Future.wait(
        List.generate(
          response.count,
          (index) => pokemonRepository.getTypeById(
              id: response.results[index].urlIndex),
        ),
      );

      final TypeResponse highestType = types.reduce(
        (currentHighest, next) =>
            next.pokemons.length > currentHighest.pokemons.length
                ? next
                : currentHighest,
      );

      emit(
        TypeFetchedSuccess(
          types: types,
          total: response.count,
          highestType: highestType.pokeType,
        ),
      );
    } catch (e) {
      emit(
        TypeFetchedFailure(),
      );
    }
  }
}
