import 'package:expense_tracker_mobile/controllers/tracker/toggle_switch_controller.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final ToggleSwitchController controller =
        Get.find(); // Retrieve the controller

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSwitchButton(
                label: 'Income',
                isSelected: controller.isIncomeSelected.value,
                onTap: () => controller.toggle(true),
              ),
              _buildSwitchButton(
                label: 'Expense',
                isSelected: !controller.isIncomeSelected.value,
                onTap: () => controller.toggle(false),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSwitchButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
