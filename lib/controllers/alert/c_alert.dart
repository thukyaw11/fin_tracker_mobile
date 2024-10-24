import 'package:expense_tracker_mobile/controllers/alert/m_alert_model.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.alert.services.dart';
import 'package:get/get.dart';

enum EnumAlertType { warning, info, noti }

class AlertController extends GetxController {
  final AlertApiService apiService = Get.put(AlertApiService());
  final RxList<AlertModel> alerts = <AlertModel>[].obs;

  Future<void> getAlerts() async {
    alerts.value = await apiService.getAllAlerts();
  }

  @override
  void onInit() {
    getAlerts();
    super.onInit();
  }
}
