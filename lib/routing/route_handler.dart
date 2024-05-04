import 'package:go_router/go_router.dart';
import 'package:technical_test/routing/app_router.dart';
import 'package:technical_test/routing/app_routes.dart';

class RouteHandler {
  static void goPokemonDetailPage({
    bool isReplace = false,
    required int urlId,
  }) {
    AppRouter.context.pushNamed(
      AppRoutes.pokemonDetailRoute.name!,
      pathParameters: {
        'urlId': urlId.toString(),
      },
    );
  }
}
