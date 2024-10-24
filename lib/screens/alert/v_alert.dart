import 'package:expense_tracker_mobile/controllers/alert/c_alert.dart';
import 'package:expense_tracker_mobile/screens/onboarding/v_onboarding.dart';
import 'package:expense_tracker_mobile/screens/profile/w_app_bar_widget.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/app_colors.dart';

class AlertScreen extends StatelessWidget {
  AlertScreen({super.key});

  final AlertController controller = Get.put(AlertController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBarWidget(title: "Alerts"), body: alerts());
  }

  Widget alerts() {
    return Obx(() {
      return controller.alerts.isEmpty
          ? const Center(child: Text("No Alerts Yet!"))
          : RefreshIndicator(
              onRefresh: () async {
                await controller.getAlerts();
              },
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(Icons.info_rounded,
                                  color: Colors.blue),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.alerts[index].title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        DateFormat('E d, HH:mm').format(
                                            DateTime.tryParse(controller
                                                    .alerts[index].createdAt) ??
                                                DateTime.now()),
                                        style: TextStyle(
                                            fontSize: 10,
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    controller.alerts[index].content,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.alerts.length));
    });
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
