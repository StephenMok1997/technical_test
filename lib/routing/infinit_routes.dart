enum InfinitRoute {
  home(
    'home',
    '/',
    'home',
  );

  final String name;
  final String path;
  final String routeKey;

  const InfinitRoute(
    this.name,
    this.path,
    this.routeKey,
  );
}
