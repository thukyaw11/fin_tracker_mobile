import 'package:expense_tracker_mobile/common/styles/spacing_styles.dart';
import 'package:expense_tracker_mobile/screens/onboarding/register/widgets/TRegisterForm.dart';
import 'package:expense_tracker_mobile/screens/onboarding/register/widgets/TRegisterHeader.dart';
import 'package:expense_tracker_mobile/utils/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key}) {
    Get.lazyPut(() => ApiService());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [const TRegisterHeader(), TRegisterForm()],
          ),
        ),
      ),
    );
  }
}
