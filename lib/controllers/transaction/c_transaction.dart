import 'package:get/get.dart';

class TransactionController extends GetxController {
  // final TrackerApiService apiService = Get.put(TrackerApiService());

  var transactionRecords = <Translations>[].obs;

  @override
  void onInit() {
    fetchTransactions();
    super.onInit();
  }

  Future<void> fetchTransactions() async {
    try {
      print(" it works");
      // wallets.assignAll(walletList);
    } catch (e) {
      rethrow;
    }
  }
}
