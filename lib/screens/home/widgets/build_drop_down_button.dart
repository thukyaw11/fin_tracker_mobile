import 'package:flutter/material.dart';

Widget buildDropdownButton(String title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 0.5),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const Icon(Icons.arrow_drop_down),
      ],
    ),
  );
}
