import 'package:flutter/material.dart';
import 'package:technical_test/enum/poke_type.dart';

class TypeTag extends StatelessWidget {
  const TypeTag({
    super.key,
    required this.type,
  });

  final PokeType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      decoration: ShapeDecoration(
        color: type.color.withOpacity(0.2),
        shape: const StadiumBorder(),
      ),
      child: Text(
        type.name,
        style: TextStyle(
          color: type.color,
        ),
      ),
    );
  }
}
