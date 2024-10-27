import 'package:expense_tracker_mobile/screens/add_new_transaction/c_add_new_transaction.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/category_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/group_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/image_picker.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/transaction_type_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/wallet_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/x_text_area.dart';
import 'package:expense_tracker_mobile/screens/add_new_transaction/widgets/x_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../utils/constants/app_colors.dart';

class AddNewTransaction extends StatelessWidget {
  AddNewTransaction({super.key});

  final AddNewTransactionController addNewTransactionController =
      Get.put(AddNewTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Add Transaction',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ), // AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XTextField(
                controller: addNewTransactionController.amountController,
                labelText: 'Your Amount',
                placeHolder: 'Enter your amount',
                keyboardType: TextInputType.number,
                digitsOnly: true,
              ),
              const Gap(20),
              XTextField(
                controller: addNewTransactionController.titleController,
                labelText: 'Title',
                placeHolder: 'Enter your title',
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  TransactionTypeBottomSheet().show();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Text(
                          addNewTransactionController.selectedType.value.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: addNewTransactionController
                                    .selectedType.value.name.isEmpty
                                ? Colors.grey
                                : Colors.black,
                          ),
                        );
                      }),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  CategoryBottomSheet().show();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Text(
                          addNewTransactionController
                                  .selectedCategory.value.name.isEmpty
                              ? 'Select Category'
                              : addNewTransactionController
                                  .selectedCategory.value.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: addNewTransactionController
                                    .selectedCategory.value.name.isEmpty
                                ? Colors.grey
                                : Colors.black,
                          ),
                        );
                      }),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  WalletBottomSheet().show();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Text(
                          addNewTransactionController
                                  .selectedWallet.value.name.isEmpty
                              ? 'Select Wallet'
                              : addNewTransactionController
                                  .selectedWallet.value.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: addNewTransactionController
                                    .selectedWallet.value.name.isEmpty
                                ? Colors.grey
                                : Colors.black,
                          ),
                        );
                      }),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  GroupBottomSheet().show();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        return Text(
                          addNewTransactionController
                                  .selectedGroup.value.name.isEmpty
                              ? 'Select Group'
                              : addNewTransactionController
                                  .selectedGroup.value.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: addNewTransactionController
                                    .selectedGroup.value.name.isEmpty
                                ? Colors.grey
                                : Colors.black,
                          ),
                        );
                      }),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              XTextArea(
                controller: addNewTransactionController.descriptionController,
                labelText: 'Description',
              ),
              const Gap(20),
              ImagePickerWidget(),
              const Gap(20),
              Obx(() {
                final AddNewTransactionController controller = Get.find();
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.xBusy.value
                          ? null
                          : addNewTransactionController.addTransaction();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 60,
                      width: controller.xBusy.value ? 60 : Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(
                              controller.xBusy.value ? 10000 : 10)),
                      child: Center(
                        child: controller.xBusy.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Continue",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                );
              }),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
