import 'package:expense_tracker_mobile/controllers/goal/m_goal_model.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.goal.services.dart';
import 'package:get/get.dart';

enum EnumGoalType { ongoing, achieved, expired }

class GoalController extends GetxController {
  final GoalApiService apiService = Get.put(GoalApiService());
  final RxList<GoalModel> goals = <GoalModel>[].obs;
  Rx<EnumGoalType> selectedType = EnumGoalType.ongoing.obs;

  Future<void> getGoals() async {
    goals.value = await apiService.getAllGoals(
        type: selectedType.value.name.toUpperCase());
  }

  @override
  void onInit() {
    getGoals();
    super.onInit();
  }
}
