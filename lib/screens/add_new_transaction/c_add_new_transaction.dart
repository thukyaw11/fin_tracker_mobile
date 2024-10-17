import 'package:expense_tracker_mobile/screens/home/v_home.dart';
import 'package:expense_tracker_mobile/screens/main/v_main_page.dart';
import 'package:expense_tracker_mobile/screens/wallet/v_transaction_detail.dart';
import 'package:expense_tracker_mobile/utils/enums/transaction_type.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/network/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/m_selected_category.dart';
import '../../models/m_selected_group.dart';
import '../../models/m_selected_wallet.dart';

class AddNewTransactionController extends GetxController {
  var selectedCategory = SelectedCategory(name: '', id: '').obs;
  var selectedWallet = SelectedWallet(name: '', id: '').obs;
  var selectedGroup = SelectedGroup(name: '', id: '').obs;
  var selectedType = TransactionType.INCOME.obs;

  final CommonApiService apiService = Get.find<CommonApiService>();

  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  Future<void> addTransaction() async {
    String amount = amountController.text.trim();
    String description = descriptionController.text.trim();
    String title = titleController.text.trim();

    if (amount.isEmpty) {
      Get.snackbar("Error", "Please enter a valid amount");
      return;
    }

    if (selectedCategory.value.name.isEmpty) {
      Get.snackbar("Error", "Please select a category");
      return;
    }

    if (selectedWallet.value.name.isEmpty) {
      Get.snackbar("Error", "Please select a wallet");
      return;
    }

    if (selectedGroup.value.name.isEmpty) {
      Get.snackbar("Error", "Please select a group");
      return;
    }
    var payload = {
      "cashCategoryId": selectedCategory.value.id,
      "walletId": selectedWallet.value.id,
      "groupId": selectedGroup.value.id,
      "transactionType":
          selectedType == TransactionType.INCOME ? 'INCOME' : 'EXPENSE',
      "title": title,
      "description": description,
      "amount": int.parse(amount),
    };

    try {
      final response = await apiService.postRequest('/transaction', payload);

      if (response?.statusCode == 201) {
        Get.snackbar("Success", "Transaction added successfully!");
        amountController.clear();
        descriptionController.clear();
        titleController.clear();
        selectedCategory(SelectedCategory(name: '', id: ''));
        selectedWallet(SelectedWallet(name: '', id: ''));
        selectedGroup(SelectedGroup(name: '', id: ''));

        Get.to(HomeScreen());
      } else {
        Get.snackbar("Error", "Failed to add transaction");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }

  @override
  void onClose() {
    amountController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void selectCategory(String categoryName, String categoryId) {
    selectedCategory.update((category) {
      category?.name = categoryName;
      category?.id = categoryId;
    });
  }

  void selectWallet(String walletName, String walletId) {
    selectedWallet.update((wallet) {
      wallet?.name = walletName;
      wallet?.id = walletId;
    });
  }

  void selectGroup(String groupName, String groupId) {
    selectedGroup.update((group) {
      group?.name = groupName;
      group?.id = groupId;
    });
  }
}
