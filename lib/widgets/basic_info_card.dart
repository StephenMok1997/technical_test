import 'package:flutter/material.dart';
import 'package:technical_test/widgets/shadow_container.dart';

class BasicInfoCard extends StatelessWidget {
  const BasicInfoCard({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
