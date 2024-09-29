import 'package:flutter/material.dart';

Widget buildDropdownButton({
  required String title,
  required List<String> items,
  required String selectedItem,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 0.5),
      borderRadius: BorderRadius.circular(30),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedItem,
        icon: const Icon(Icons.arrow_drop_down),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
