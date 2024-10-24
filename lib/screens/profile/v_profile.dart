import 'package:expense_tracker_mobile/controllers/alert/c_alert.dart';
import 'package:expense_tracker_mobile/controllers/profile/c_profile.dart';
import 'package:expense_tracker_mobile/screens/alert/v_alert.dart';
import 'package:expense_tracker_mobile/screens/onboarding/v_onboarding.dart';
import 'package:expense_tracker_mobile/screens/profile/v_setting.dart';
import 'package:expense_tracker_mobile/utils/constants/app_constants.dart';
import 'package:expense_tracker_mobile/utils/helpers/extensions.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../utils/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    controller.fetchxNewAlert();
    profileController.updateMe();
    super.initState();
  }

  final AlertController controller = Get.put(AlertController());
  final ProfileController profileController = Get.put(ProfileController());

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
      body: GetBuilder<ProfileController>(builder: (profileController) {
        Logger.superPrint("updated");
        return Column(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Username",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            profileController.profile?.name ?? "",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.bottomSheet(NameBottomsheet());
                        },
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
                    onTap: () {
                      Get.to(() => const SettingsPage(),
                          transition: AppConstants.pageTransition,
                          duration: AppConstants.transitionDuration);
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
                            child:
                                const Icon(Icons.settings, color: Colors.blue),
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
                      Get.to(() => AlertScreen(),
                          transition: AppConstants.pageTransition,
                          duration: AppConstants.transitionDuration);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(
                                    12), // Added const for better optimization
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.info_outline_rounded,
                                    color: Colors.blue),
                              ),
                              const SizedBox(
                                  width: 10), // Spacing between icon and text
                              const Text(
                                "Alerts",
                                style: TextStyle(
                                    fontSize: 18), // Made const for performance
                              ),
                            ],
                          ),
                          Obx(() => Visibility(
                              visible: controller.showIcon.value,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue),
                              )))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      showLogoutConfirmSheet();
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
        );
      }),
    );
  }

  void showLogoutConfirmSheet() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: 18,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const Gap(20),
              const Text(
                "Are you sure to logout?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Are you sure that you would like to log out of this account?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0XFF91919F),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.accentColor,
                      minimumSize: const Size(160, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "No",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await SharedPreferenceService.removeAccessToken();
                      Get.offAll(() => const OnBoardingScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(160, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      enableDrag: true,
      isScrollControlled: true,
    );
  }
}

class NameBottomsheet extends StatefulWidget {
  NameBottomsheet({super.key});

  @override
  State<NameBottomsheet> createState() => _NameBottomsheetState();
}

class _NameBottomsheetState extends State<NameBottomsheet> {
  final ProfileController profileController = Get.find();

  @override
  void initState() {
    profileController.nameTEC.text = profileController.profile?.name ?? "";
    super.initState();
  }

  @override
  void dispose() {
    profileController.nameTEC.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: profileController.nameTEC,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              decoration: InputDecoration(
                  hintText: "Enter..", border: InputBorder.none),
            ),
          ),
          30.heightBox(),
          actionButton(),
          30.heightBox()
        ],
      ),
    );
  }

  Widget actionButton() {
    return Center(
      child: Obx(() {
        return InkWell(
          onTap: profileController.xBusy.value
              ? null
              : () {
                  profileController.editName();
                },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 55,
            width: profileController.xBusy.value ? 55 : Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  profileController.xBusy.value ? 1000 : 12),
              color: AppColors.primaryColor,
            ),
            child: Center(
              child: profileController.xBusy.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Edit Name',
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        );
      }),
    );
  }
}
