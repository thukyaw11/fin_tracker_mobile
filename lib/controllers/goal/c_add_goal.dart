import 'package:expense_tracker_mobile/controllers/goal/c_goal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/services/tracker/api.goal.services.dart';

class AddGoalController extends GetxController {
  TextEditingController titleTEC = TextEditingController();
  TextEditingController goalAmountTEC = TextEditingController();
  TextEditingController savedAmountTEC = TextEditingController();
  TextEditingController deadlineTEC = TextEditingController();
  final GoalApiService apiService = Get.put(GoalApiService());

  RxBool xBusy = false.obs;

  Future<void> addNewGoal() async {
    checkConditions(onSuccess: () async {
      DateTime dateTime = DateFormat("MMM dd, yyyy").parse(deadlineTEC.text);
      var body = {
        "amount": int.tryParse(goalAmountTEC.text) ?? 0,
        "title": titleTEC.text,
        "savedAmount": int.tryParse(savedAmountTEC.text) ?? 0,
        "dueDate": "${dateTime.toIso8601String()}Z"
      };
      xBusy.value = true;
      await apiService.addNewGoal(body: body);
      final GoalController goalController = Get.find();
      await goalController.getGoals();
      clearTECs();
      xBusy.value = false;
      Get.back();
    }, onFailure: () {
      Get.dialog(const AlertDialog(
        title: Text("Saved amount cannot be greater than Goal amount"),
      ));
    }, onRequired: () {
      Get.dialog(const AlertDialog(
        title: Text("All fields are required!"),
      ));
    });
  }

  void clearTECs() {
    titleTEC.clear();
    goalAmountTEC.clear();
    savedAmountTEC.clear();
    deadlineTEC.clear();
  }

  void checkConditions(
      {required Function onSuccess,
      required Function onFailure,
      required Function onRequired}) {
    if (titleTEC.text.isNotEmpty &&
        savedAmountTEC.text.isNotEmpty &&
        goalAmountTEC.text.isNotEmpty &&
        deadlineTEC.text.isNotEmpty) {
      int goal = int.tryParse(goalAmountTEC.text) ?? 0;
      int saved = int.tryParse(savedAmountTEC.text) ?? 0;
      if (saved > goal) {
        onFailure();
      } else {
        onSuccess();
      }
    } else {
      onRequired();
    }
  }
}
