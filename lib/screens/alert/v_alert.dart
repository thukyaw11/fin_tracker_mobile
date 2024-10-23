import 'package:expense_tracker_mobile/screens/onboarding/v_onboarding.dart';
import 'package:expense_tracker_mobile/screens/profile/v_setting.dart';
import 'package:expense_tracker_mobile/screens/profile/w_app_bar_widget.dart';
import 'package:expense_tracker_mobile/utils/constants/app_constants.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../utils/constants/app_colors.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarWidget(title: "Alerts"),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align content at the top
                    children: [
                      Container(
                        padding: const EdgeInsets.all(
                            12), // Added const for better optimization
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child:
                            const Icon(Icons.info_rounded, color: Colors.blue),
                      ),
                      SizedBox(
                          width:
                              10), // Add some space between the icon and the text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Usage Warning!",
                                  style: TextStyle(
                                      fontWeight:
                                          FontWeight.bold), // Optional styling
                                ),
                                Text(
                                  "Tue 22, 18:50",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black.withOpacity(
                                          0.5)), // Optional styling
                                ),
                              ],
                            ),
                            SizedBox(height: 5), // Add spacing between texts
                            Text(
                              "You have used most of your money in Shopping on September",
                              maxLines: 2, // Limit the number of lines
                              overflow: TextOverflow
                                  .ellipsis, // Handle overflow with ellipsis
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 50));
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
