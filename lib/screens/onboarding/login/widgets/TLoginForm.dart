import 'package:expense_tracker_mobile/controllers/auth/login_controller.dart';
import 'package:expense_tracker_mobile/screens/onboarding/register/register.dart';
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
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            //Password
            Obx(() => TextFormField(
                  obscureText: controller.obscureText.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.obscureText.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                )),
            const SizedBox(
              height: TSizes.spaceBtwInputField / 2,
            ),

            //Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                //Forget Password
                TextButton(
                    onPressed: () {}, child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            // Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text(TTexts.signIn))),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     padding: const EdgeInsets.all(16),
            //     foregroundColor: Colors.deepPurple,
            //     backgroundColor: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            //   child: const Text(
            //     TTexts.signIn,
            //     style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            //   ),
            // ),

            const SizedBox(height: TSizes.spaceBtwItems),

            //Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      // Navigate to the Sign Up page
                      Get.to(() => RegisterScreen());
                    },
                    child: const Text(TTexts.createAccount))),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
