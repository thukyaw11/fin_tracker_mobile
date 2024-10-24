import 'package:expense_tracker_mobile/controllers/auth/c_register.dart';
import 'package:expense_tracker_mobile/screens/onboarding/login/v_login.dart';
import 'package:expense_tracker_mobile/utils/constants/sizes.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../utils/constants/app_colors.dart';

class TRegisterForm extends StatelessWidget {
  TRegisterForm({
    super.key,
  });

  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            registerTextField(
                hint: 'Name',
                controller: controller.nameController,
                icon: Icons.person),

            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),
            registerTextField(
                hint: 'Email',
                controller: controller.emailController,
                icon: Iconsax.direct_right),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),
            //Password

            Obx(() {
              return registerTextField(
                  hint: "Password",
                  controller: controller.passwordController,
                  icon: Iconsax.password_check,
                  hideText: controller.obscureText.value,
                  withHideButton: true);
            }),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            //Register Button
            registerButton(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }

  Widget registerTextField(
      {required String hint,
      required TextEditingController controller,
      required IconData icon,
      bool hideText = false,
      bool withHideButton = false}) {
    return TextFormField(
      obscureText: hideText,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(
          icon,
          color: AppColors.primaryColor,
        ),
        suffixIcon: withHideButton
            ? IconButton(
                onPressed: () {
                  final RegisterController registerController =
                      Get.put(RegisterController());
                  registerController.obscureText.value =
                      !registerController.obscureText.value;
                },
                icon: Icon(
                  hideText ? Iconsax.eye_slash : Iconsax.eye,
                  color: AppColors.primaryColor,
                ))
            : null,
        labelText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: AppColors.accentColor, width: 1.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      ),
    );
  }

  Widget registerButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: controller.register,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(16),
          foregroundColor: AppColors.primaryColor,
          backgroundColor: AppColors.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Register',
          style: TextStyle(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
