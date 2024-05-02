import 'package:go_router/go_router.dart';
import 'package:technical_test/views/home/home_page.dart';
import 'package:technical_test/routing/infinit_routes.dart';

class AppRoutes {
  static final List<GoRoute> routes = [
    homeRoute,
  ];

  static final GoRoute homeRoute = GoRoute(
    path: InfinitRoute.home.path,
    name: InfinitRoute.home.name,
    builder: (context, state) => const HomePage(),
  );
}
