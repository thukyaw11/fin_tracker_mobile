import 'package:expense_tracker_mobile/common/styles/spacing_styles.dart';
import 'package:expense_tracker_mobile/screens/onboarding/login/widgets/TLoginForm.dart';
import 'package:expense_tracker_mobile/screens/onboarding/login/widgets/TLoginHeader.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo, title & Sub-title
              const TLoginHeader(),

              //Form
              const TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
