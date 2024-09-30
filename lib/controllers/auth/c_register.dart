import 'package:expense_tracker_mobile/screens/onboarding/login/v_login.dart';
import 'package:expense_tracker_mobile/utils/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final ApiService apiService = Get.find<ApiService>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    await apiService.registerUser(
      name: name,
      email: email,
      password: password,
    );

    Get.to(() => LoginScreen());
  }
}
