import 'package:flutter/material.dart';

class EarningText extends StatelessWidget {
  final String typeText;
  final Color fontColor;
  final double amount;

  const EarningText({
    super.key,
    required this.typeText,
    required this.fontColor,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          typeText,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: fontColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${amount.toStringAsFixed(0)} KS',
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
