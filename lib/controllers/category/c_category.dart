import 'package:expense_tracker_mobile/models/m_category.dart';
import 'package:expense_tracker_mobile/models/m_group.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.category.services.dart';
import 'package:expense_tracker_mobile/utils/services/tracker/api.group.services.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final CategoryApiService apiService = Get.put(CategoryApiService());

  final RxList<Category> categories = RxList<Category>();
  var selectedCategoryName = 'Shopping'.obs;
  var selectedCategoryId = ''.obs;
  var isLoading = true.obs;

  Future<void> getAllCategory() async {
    try {
      isLoading.value = true;
      final fetchedCategory = await apiService.getAllCategory();
      categories.assignAll(fetchedCategory);
      // if (groups.isNotEmpty) {
      //   selectedGroupName.value = groups[0].name;
      //   selectedGroupId.value = groups[0].id;
      // }
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
