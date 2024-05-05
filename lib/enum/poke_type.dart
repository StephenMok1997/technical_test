import 'package:flutter/material.dart';

enum PokeType {
  fire('Fire', Color(0xFFFB6C6C)),
  water('Water', Color(0xFF7AC7FF)),
  grass('Grass', Color(0xFF78C850)),
  normal('Normal', Color(0xFFBCBCAD)),
  fighting('Fighting', Color(0xFFA75544)),
  flying('Flying', Color(0xFFA890F0)),
  poison('Poison', Color(0xFF98558E)),
  ground('Ground', Color(0xFFEECE5A)),
  bug('Bug', Color(0xFF48D0B0)),
  rock('Rock', Color(0xFFBCBCAD)),
  ghost('Ghost', Color(0xFF7C538C)),
  steel('Steel', Color(0xFFC4C2DB)),
  electric('Electric', Color(0xFFFEE53C)),
  psychic('Psychic', Color(0xFFF160AA)),
  ice('Ice', Color(0xFF96F1FF)),
  dragon('Dragon', Color(0xFF7038F8)),
  dark('Dark', Color(0xFF8F6955)),
  fairy('Fairy', Color(0xFFF9ACFF)),
  stellar('Stellar', Color(0xFF78C850)),
  unknown('Unknown', Color(0xFF000000));

  const PokeType(
    this.name,
    this.color,
  );

  final String name;
  final Color color;
}
