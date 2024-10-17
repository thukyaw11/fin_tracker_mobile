import 'package:flutter/material.dart';
import 'build_drop_down_button.dart';

class MonthSelectorWidget extends StatefulWidget {
  const MonthSelectorWidget({super.key, required this.onSelect});
  final Function(String, String) onSelect;

  @override
  State<MonthSelectorWidget> createState() => _MonthSelectorWidgetState();
}

class _MonthSelectorWidgetState extends State<MonthSelectorWidget> {
  String selectedMonth = '';
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  @override
  void initState() {
    // auto select current month
    selectedMonth = months[DateTime.now().month - 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildDropdownButton(
      title: '',
      items: months,
      selectedItem: selectedMonth,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            selectedMonth = newValue;
            _onMonthSelect(selectedMonth);
          });
        }
      },
    );
  }

  void _onMonthSelect(String month) {
    final now = DateTime.now();
    final monthIndex = months.indexOf(month) + 1;

    final startDate = DateTime(now.year, monthIndex, 1);
    final endDate = DateTime(now.year, monthIndex + 1, 0);

    final String startDateInIso = '${startDate.toIso8601String()}Z';
    final String endDateInIso = '${endDate.toIso8601String()}Z';

    widget.onSelect(startDateInIso, endDateInIso);
  }
}
