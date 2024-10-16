import 'package:expense_tracker_mobile/models/m_wallet.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.tracker.services.dart';
import 'package:get/get.dart';

class TrackerController extends GetxController {
  final TrackerApiService apiService = Get.put(TrackerApiService());

  final RxList<Wallet> wallets = RxList<Wallet>();
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
      wallets.assignAll(await apiService.getAllWallets());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchTrackerMoney() async {
    try {
      final incomeExpense = await apiService.getIncomeExpense(
          'INCOME', 'cafad70c-e285-44f0-bcd9-48effca3203b');

      totalIncome.value = incomeExpense.income.toInt();
      totalExpense.value = incomeExpense.expense.toInt();
    } catch (e) {
      rethrow;
    }
  }
}
