import 'package:expense_tracker_mobile/screens/onboarding/onboarding.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light background color
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0, // Remove app bar shadow
        centerTitle: true,
        foregroundColor: Colors.black, // For the title color
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Profile Picture
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.purple[200],
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage(
                        'assets/images/profile/profile.png'), // Replace with your image
                  ),
                ),
                const SizedBox(width: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Soe Yu Lwin",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                              12), // Added const for better optimization
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.settings, color: Colors.blue),
                        ),
                        const SizedBox(
                            width: 10), // Spacing between icon and text
                        const Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 18), // Made const for performance
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text("Are you sure to log out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back(); // Close the dialog
                            },
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () async {
                              // Handle confirm action
                              await SharedPreferenceService.removeAccessToken();
                              Get.to(
                                  const OnBoardingScreen()); // Close the dialog
                            },
                            child: const Text("I'm sure"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                              12), // Added const for better optimization
                          decoration: BoxDecoration(
                            color: Colors.purple.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.logout, color: Colors.red),
                        ),
                        const SizedBox(
                            width: 10), // Spacing between icon and text
                        const Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 18), // Made const for performance
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
