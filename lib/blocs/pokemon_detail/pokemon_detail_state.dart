part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailState {}

final class PokemonDetailInitial extends PokemonDetailState {}

final class PokemonFetchedLoading extends PokemonDetailState {}

final class PokemonFetchedSuccess extends PokemonDetailState {
  PokemonFetchedSuccess({
    required this.pokemon,
  });

  final PokemonResponse pokemon;
}

final class PokemonFetchedFailure extends PokemonDetailState {}
