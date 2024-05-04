part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailEvent {}

class PokemonFetched extends PokemonDetailEvent {
  final int urlId;

  PokemonFetched({
    required this.urlId,
  });
}
