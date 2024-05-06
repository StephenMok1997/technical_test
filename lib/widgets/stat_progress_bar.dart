import 'package:flutter/material.dart';

import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/pokemon/statistic_data.dart';

class StatProgressBar extends StatelessWidget {
  const StatProgressBar({
    super.key,
    required this.stat,
    required this.type,
  });

  final StatisticData stat;
  final PokeType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              stat.statType.pokeStat.abbv,
            ),
          ),
          Expanded(
            child: Text(
              stat.value.toString(),
            ),
          ),
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: LinearProgressIndicator(
                value: stat.value / 100,
                color: type.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
