part of 'pokemon_detail_bloc.dart';

@immutable
sealed class PokemonDetailEvent {}

class PokemonFetched extends PokemonDetailEvent {
  PokemonFetched({
    required this.urlId,
  });

  final int urlId;
}
