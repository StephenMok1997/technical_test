import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:numerus/roman/roman.dart';
import 'package:technical_test/enum/poke_type.dart';
import 'package:technical_test/network/pokemon/models/generation/generation_response.dart';

class GenerationBarChart extends StatelessWidget {
  const GenerationBarChart({
    super.key,
    required this.generations,
  });
  final List<GenerationResponse> generations;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'No. of Pokemon per Generation',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: BarChart(
            BarChartData(
              barTouchData: _barTouchData(),
              titlesData: _flTitleData(),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              barGroups: _barGroups(),
              maxY: 200,
            ),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _barGroups() {
    return List.generate(
      generations.length,
      (index) => BarChartGroupData(
        x: generations[index].id,
        showingTooltipIndicators: [0],
        barRods: [
          BarChartRodData(
            width: 12.0,
            toY: generations[index].pokemonSpecies.length.toDouble(),
            color: PokeType.values[index].color,
          ),
        ],
      ),
    );
  }

  FlTitlesData _flTitleData() {
    return FlTitlesData(
      leftTitles: const AxisTitles(),
      rightTitles: const AxisTitles(),
      topTitles: const AxisTitles(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            return SideTitleWidget(
              axisSide: meta.axisSide,
              space: 16,
              child: Text(
                value.toInt().toRomanNumeralString() ?? '',
              ),
            );
          },
          reservedSize: 42,
        ),
      ),
    );
  }

  BarTouchData _barTouchData() {
    return BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (group) => Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            TextStyle(
              color: rod.color,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}
