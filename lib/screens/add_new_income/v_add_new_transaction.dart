import 'package:expense_tracker_mobile/screens/add_new_income/c_add_new_transaction.dart';
import 'package:expense_tracker_mobile/screens/add_new_income/widgets/category_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_income/widgets/group_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_income/widgets/wallet_bottom_sheet.dart';
import 'package:expense_tracker_mobile/screens/add_new_income/widgets/x_text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AddNewTransaction extends StatelessWidget {
  AddNewTransaction({super.key});

  final AddNewTransactionController addNewTransactionController =
      Get.put(AddNewTransactionController());
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Add Income',
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
                controller: amountController,
                labelText: 'Your Amount',
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {
                  CategoryBottomSheet.show();
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
                                  .selectedCategory.value.isEmpty
                              ? 'Select Category'
                              : addNewTransactionController
                                  .selectedCategory.value,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: addNewTransactionController
                                    .selectedCategory.value.isEmpty
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
                                  .selectedWallet.value.isEmpty
                              ? 'Select Wallet'
                              : addNewTransactionController
                                  .selectedWallet.value,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: addNewTransactionController
                                    .selectedWallet.value.isEmpty
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
                  GroupBottomSheet.show();
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
                                  .selectedGroup.value.isEmpty
                              ? 'Select Group'
                              : addNewTransactionController.selectedGroup.value,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: addNewTransactionController
                                    .selectedGroup.value.isEmpty
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
