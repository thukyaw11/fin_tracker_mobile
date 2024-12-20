import 'package:expense_tracker_mobile/controllers/navigation/c_navigation.dart';
import 'package:expense_tracker_mobile/controllers/transaction/c_transaction.dart';
import 'package:expense_tracker_mobile/screens/alert/v_alert.dart';
import 'package:expense_tracker_mobile/screens/goal/v_goal.dart';
import 'package:expense_tracker_mobile/screens/home/v_home.dart';
import 'package:expense_tracker_mobile/screens/profile/v_profile.dart';
import 'package:expense_tracker_mobile/screens/tracker/v_tracker.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());
    //
    final List<Widget> pages = [
      const HomeScreen(),
      TrackerScreen(),
      GoalScreen(),
      const ProfileScreen(),
    ];

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          bottomNavigationBar: Obx(
            () => SalomonBottomBar(
              currentIndex: navController.currentIndex.value,
              onTap: (index) {
                navController.changeIndex(index);
              },
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.home),
                  title: const Text("Home"),
                  selectedColor: AppColors.primaryColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.transaction_minus),
                  title: const Text("Tracker"),
                  selectedColor: AppColors.primaryColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.money),
                  title: const Text("Goal"),
                  selectedColor: AppColors.primaryColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Iconsax.user),
                  title: const Text("Profile"),
                  selectedColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
          body: Obx(
            () => pages[navController.currentIndex.value],
          )),
    );
  }
}
