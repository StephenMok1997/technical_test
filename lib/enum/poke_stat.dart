enum PokeStat {
  hp('hp', 'HP'),
  attack('attack', 'ATK'),
  defense('defense', 'DEF'),
  specialAttack('special-attack', 'SP ATK'),
  specialDefense('special-defense', 'SP DEF'),
  speed('speed', 'Speed');

  const PokeStat(
    this.name,
    this.abbv,
  );

  final String name;
  final String abbv;
}
