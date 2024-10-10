import 'package:expense_tracker_mobile/controllers/group/c_group.dart';
import 'package:expense_tracker_mobile/models/m_transaction_record.dart';
import 'package:expense_tracker_mobile/utils/services/transaction/api.transaction.services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final TransactionApiService apiService = Get.put(TransactionApiService());
  final GroupController _groupController = Get.find();

  var transactionRecords = <Transaction>[].obs;
  var isLoading = true.obs;

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
}
