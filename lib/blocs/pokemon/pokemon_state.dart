part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}

final class PokemonListFetchedLoading extends PokemonState {}

final class PokemonListFetchedSuccess extends PokemonState {
  final List<BasicPokemon> pokemons;
  final int count;
  final int? previous;
  final int? next;

  PokemonListFetchedSuccess({
    this.previous,
    this.next,
    this.count = 0,
    this.pokemons = const [],
  });
}

final class PokemonListFetchedNoMoreData extends PokemonState {
  final List<BasicPokemon> pokemons;
  final int count;

  PokemonListFetchedNoMoreData({
    this.count = 0,
    this.pokemons = const [],
  });
}

final class PokemonListFetchedFailure extends PokemonState {}
