import 'package:expense_tracker_mobile/controllers/goal/c_goal.dart';
import 'package:expense_tracker_mobile/controllers/goal/m_goal_model.dart';
import 'package:expense_tracker_mobile/utils/services/format_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/app_colors.dart';
import 'package:get/get.dart';
import '../v_detail_goal.dart';

class EachGoalCard extends StatelessWidget {
  const EachGoalCard({super.key, required this.eachGoal});
  final GoalModel eachGoal;
  // expired red, achieved green, ongoing theme accent

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: AppColors.accentColor,
      ),
      width: Get.width,
      height: 160,
      child: Material(
        color: Colors.transparent, // Make the Material background transparent
        borderRadius: BorderRadius.circular(28),
        child: InkWell(
          borderRadius: BorderRadius.circular(
              28), // Ensure ripple effect respects the rounded corners
          onTap: () {
            Get.to(() => DetailGoal(
                  selectedGoal: eachGoal,
                ));
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    width: Get.width,
                    height: constraints.maxHeight * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: getColorOnType().withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Iconsax.music5,
                              color: getColorOnType(), size: 30),
                        ),
                        const Gap(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eachGoal.title,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const Gap(10),
                            Text(
                              eachGoal.deadLine,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Goal",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: getColorOnType()),
                            ),
                            Text(
                              "${FormatService.numberFormat.format(eachGoal.amount)} Ks",
                              style: const TextStyle(
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Saved",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.green),
                            ),
                            Text(
                              "+ ${FormatService.numberFormat.format(eachGoal.savedAmount)} Ks",
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Color getColorOnType() {
    Color color = AppColors.primaryColor;
    switch (eachGoal.status) {
      case EnumGoalType.ongoing:
        color = AppColors.primaryColor;
      case EnumGoalType.achieved:
        color = Colors.green;
      case EnumGoalType.expired:
        color = Colors.red;
    }
    return color;
  }
}
