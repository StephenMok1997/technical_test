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

  final String name;
  final String path;
  final String routeKey;

  const InfinitRoute(
    this.name,
    this.path,
    this.routeKey,
  );
}
