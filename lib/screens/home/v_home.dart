import 'package:expense_tracker_mobile/controllers/group/c_group.dart';
import 'package:expense_tracker_mobile/controllers/transaction/c_transaction.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_income_expense_card.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_transaction_items.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/w_month_drop_down.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_mobile/utils/helpers/num_format.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    _initData();
    super.initState();
  }

  final TransactionController _transactionController = Get.find();

  final GroupController _groupController = Get.find();

  final List<String> dropdownItems = ["Personal", "Business", "Savings"];

  var selectedItem = 'Personal'.obs;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<void> _initData() async {
    await _groupController.getAllGroups();
    await Future.wait([
      _transactionController.fetchTransactions(),
      _transactionController.fetchIncomeExpense()
    ]);
  }

  void _onRefresh() async {
    _initData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        header: const WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
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

                    final selectedItem =
                        _groupController.selectedGroupName.value;

                    return buildDropdownButton(
                      title: selectedItem,
                      items: dropdownItems,
                      selectedItem: selectedItem,
                      onChanged: (value) {
                        if (value != null) {
                          _groupController.selectedGroupName.value = value;
                          _groupController.selectedGroupId.value =
                              _groupController.groups
                                  .where((a) => a.name == value)
                                  .first
                                  .id;
                          _transactionController.fetchIncomeExpense();
                        }
                      },
                    );
                  }),
                  MonthSelectorWidget(onSelect: (start, end) {
                    _transactionController.startDate = start;
                    _transactionController.endDate = end;
                    _transactionController.fetchIncomeExpense();
                  })
                ],
              ),
              const SizedBox(height: 20),
              Obx(() => Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 7,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      Column(
                        children: [
                          const Text(
                            'Total Income',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '${formatNumber(_transactionController.totalIncome.value)} Ks',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              Obx(() {
                final netAmount = _transactionController.totalIncome.value -
                    _transactionController.totalExpense.value;

                final totalIncome = _transactionController.totalIncome.value;
                final expenseAmount = _transactionController.totalExpense.value;

                final netPercentage =
                    totalIncome > 0 ? (netAmount / totalIncome) * 100 : 0;
                final expensePercentage =
                    totalIncome > 0 ? (expenseAmount / totalIncome) * 100 : 0;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildIncomeExpenseCard(
                      'Net Amount',
                      '${formatNumber(_transactionController.totalIncome.value - _transactionController.totalExpense.value)} Ks',
                      Colors.green,
                      '${netPercentage.toStringAsFixed(0)} %',
                      netPercentage / 100,
                    ),
                    const SizedBox(width: 16),
                    buildIncomeExpenseCard(
                      'Expenses',
                      '${formatNumber(_transactionController.totalExpense.value)} Ks',
                      Colors.red,
                      '${expensePercentage.toStringAsFixed(0)} %',
                      expensePercentage / 100,
                    ),
                  ],
                );
              }),

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

                if (_transactionController.transactionRecords.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Iconsax.empty_wallet,
                            color: Colors.grey,
                            size: 50,
                          ),
                          Gap(20),
                          Text(
                            "No Record",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: _transactionController.transactionRecords.length,
                    itemBuilder: (context, index) {
                      final transaction =
                          _transactionController.transactionRecords[index];
                      DateTime adjustedTime = transaction.createdAt
                          .add(const Duration(hours: 6, minutes: 30));
                      String formattedTime =
                          DateFormat('h:mm a').format(adjustedTime);

                      return buildTransactionItem(
                        transaction.cashCategory.name,
                        '${transaction.type == 'INCOME' ? '+' : '-'} ${formatNumber(transaction.amount).toString()} ks',
                        transaction.title,
                        Icons.wallet,
                        transaction.type == "INCOME"
                            ? Colors.green
                            : Colors.red,
                        formattedTime,
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
