import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget buildIncomeExpenseCard(
    String title, String amount, Color color, String percentText, double percentValue) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child:Row(
        children: [
          Flexible(
            child: CircularPercentIndicator(
              radius: 22.0,
              lineWidth: 3.0,
              percent: percentValue,
              animateFromLastPercent: true,
              animation: true,
              animationDuration: 2000,
              center:  Text(percentText, style: const TextStyle(fontSize: 10)),
              progressColor: color,
            ),
          ),
          const SizedBox(width: 8),
       Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],

          ),
        ],
      )

    ),
  );
}
