import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:technical_test/views/home/home_page.dart';
import 'package:technical_test/routing/infinit_routes.dart';
import 'package:technical_test/views/pokemon_detail/pokemon_detail_page.dart';

class AppRoutes {
  static final List<GoRoute> routes = [
    homeRoute,
    pokemonDetailRoute,
  ];

  static final GoRoute homeRoute = GoRoute(
    path: InfinitRoute.home.path,
    name: InfinitRoute.home.name,
    builder: (context, state) => const HomePage(),
  );

  static final GoRoute pokemonDetailRoute = GoRoute(
    path: InfinitRoute.pokemonDetail.path,
    name: InfinitRoute.pokemonDetail.name,
    builder: (context, state) {
      final int urlId = int.tryParse(state.pathParameters['urlId'] ?? '') ?? 1;
      return BlocProvider(
        create: PokemonDetailBloc.new,
        child: PokemonDetailPage(
          urlId: urlId,
        ),
      );
    },
  );
}
