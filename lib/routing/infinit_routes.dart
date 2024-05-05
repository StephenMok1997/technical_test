enum InfinitRoute {
  home(
    'home',
    '/',
    'home',
  ),
  pokemonDetail(
    'pokemonDetail',
    '/pokemonDetail/:urlId',
    'pokemon-detail',
  );

  const InfinitRoute(
    this.name,
    this.path,
    this.routeKey,
  );

  final String name;
  final String path;
  final String routeKey;
}
