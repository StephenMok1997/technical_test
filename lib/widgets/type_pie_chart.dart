import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:technical_test/network/pokemon/models/type/type_response.dart';
import 'package:technical_test/widgets/type_tag.dart';

class TypePieChart extends StatefulWidget {
  const TypePieChart({
    super.key,
    required this.types,
  });
  final List<TypeResponse> types;

  @override
  State<TypePieChart> createState() => _TypePieChartState();
}

class _TypePieChartState extends State<TypePieChart> {
  List<TypeResponse> get types => widget.types;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Percentage of Pokemon Type',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 30.0,
              sections: showingSections(),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    final int total = types.fold(0, (a, b) => a + b.pokemons.length);
    return List.generate(types.length, (index) {
      final bool isTouched = index == touchedIndex;
      final double fontSize = isTouched ? 20.0 : 14.0;
      final double radius = isTouched ? 120.0 : 100.0;
      final double opacity = isTouched ? 1 : 0.6;

      return PieChartSectionData(
        color: types[index].pokeType.color.withOpacity(opacity),
        value: types[index].pokemons.length.toDouble(),
        title:
            '${(types[index].pokemons.length / total * 100).toStringAsFixed(1)}%',
        radius: radius,
        titlePositionPercentageOffset: 0.7,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(opacity),
        ),
        badgePositionPercentageOffset: 1.2,
        badgeWidget: isTouched
            ? TypeTag(
                type: types[index].pokeType,
              )
            : null,
      );
    });
  }
}
