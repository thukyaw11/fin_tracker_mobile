import 'package:expense_tracker_mobile/controllers/group/c_group.dart';
import 'package:expense_tracker_mobile/controllers/transaction/c_transaction.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_date_tabs.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_income_expense_card.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_transaction_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    _initData();
  }

  Future<void> _initData() async {
    await _transactionController.fetchTransactions();
    await _groupController.getAllGroups();
  }

  final TransactionController _transactionController =
      Get.put(TransactionController());
  final GroupController _groupController = Get.put(GroupController());

  final List<String> dropdownItems = ["Personal", "Business", "Savings"];
  var selectedItem = 'Personal'.obs;

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
                Obx(() {
                  if (_groupController.isLoading.value) {
                    return const CircularProgressIndicator();
                  }

                  List<String> dropdownItems =
                      _groupController.groups.map((gp) => gp.name).toList();

                  final selectedItem = _groupController.selectedGroupName.value;

                  return buildDropdownButton(
                    title: selectedItem,
                    items: dropdownItems,
                    selectedItem: selectedItem,
                    onChanged: (value) {
                      if (value != null) {
                        _groupController.selectedGroupName.value = value;
                      }
                    },
                  );
                }),
                Obx(() {
                  return buildDropdownButton(
                    title: selectedItem.value,
                    items: dropdownItems,
                    selectedItem: selectedItem.value,
                    onChanged: (value) {
                      if (value != null) {
                        selectedItem.value = value;
                      }
                    },
                  );
                }),
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
            // buildDateTabs(),
            const SizedBox(height: 20),
            const Text(
              'Recent Transaction',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Obx(() {
              if (_transactionController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Column(
                  children: _transactionController.transactionRecords
                      .map((transaction) {
                    DateTime adjustedTime = transaction.createdAt
                        .add(const Duration(hours: 6, minutes: 30));
                    String formattedTime =
                        DateFormat('h:mm a').format(adjustedTime);

                    return buildTransactionItem(
                      transaction.cashCategory.name,
                      '${transaction.type == 'INCOME' ? '+' : '-'} ${transaction.amount.toString()} ks',
                      transaction.title,
                      Icons.wallet,
                      transaction.type == "INCOME" ? Colors.green : Colors.red,
                      formattedTime,
                    );
                  }).toList(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
