import 'package:expense_tracker_mobile/screens/home/widgets/build_date_tabs.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_income_expense_card.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_transaction_items.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDropdownButton('Personal'),
                buildDropdownButton('October'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIncomeExpenseCard(
                    'Income', '480,000 Ks', Colors.green, Icons.arrow_downward),
                const SizedBox(width: 16),
                buildIncomeExpenseCard(
                    'Expenses', '50,000 Ks', Colors.red, Icons.arrow_upward),
              ],
            ),
            const SizedBox(height: 20),
            buildDateTabs(),
            const SizedBox(height: 20),
            const Text(
              'Recent Transaction',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            buildTransactionItem('Shopping', '- 40,000 Ks', 'Buy Present',
                Icons.shopping_bag, Colors.orange, '1:00 PM'),
            buildTransactionItem(
                'Subscription',
                '+ 40,000 Ks',
                'Disney+ Annual..',
                Icons.subscriptions,
                Colors.purple,
                '03:30 PM'),
            buildTransactionItem('Food', '- 10,000 Ks', 'Buy a ramen',
                Icons.restaurant, Colors.red, '07:30 PM'),
          ],
        ),
      ),
    );
  }
}