import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test/repositories/pokemon_repository.dart';

class RepositoryProviders {
  static final List<RepositoryProvider> providers = [
    RepositoryProvider<PokemonRepository>(create: (_) => PokemonRepository()),
  ];
}
