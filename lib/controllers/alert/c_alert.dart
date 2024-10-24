import 'package:expense_tracker_mobile/controllers/alert/m_alert_model.dart';
import 'package:expense_tracker_mobile/controllers/tracker/http_api_service.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.alert.services.dart';
import 'package:get/get.dart';

enum EnumAlertType { warning, info, noti }

class AlertController extends GetxController {
  RxBool showIcon = false.obs;
  final AlertApiService apiService = Get.put(AlertApiService());
  final RxList<AlertModel> alerts = <AlertModel>[].obs;

  Future<void> getAlerts() async {
    alerts.value = await apiService.getAllAlerts();
    fetchxNewAlert();
  }

  Future<void> fetchxNewAlert() async {
    Response? response = await HttpApiService().apiGetCall(
        urlString: "https://finance.buclib.club/api/v1/alert/x-new-alert");
    showIcon.value = response?.body["_data"] ?? false;
  }

  @override
  void onInit() {
    getAlerts();
    super.onInit();
  }
}
