import 'package:expense_tracker_mobile/controllers/category/c_category.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/c_add_new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CategoryBottomSheet {
  static final AddNewTransactionController addNewTransactionController =
      Get.find();

  final CategoryController categoryController = Get.find();

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
      backgroundColor: Colors.transparent,
    );
  }

  List<Widget> buildCategoryItems() {
    return categoryController.categories.map((cate) {
      return Column(
        children: [
          _buildCategoryItem(
            icon: Icon(
              TablerIcons.all['user'],
              size: 30,
              color: Colors.red,
            ),
            color: Colors.red,
            text: cate.name,
            onTap: () {
              addNewTransactionController.selectCategory(cate.name, cate.id);
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
    required Icon icon,
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
            child: icon,
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
