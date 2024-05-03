part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {}

class PokemonListFetched extends PokemonEvent {
  final int? offset;
  final int? limit;

  PokemonListFetched({
    this.offset,
    this.limit,
  });
}
