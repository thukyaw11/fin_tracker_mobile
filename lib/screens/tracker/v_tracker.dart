import 'package:expense_tracker_mobile/controllers/category/c_category.dart';
import 'package:expense_tracker_mobile/controllers/group/c_group.dart';
import 'package:expense_tracker_mobile/controllers/tracker/c_toggle_switch.dart';
import 'package:expense_tracker_mobile/controllers/tracker/c_wallet.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/v_add_new_transaction.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/earning_text.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/toggle_switch.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/wallet_card.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class TrackerScreen extends StatelessWidget {
  TrackerScreen({super.key}) {
    _initData();
  }

  Future<void> _initData() async {
    await _trackerController.fetchWallets();
    await _trackerController.fetchTrackerMoney();
    await _groupController.getAllGroups();
    await _categoryController.getAllCategory();
  }

  final ToggleSwitchController controller = Get.put(ToggleSwitchController());

  final TrackerController _trackerController = Get.find();
  final GroupController _groupController = Get.find();
  final CategoryController _categoryController = Get.put(CategoryController());

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    _initData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(AddNewTransaction());
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
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
                    'Tracker',
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
                          }
                        },
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                const ToggleSwitch(),
                const SizedBox(height: 30),
                Center(
                  child: Obx(() {
                    final isIncomeSelected = controller.isIncomeSelected.value;
                    final textColor =
                        isIncomeSelected ? Colors.green : Colors.red;
                    final amount = isIncomeSelected
                        ? _trackerController.totalIncome.value
                        : _trackerController.totalExpense.value;
                    return EarningText(
                        typeText:
                            isIncomeSelected ? "You Earned 💰" : "You Spent 💸",
                        fontColor: textColor,
                        amount: amount);
                  }),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Wallet",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Obx(() {
                    if (_trackerController.wallets.isEmpty) {
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
                                "No Wallet",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(left: 0),
                        itemCount: _trackerController.wallets.length,
                        itemBuilder: (context, index) {
                          final wallet = _trackerController.wallets[index];

                          return BuildWalletCard(
                            imageUrl: wallet.imageUrl ??
                                "https://cloud.farytaxi.com/uploads/parenthand/7fd3f3a0-7c14-477a-9d8a-13594044539d.jpg", // Fetch image URL from the wallet data
                            payName: wallet.walletTitle,
                            amount: wallet.walletAmount,
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
