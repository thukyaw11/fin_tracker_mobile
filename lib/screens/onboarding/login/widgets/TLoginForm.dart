import 'package:expense_tracker_mobile/controllers/auth/c_login.dart';
import 'package:expense_tracker_mobile/screens/onboarding/register/v_register.dart';
import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:expense_tracker_mobile/utils/constants/sizes.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TLoginForm extends StatelessWidget {
  TLoginForm({
    super.key,
  });

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            TextFormField(
              controller: controller.emailController,
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: const Icon(
                  Iconsax.direct_right,
                  color: AppColors.primaryColor,
                ),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: AppColors.primaryColor, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: AppColors.accentColor, width: 1.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            //Password
            Obx(() => TextFormField(
                  cursorColor: AppColors.primaryColor,
                  controller: controller.passwordController,
                  obscureText: controller.obscureText.value,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    prefixIcon: const Icon(
                      Iconsax.password_check,
                      color: AppColors.primaryColor,
                    ),
                    labelText:
                        'Password', // Replace TTexts.password with your text
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: AppColors.primaryColor,
                        controller.obscureText.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                          color: AppColors.accentColor, width: 1.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                  ),
                )),
            const SizedBox(
              height: TSizes.spaceBtwInputField / 2,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      checkColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                //Forget Password
                TextButton(
                    onPressed: () => {},
                    child: const Text(
                      TTexts.forgetPassword,
                      style: TextStyle(color: AppColors.primaryColor),
                    )),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.login,
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
                  'Login',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            //Create Account Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
