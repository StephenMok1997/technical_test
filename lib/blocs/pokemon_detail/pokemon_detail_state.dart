part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailState {}

final class PokemonDetailInitial extends PokemonDetailState {}

final class PokemonFetchedLoading extends PokemonDetailState {}

final class PokemonFetchedSuccess extends PokemonDetailState {
  final PokemonResponse pokemon;
  PokemonFetchedSuccess({
    required this.pokemon,
  });
}

final class PokemonFetchedFailure extends PokemonDetailState {}
