import 'package:expense_tracker_mobile/controllers/auth/register_controller.dart';
import 'package:expense_tracker_mobile/screens/onboarding/login/login.dart';
import 'package:expense_tracker_mobile/screens/onboarding/register/register.dart';
import 'package:expense_tracker_mobile/utils/constants/sizes.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
            TextFormField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user), labelText: TTexts.name),
            ),
            //Email
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputField,
            ),

            //Password
            Obx(() => TextFormField(
                  controller: controller.passwordController,
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

            //Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: controller.register,
                    child: const Text(TTexts.createAccount))),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Create Account Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      // Navigate to the Sign Up page
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
