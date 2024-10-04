import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:expense_tracker_mobile/utils/helpers/x_date_foramtter.dart';
import 'package:expense_tracker_mobile/utils/helpers/x_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TransactionDetailsPage extends StatelessWidget {
  Color color;
  TransactionDetailsPage({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          // backgroundColor: outcomeColor,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: color,
            title: const Text(
              'Transaction Details',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showDeleteSheet();
                },
                icon: const Icon(
                  Iconsax.trash,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                //Leading Card
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: [
                          const Gap(10),
                          const Text(
                            "53000" + ' Ks',
                            style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 235, 234, 234),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const Gap(10),
                          const Text(
                            'Salary for July',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 235, 234, 234),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            xFullDateTimeFormat(DateTime.now()),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 235, 234, 234),
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 230,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 90,
                          child: const Card(
                            elevation: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Type',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0XFF91919F),
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        "Expense",
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0XFF0D0E0F),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Category',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0XFF91919F),
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        'Shopping',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0XFF0D0E0F),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Wallet',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Color(0XFF91919F),
                                        ),
                                      ),
                                      Gap(10),
                                      Text(
                                        'Cash',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0XFF0D0E0F),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                // SvgPicture.string(AppSvgs.svgDottedLine),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF91919F),
                              fontSize: 16),
                        ),
                      ),
                      const Gap(10),
                      Text(
                        "blahhh balha sdfs" * 20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0XFF0D0E0F),
                        ),
                      ),
                      const Gap(10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Attachment',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF91919F),
                              fontSize: 16),
                        ),
                      ),
                      const Gap(10),
                      SizedBox(
                        width: double.infinity,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://www.lpstationery.com/image/lianpang/image/data/all_product_images/product-343/salary%20voucher2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Gap(23),
                      GestureDetector(
                        onTap: () {
                          // Get.to(() => const VerificationPage());
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 0),
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Edit",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );

  }

  void showDeleteSheet() {
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
              const Text(
                "Remove this transaction?",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Are you sure do you wanna remove this transaction?",
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
                      style: TextStyle(color: AppColors.primaryColor, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      xSuccessDialog('Transaction has been successfully removed', true);
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