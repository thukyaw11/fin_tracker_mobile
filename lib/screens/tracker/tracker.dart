import 'package:expense_tracker_mobile/controllers/tracker/toggle_switch_controller.dart';
import 'package:expense_tracker_mobile/screens/home/widgets/build_drop_down_button.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/earning_text.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/toggle_switch.dart';
import 'package:expense_tracker_mobile/screens/tracker/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackerScreen extends StatelessWidget {
  final ToggleSwitchController controller = Get.put(ToggleSwitchController());

  TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Tracker',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0, // Remove app bar shadow
        centerTitle: true,
        foregroundColor: Colors.black, // Title color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20), // Add some spacing
          Row(
            children: [
              const SizedBox(width: 20),
              buildDropdownButton('Personal'), // Using the dropdown button
            ],
          ),
          const SizedBox(height: 20),
          const ToggleSwitch(),
          const SizedBox(height: 30),
          Center(
            child: Obx(() {
              final isIncomeSelected = controller.isIncomeSelected.value;
              final textColor =
                  isIncomeSelected ? Colors.green : Colors.red; // Dynamic color
              return EarningText(
                  typeText: isIncomeSelected ? "You Earned 💰" : "You Spent 💸",
                  fontColor: textColor,
                  amount: 3000);
            }),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              "Wallet",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const BuildWalletCard(
            imageUrl:
                'https://www.kbzpay.com/wp-content/uploads/sites/9/2020/04/blue-L.png',
            payName: 'KBZ Pay',
            amount: '3,000 Ks',
          ),
          const BuildWalletCard(
            imageUrl:
                'https://1000logos.net/wp-content/uploads/2017/05/emblem-Paypal.jpg',
            payName: 'Pay Pal',
            amount: '2,500 Ks',
          ),
          const BuildWalletCard(
            imageUrl: 'https://cdn-icons-png.freepik.com/512/8993/8993556.png',
            payName: 'Cash',
            amount: '2,900 Ks',
          ),
        ],
      ),
    );
  }
}
