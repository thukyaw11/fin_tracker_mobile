import 'package:expense_tracker_mobile/controllers/navigation/navigation_controller.dart';
import 'package:expense_tracker_mobile/screens/home/home.dart';
import 'package:expense_tracker_mobile/screens/profile/profile.dart';
import 'package:expense_tracker_mobile/screens/tracker/tracker.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());

    final List<Widget> pages = [
      const HomeScreen(),
      TrackerScreen(),
      const HomeScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: navController.currentIndex.value,
          onTap: (index) {
            navController.changeIndex(index);
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: AppColors.primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.track_changes_rounded),
              title: const Text("Tracker"),
              selectedColor: AppColors.primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.golf_course_sharp),
              title: const Text("Goal"),
              selectedColor: AppColors.primaryColor,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
      body: Obx(
        () => pages[
            navController.currentIndex.value], // Directly switch between pages
      ),
    );
  }
}
