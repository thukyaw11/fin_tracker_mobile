import 'package:expense_tracker_mobile/utils/services/tracker/api.tracker.services.dart';
import 'package:get/get.dart';

class TrackerController extends GetxController {
  final TrackerApiService apiService = Get.put(TrackerApiService());

  var wallets = <Map<String, dynamic>>[].obs;
  var totalIncome = 0.obs;
  var totalExpense = 0.obs;

  @override
  void onInit() {
    fetchWallets();
    fetchTrackerMoney();
    super.onInit();
  }

  Future<void> fetchWallets() async {
    try {
      Iterable<Map<String, dynamic>> walletList =
          await apiService.getAllWallets();
      wallets.assignAll(walletList);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchTrackerMoney() async {
    try {
      final incomeExpense = await apiService.getIncomeExpense(
          'INCOME', '2161e29b-f18f-438a-bfdb-62e6c2b482cd');

      totalIncome.value = incomeExpense.income.toInt();
      totalExpense.value = incomeExpense.expense.toInt();
    } catch (e) {
      rethrow;
    }
  }
}
