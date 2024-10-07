import 'package:expense_tracker_mobile/screens/add_new_income/c_add_new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GroupBottomSheet {
  static final AddNewTransactionController addNewTransactionController = Get.find();

  static void show() {
    Get.bottomSheet(
      Container(
        height: Get.height * 0.7, // Set the height of the bottom sheet to 70% of the screen height
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, // Use max size to expand the height
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Select Group",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildCategoryItem(
                    icon: Iconsax.money5,
                    color: Colors.orange,
                    text: "Cash",
                    onTap: () {
                      addNewTransactionController.selectedCategory.value = 'Cash';
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    icon: Iconsax.money5,
                    color: Colors.purple,
                    text: "Paypal",
                    onTap: () {
                      addNewTransactionController.selectedCategory.value = 'Paypal';
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    icon: Iconsax.car5,
                    color: Colors.blue,
                    text: "Transportation",
                    onTap: () {
                      addNewTransactionController.selectedCategory.value = 'Transportation';
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    icon: Iconsax.cake5,
                    color: Colors.red,
                    text: "KBZ Pay",
                    onTap: () {
                      addNewTransactionController.selectedCategory.value = 'KBZ Pay';
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    icon: Iconsax.cake5,
                    color: Colors.red,
                    text: "AYA M Banking",
                    onTap: () {
                      addNewTransactionController.selectedCategory.value = 'AYA M Banking';
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildCategoryItem(
                    icon: Iconsax.cake5,
                    color: Colors.red,
                    text: "AYA Pay",
                    onTap: () {
                      addNewTransactionController.selectedCategory.value = 'AYA Pay';
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
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
