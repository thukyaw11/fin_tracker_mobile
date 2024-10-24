import 'package:expense_tracker_mobile/controllers/tracker/http_api_service.dart';
import 'package:expense_tracker_mobile/models/m_wallet.dart';
import 'package:expense_tracker_mobile/screens/home/m_wallet_transaction_model.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.tracker.services.dart';
import 'package:get/get.dart';

class TrackerController extends GetxController {
  final TrackerApiService apiService = Get.put(TrackerApiService());

  final RxList<Wallet> wallets = RxList<Wallet>();
  var totalIncome = 0.obs;
  var totalExpense = 0.obs;
  WalletTransactionModel? walletDetail;
  RxBool xBusy = false.obs;

  @override
  void onInit() {
    fetchWallets();
    fetchTrackerMoney();
    super.onInit();
  }

  Future<void> fetchWalletTransactions({required String id}) async {
    xBusy.value = true;
    Response? response = await HttpApiService()
        .apiGetCall(urlString: "https://finance.buclib.club/api/v1/wallet/$id");

    if (response?.statusCode == 200 || response?.statusCode == 201) {
      xBusy.value = false;
      walletDetail = WalletTransactionModel.fromJson(
          json: response?.body["_data"]["data"]);
    } else {
      xBusy.value = false;
    }
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
