import 'package:expense_tracker_mobile/controllers/navigation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
          currentIndex: navController.currentIndex.value,
          onTap: (i) => navController.changeIndex(i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text("Likes"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
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
                  'Home',
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
                  buildDropdownButton('October'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildIncomeExpenseCard('Income', '480,000 Ks', Colors.green,
                      Icons.arrow_downward),
                  const SizedBox(width: 16),
                  buildIncomeExpenseCard(
                      'Expenses', '50,000 Ks', Colors.red, Icons.arrow_upward),
                ],
              ),
              const SizedBox(height: 20),
              buildDateTabs(),
              const SizedBox(height: 20),
              const Text(
                'Recent Transaction',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildTransactionItem('Shopping', '- 40,000 Ks', 'Buy Present',
                  Icons.shopping_bag, Colors.orange, '1:00 PM'),
              buildTransactionItem(
                  'Subscription',
                  '+ 40,000 Ks',
                  'Disney+ Annual..',
                  Icons.subscriptions,
                  Colors.purple,
                  '03:30 PM'),
              buildTransactionItem('Food', '- 10,000 Ks', 'Buy a ramen',
                  Icons.restaurant, Colors.red, '07:30 PM'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  Widget buildIncomeExpenseCard(
      String title, String amount, Color color, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildDateTab('Today', true),
        buildDateTab('Week', false),
        buildDateTab('Month', false),
        buildDateTab('Year', false),
      ],
    );
  }

  Widget buildDateTab(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFCEED4) : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFFFCAC12) : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildTransactionItem(String title, String amount, String subtitle,
      IconData icon, Color iconColor, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: amount.contains('-') ? Colors.red : Colors.green,
                ),
              ),
              Text(
                time,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
