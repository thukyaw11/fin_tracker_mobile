import 'package:expense_tracker_mobile/screens/main/home_page.dart';
import 'package:expense_tracker_mobile/utils/services/api_services.dart';
import 'package:expense_tracker_mobile/utils/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ApiService apiService = Get.find<ApiService>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    try {
      final token = await apiService.loginUser(
        email: email,
        password: password,
      );

      if (token != null) {
        await SharedPreferenceService.saveAccessToken(token);

        Get.off(() => const HomePage());
      } else {
        Get.snackbar(
          "Login Failed",
          "Invalid email or password",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (error) {
      Get.snackbar(
        "Login Error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
