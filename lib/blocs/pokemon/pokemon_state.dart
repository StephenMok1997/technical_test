part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}

final class PokemonListFetchedLoading extends PokemonState {}

final class PokemonListFetchedSuccess extends PokemonState {
  PokemonListFetchedSuccess({
    this.previous,
    this.next,
    this.count = 0,
    this.pokemons = const [],
  });

  final List<BasicPokemon> pokemons;
  final int count;
  final int? previous;
  final int? next;
}

final class PokemonListFetchedNoMoreData extends PokemonState {
  PokemonListFetchedNoMoreData({
    this.count = 0,
    this.pokemons = const [],
  });

  final List<BasicPokemon> pokemons;
  final int count;
}

final class PokemonListFetchedFailure extends PokemonState {}
