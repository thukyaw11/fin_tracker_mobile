import 'package:expense_tracker_mobile/controllers/goal/c_goal.dart';
import 'package:expense_tracker_mobile/screens/goal/v_new_goal.dart';
import 'package:expense_tracker_mobile/screens/goal/widgets/goal_card.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_colors.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({super.key});

  final GoalController controller = Get.put(GoalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: addButton(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [appBarText(), dropDown(), goals()],
          ),
        ),
      ),
    );
  }

  Widget appBarText() {
    return const Center(
      child: Text(
        'Goal',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget dropDown() {
    return Obx(() {
      return buildDropdownButton(
        title: "select",
        items: EnumGoalType.values.map((e) => e.name).toList(),
        selectedItem: controller.selectedType.value.name,
        onChanged: (value) {
          if (value != null) {
            Logger.superPrint(value);
            controller.selectedType.value = getEnumOnString(value);
            controller.getGoals();
          }
        },
      );
    });
  }

  Widget goals() {
    return Expanded(
      child: Obx(() {
        return controller.goals.isEmpty
            ? const Center(child: Text("Empty!"))
            : RefreshIndicator(
                onRefresh: () async {
                  await controller.getGoals();
                },
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.goals.length,
                    itemBuilder: (context, index) {
                      return EachGoalCard(eachGoal: controller.goals[index]);
                    }),
              );
      }),
    );
  }

  Widget addButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        Get.to(AddNewGoal());
      },
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  EnumGoalType getEnumOnString(String name) {
    EnumGoalType type = EnumGoalType.ongoing;

    switch (name.toString().toUpperCase()) {
      case "ONGOING":
        type = EnumGoalType.ongoing;
      case "ACHIEVED":
        type = EnumGoalType.achieved;
      case "EXPIRED":
        type = EnumGoalType.expired;
    }
    return type;
  }
}
