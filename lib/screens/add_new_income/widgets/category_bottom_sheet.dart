import 'package:expense_tracker_mobile/screens/add_new_income/c_add_new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CategoryBottomSheet {
  static final AddNewTransactionController addNewTransactionController =
      Get.find();

  static void show() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Category",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildCategoryItem(
              icon: Iconsax.shop5,
              color: Colors.orange,
              text: "Shopping",
              onTap: () {
                addNewTransactionController.selectedCategory.value = 'Shopping';
                Get.back();
              },
            ),
            const SizedBox(height: 20),
            _buildCategoryItem(
              icon: Iconsax.money5,
              color: Colors.purple,
              text: "Subscription",
              onTap: () {
                addNewTransactionController.selectedCategory.value =
                    'Subscription';
                Get.back();
              },
            ),
            const SizedBox(height: 20),
            _buildCategoryItem(
              icon: Iconsax.car5,
              color: Colors.blue,
              text: "Transportation",
              onTap: () {
                addNewTransactionController.selectedCategory.value =
                    'Transportation';
                Get.back();
              },
            ),
            const SizedBox(height: 20),
            _buildCategoryItem(
              icon: Iconsax.cake5,
              color: Colors.red,
              text: "Food",
              onTap: () {
                addNewTransactionController.selectedCategory.value = 'Food';

                Get.back(); // Close the bottom sheet if needed
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
    );
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
