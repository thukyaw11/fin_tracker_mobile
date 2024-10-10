import 'package:expense_tracker_mobile/models/m_selected_category.dart';
import 'package:get/get.dart';

class AddNewTransactionController extends GetxController {
  var selectedCategory = SelectedCategory(name: '', id: '').obs;

  void selectCategory(String newName, String newId) {
    selectedCategory.update((category) {
      category?.name = newName;
      category?.id = newId;
    });
  }

  var selectedWallet = ''.obs;
  var selectedGroup = ''.obs;
}
