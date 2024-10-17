import 'dart:convert';

import 'package:expense_tracker_mobile/controllers/group/c_group.dart';
import 'package:expense_tracker_mobile/models/m_transaction_record.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/network/api_service.dart';
import 'package:expense_tracker_mobile/utils/services/transaction/api.transaction.services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TransactionApiService apiService = Get.put(TransactionApiService());
  final CommonApiService _commonApiService = Get.find();
  final GroupController _groupController = Get.find();

  var transactionRecords = <Transaction>[].obs;
  var isLoading = true.obs;
  var isIncomeExpenseLoading = true.obs;

  var totalIncome = 0.obs;
  var totalExpense = 0.obs;

  @override
  void onInit() {
    fetchTransactions();
    super.onInit();
  }

  Future<void> fetchTransactions() async {
    try {
      isLoading.value = true;
      final fetchedTransactions = await apiService.getAllTransactions();
      transactionRecords.assignAll(fetchedTransactions);
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchIncomeExpense() async {
    try {
      final fetchedIncomeExpense = await _commonApiService.getRequest(
          '/transaction', {'groupId': _groupController.selectedGroupId.value});

      if (fetchedIncomeExpense != null) {
        final Map<String, dynamic> data = jsonDecode(fetchedIncomeExpense.body);

        totalIncome.value = data['_data']['income'] ?? 0;
        totalExpense.value = (data['_data']['expense'] as num).toInt();
      } else {
        Logger.superPrint("Fetched income and expense is null.");
      }
    } catch (e) {
      rethrow;
    } finally {
      isIncomeExpenseLoading.value = false;
    }
  }
}
