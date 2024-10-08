import 'package:expense_tracker_mobile/utils/helpers/num_format.dart';
import 'package:flutter/material.dart';

class EarningText extends StatelessWidget {
  final String typeText;
  final Color fontColor;
  final int amount;

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
          '${formatNumber(amount)} Ks',
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
