import 'package:expense_tracker_mobile/controllers/tracker/toggle_switch_controller.dart';
import 'package:expense_tracker_mobile/controllers/tracker/wallet_controller.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/earning_text.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/toggle_switch.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/wallet_card.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.tracker.services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackerScreen extends StatelessWidget {
  TrackerScreen({super.key}) {
    Get.lazyPut(() => TrackerApiService());
  }

  final ToggleSwitchController controller = Get.put(ToggleSwitchController());

  final TrackerController _trackerController = Get.put(TrackerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildDropdownButton('Personal'),
              ],
            ),
            const SizedBox(height: 20),
            const ToggleSwitch(),
            const SizedBox(height: 30),
            Center(
              child: Obx(() {
                final isIncomeSelected = controller.isIncomeSelected.value;
                final textColor = isIncomeSelected
                    ? Colors.green
                    : Colors.red; // Dynamic color
                return EarningText(
                    typeText:
                        isIncomeSelected ? "You Earned 💰" : "You Spent 💸",
                    fontColor: textColor,
                    amount: 3000);
              }),
            ),
            const SizedBox(height: 40),
            const Text(
              "Wallet",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            // Expanded for scrollable wallet section
            Expanded(
              child: Obx(() {
                // Check if the wallet list is empty and show a loading indicator if true
                if (_trackerController.wallets.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Use ListView.builder to create a dynamic list of wallets
                return ListView.builder(
                  padding: const EdgeInsets.only(left: 0),
                  itemCount: _trackerController
                      .wallets.length, // Dynamic length from the controller
                  itemBuilder: (context, index) {
                    final wallet = _trackerController
                        .wallets[index]; // Access wallet item at index

                    return BuildWalletCard(
                      imageUrl:
                          "https://cloud.farytaxi.com/uploads/parenthand/7fd3f3a0-7c14-477a-9d8a-13594044539d.jpg", // Fetch image URL from the wallet data
                      payName: wallet['name'], // Fetch wallet name
                      amount: wallet['amount'], // Fetch wallet amount
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
