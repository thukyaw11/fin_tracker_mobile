import 'package:expense_tracker_mobile/common/svg/app_svg.dart';
import 'package:expense_tracker_mobile/controllers/c_transaction_detail_controller.dart';
import 'package:expense_tracker_mobile/controllers/m_transaction_detail_model.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:expense_tracker_mobile/utils/helpers/x_date_foramtter.dart';
import 'package:expense_tracker_mobile/utils/helpers/x_success_dialog.dart';
import 'package:expense_tracker_mobile/utils/services/format_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../controllers/transaction/c_transaction.dart';

// ignore: must_be_immutable
class TransactionDetailsPage extends StatefulWidget {
  Color color;
  TransactionDetailsPage({super.key, required this.color, required this.id});
  final String id;

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  final TransactionDetailController detailController =
      Get.put(TransactionDetailController());

  @override
  void initState() {
    detailController.getTransactionDetail(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        // backgroundColor: outcomeColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: detailController.xBusy.value
              ? Colors.white
              : detailController.detailModel?.type.toString().toLowerCase() ==
                      "income"
                  ? Colors.green
                  : Colors.red,
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
        body: Obx(() {
          TransactionDetailModel? selectedDetail = detailController.detailModel;
          return detailController.xBusy.value || selectedDetail == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      //Leading Card
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              color: selectedDetail!.type
                                          .toString()
                                          .toLowerCase() ==
                                      "income"
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              ),
                            ),
                            margin: const EdgeInsets.only(bottom: 40),
                            child: Column(
                              children: [
                                const Gap(10),
                                Text(
                                  "${FormatService.numberFormat.format(selectedDetail!.amount)} Ks",
                                  style: const TextStyle(
                                    fontSize: 35,
                                    color: Color.fromARGB(255, 235, 234, 234),
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  selectedDetail.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
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
                                child: Card(
                                  elevation: 5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Type',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0XFF91919F),
                                              ),
                                            ),
                                            const Gap(10),
                                            Text(
                                              selectedDetail
                                                      .type.capitalizeFirst ??
                                                  selectedDetail.type
                                                      .toLowerCase(),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Category',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0XFF91919F),
                                              ),
                                            ),
                                            const Gap(10),
                                            Text(
                                              selectedDetail.cashCategory
                                                      .capitalizeFirst ??
                                                  selectedDetail.cashCategory
                                                      .toLowerCase(),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Wallet',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0XFF91919F),
                                              ),
                                            ),
                                            const Gap(10),
                                            Text(
                                              selectedDetail.walletTitle
                                                      .capitalizeFirst ??
                                                  selectedDetail.walletTitle
                                                      .toLowerCase(),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
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
                      SvgPicture.string(AppSvgs.svgDottedLine),
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
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    selectedDetail.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Color(0XFF0D0E0F),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            if (selectedDetail.transactionImageUrl.isNotEmpty)
                              Column(
                                children: [
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
                                        selectedDetail.transactionImageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            const Gap(23),
                            // GestureDetector(
                            //   onTap: () {
                            //     // Get.to(() => const VerificationPage());
                            //   },
                            //   child: Container(
                            //     width: double.infinity,
                            //     decoration: BoxDecoration(
                            //       color: AppColors.primaryColor,
                            //       borderRadius: BorderRadius.circular(15),
                            //     ),
                            //     padding: const EdgeInsets.symmetric(
                            //         vertical: 13, horizontal: 0),
                            //     child: const Text(
                            //       textAlign: TextAlign.center,
                            //       "Edit",
                            //       style: TextStyle(
                            //         fontSize: 18,
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w400,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
        }),
      );
    });
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
              Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const Gap(20),
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
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await detailController.deleteSelectedDetails(
                          id: detailController.detailModel?.id ?? "");
                      final TransactionController transactionController =
                          Get.find();
                      await Future.wait([
                        transactionController.fetchIncomeExpense(),
                        transactionController.fetchTransactions(),
                      ]);
                      if (Get.isBottomSheetOpen!) {
                        Get.back();
                      }
                      xSuccessDialog(
                          'Transaction has been successfully removed', true);
                      await Future.delayed(const Duration(milliseconds: 1000));
                      Get.back(closeOverlays: true);
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
