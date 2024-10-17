import 'package:expense_tracker_mobile/screens/add_new_transaction/c_add_new_transaction.dart';
import 'package:expense_tracker_mobile/utils/enums/transaction_type.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TransactionTypeBottomSheet {
  static final AddNewTransactionController addNewTransactionController =
      Get.find();

  void show() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.4,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Transaction Type",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                _buildTransactionTypeItem(
                    icon: Iconsax.money,
                    color: Colors.green,
                    text: 'Income',
                    onTap: () {
                      addNewTransactionController.selectedType.value =
                          TransactionType.INCOME;
                      Get.back();
                    }),
                const Gap(20),
                _buildTransactionTypeItem(
                    icon: Iconsax.money,
                    color: Colors.red,
                    text: 'Expense',
                    onTap: () {
                      addNewTransactionController.selectedType.value =
                          TransactionType.EXPENSE;
                      Get.back();
                    }),
              ],
            )
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
    );
  }

  static Widget _buildTransactionTypeItem({
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
