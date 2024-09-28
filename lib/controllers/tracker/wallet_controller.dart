import 'package:expense_tracker_mobile/utils/services/tracker/api.tracker.services.dart';
import 'package:get/get.dart';

class TrackerController extends GetxController {
  // Instance of the API service
  final TrackerApiService apiService = Get.put(TrackerApiService());

  var wallets = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchWallets();
    super.onInit();
  }

  Future<void> fetchWallets() async {
    try {
      Iterable<Map<String, dynamic>> walletList =
          await apiService.getAllWallets();
      wallets.assignAll(walletList);
    } catch (e) {
      print('Failed to fetch wallets: $e');
    }
  }
}
