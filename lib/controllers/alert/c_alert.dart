import 'package:expense_tracker_mobile/controllers/alert/m_alert_model.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.alert.services.dart';
import 'package:get/get.dart';

enum EnumAlertType { warning, info, noti }

class AlertController extends GetxController {
  final AlertApiService apiService = Get.put(AlertApiService());
  final RxList<AlertModel> goals = <AlertModel>[].obs;

  // Future<void> getAlerts() async {
  //   goals.value = await apiService.getAllGoals(
  //       type: selectedType.value.name.toUpperCase());
  // }

  // @override
  // void onInit() {
  //   getAlerts();
  //   super.onInit();
  // }
}
