import 'package:expense_tracker_mobile/screens/goal/v_detail_goal.dart';
import 'package:expense_tracker_mobile/screens/goal/v_new_goal.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/app_colors.dart';

class GoalScreen extends StatelessWidget {
  GoalScreen({super.key});

  final List<String> dropdownItems = ["Ongoing", "Achieved", "Expired"];
  var selectedItem = 'Ongoing'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(AddNewGoal());
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Goal',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(() {
                return buildDropdownButton(
                  title: selectedItem.value,
                  items: dropdownItems,
                  selectedItem: selectedItem.value,
                  onChanged: (value) {
                    if (value != null) {
                      selectedItem.value = value;
                    }
                  },
                );
              }),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(left: 0),
                      itemCount: 10,
                      itemBuilder: (context, index) {
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
                            color: Colors
                                .transparent, // Make the Material background transparent
                            borderRadius: BorderRadius.circular(28),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                  28), // Ensure ripple effect respects the rounded corners
                              onTap: () {
                                Get.to(() => DetailGoal());
                              },
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(28),
                                        ),
                                        width: Get.width,
                                        height: constraints.maxHeight * 0.6,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: AppColors.primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(Iconsax.music5,
                                                  color: AppColors.primaryColor,
                                                  size: 30),
                                            ),
                                            const Gap(20),
                                            const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Adopt a Kitten',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Gap(10),
                                                Text(
                                                  'Ends at Dec 12, 2024',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.grey),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 17, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Goal",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                                Text(
                                                  "500,000 Ks",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Saved",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.green),
                                                ),
                                                Text(
                                                  "+ 400,000 Ks",
                                                  style: TextStyle(
                                                      color: Colors.green),
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
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
