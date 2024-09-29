import 'package:get/get.dart';

class ToggleSwitchController extends GetxController {
  var isIncomeSelected = true.obs;

  void toggle(bool isIncome) {
    isIncomeSelected.value = isIncome;
  }
}
