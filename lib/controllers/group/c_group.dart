import 'package:expense_tracker_mobile/models/m_group.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.group.services.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  final GroupApiService apiService = Get.put(GroupApiService());

  var groups = <Group>[].obs;
  var selectedGroupName = 'Personal'.obs;
  var selectedGroupId = ''.obs;
  var isLoading = true.obs;

  Future<void> getAllGroups() async {
    try {
      isLoading.value = true;
      final fetchedGroups = await apiService.getAllGroups();
      groups.assignAll(fetchedGroups);
      if (groups.isNotEmpty) {
        selectedGroupName.value = groups[0].name;
        selectedGroupId.value = groups[0].id;
        print(selectedGroupId.value);
        print('heeh');
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
