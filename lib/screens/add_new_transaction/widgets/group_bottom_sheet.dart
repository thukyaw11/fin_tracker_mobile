import 'package:expense_tracker_mobile/controllers/group/c_group.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/c_add_new_transaction.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class GroupBottomSheet {
  static final AddNewTransactionController addNewTransactionController =
      Get.find();

  final GroupController groupController = Get.find();

  void show() {
    Logger.superPrint(groupController.groups);
    Get.bottomSheet(
      Container(
        height: Get.height * 0.7,
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
                children: buildGroupItems(),
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

  List<Widget> buildGroupItems() {
    return groupController.groups.map((group) {
      return Column(
        children: [
          _buildCategoryItem(
            icon: Iconsax.money5,
            color: Colors.orange,
            text: group.name,
            onTap: () {
              addNewTransactionController.selectGroup(group.name, group.id);
              Get.back();
            },
          ),
          const SizedBox(height: 20),
        ],
      );
    }).toList();
  }

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
