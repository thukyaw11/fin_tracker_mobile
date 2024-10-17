import 'package:expense_tracker_mobile/screens/profile/v_about.dart';
import 'package:expense_tracker_mobile/screens/profile/v_about.dart';
import 'package:expense_tracker_mobile/screens/profile/v_help.dart';
import 'package:expense_tracker_mobile/screens/profile/w_app_bar_widget.dart';
import 'package:expense_tracker_mobile/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "Settings"),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
        child: Column(
          children: [
            eachContents(
                des: "About",
                onTap: () {
                  Get.to(() => const AboutPage(),
                      transition: AppConstants.pageTransition,
                      duration: AppConstants.transitionDuration);
                }),
            eachContents(
                des: "Help",
                onTap: () {
                  Get.to(() => const HelpPage(),
                      transition: AppConstants.pageTransition,
                      duration: AppConstants.transitionDuration);
                }),
          ],
        ),
      ),
    );
  }

  Widget eachContents({required String des, required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Text(
                des,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Icon(Icons.chevron_right)
            ],
          ),
        ),
      ),
    );
  }
}
