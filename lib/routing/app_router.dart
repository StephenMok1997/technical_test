import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_test/routing/app_routes.dart';
import 'package:technical_test/routing/infinit_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: InfinitRoute.home.path,
    debugLogDiagnostics: true,
    routes: AppRoutes.routes,
    observers: [],
  );

  static BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;
}
