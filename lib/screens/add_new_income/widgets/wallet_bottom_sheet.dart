import 'package:expense_tracker_mobile/controllers/tracker/c_wallet.dart';
import 'package:expense_tracker_mobile/screens/add_new_income/c_add_new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WalletBottomSheet {
  static final AddNewTransactionController addNewTransactionController =
      Get.find();

  final TrackerController trackerController = Get.find();

  void show() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Use max size to expand the height
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Wallet",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: buildCategoryItems(),
            ),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  List<Widget> buildCategoryItems() {
    return trackerController.wallets.map((wallet) {
      return Column(
        children: [
          _buildCategoryItem(
            icon: Iconsax.money5,
            color: Colors.red,
            text: wallet.walletTitle,
            onTap: () {
              addNewTransactionController.selectedCategory.value =
                  wallet.walletTitle;
              Get.back();
            },
          ),
          const SizedBox(height: 20),
        ],
      );
    }).toList();
  }

  // Method to build a category item
  static Widget _buildCategoryItem({
    required IconData icon,
    required Color color,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const Gap(20),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
