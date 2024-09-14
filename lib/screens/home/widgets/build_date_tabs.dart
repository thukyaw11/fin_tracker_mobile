import 'package:flutter/material.dart';

Widget buildDateTabs() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      buildDateTab('Today', true),
      buildDateTab('Week', false),
      buildDateTab('Month', false),
      buildDateTab('Year', false),
    ],
  );
}

Widget buildDateTab(String title, bool isActive) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: isActive ? const Color(0xFFFCEED4) : Colors.transparent,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: isActive ? const Color(0xFFFCAC12) : Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
