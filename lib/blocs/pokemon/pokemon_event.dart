part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {}

class PokemonListFetched extends PokemonEvent {
  PokemonListFetched({
    this.offset,
    this.limit,
  });

  final int? offset;
  final int? limit;
}
