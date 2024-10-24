import 'package:expense_tracker_mobile/controllers/tracker/http_api_service.dart';
import 'package:expense_tracker_mobile/utils/helpers/logger.dart';
import 'package:expense_tracker_mobile/utils/services/api_services.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileModel? profile;
  TextEditingController nameTEC = TextEditingController();
  RxBool xBusy = false.obs;

  final ApiService aa = Get.put(ApiService());

  Future<void> editName() async {
    if (nameTEC.text.isNotEmpty) {
      xBusy.value = true;
      Response? response = await HttpApiService().apiPatchCall(
          urlString: "https://finance.buclib.club/api/v1/auth",
          body: {"name": nameTEC.text});
      xBusy.value = false;
      if (response?.statusCode == 200) {
        updateMe();
        if (Get.isBottomSheetOpen!) {
          Get.back();
        }
      }
    }
  }

  Future<void> updateMe() async {
    final token = await SharedPreferenceService.getAccessToken();
    Logger.superPrint(token);
    await aa.validateAuth(token: token ?? "");
    update();
  }
}

class ProfileModel {
  final String name;
  final String email;
  final String profileUrl;

  ProfileModel(
      {required this.name, required this.email, required this.profileUrl});

  factory ProfileModel.fromJson({required Map<String, dynamic> json}) {
    return ProfileModel(
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        profileUrl: json["profileUrl"] ?? "");
  }
}
