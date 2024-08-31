import 'package:expense_tracker_mobile/controllers/on_bording/on_boarding_controller.dart';
import 'package:expense_tracker_mobile/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:expense_tracker_mobile/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:expense_tracker_mobile/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:expense_tracker_mobile/utils/constants/image_strings.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:expense_tracker_mobile/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(
      children: [
        // Horizontal Scrollable Pages
        PageView(
          controller: controller.pageController,
          onPageChanged: controller.updatePageIndicator,
          children: [
            OnBoardingPage(
              image: TImages.OnBoardingImage1,
              title: TTexts.onBoardingTitle1,
              subTitle: TTexts.onBoardingSubTitle1,
            ),
            OnBoardingPage(
              image: TImages.OnBoardingImage2,
              title: TTexts.onBoardingTitle2,
              subTitle: TTexts.onBoardingSubTitle2,
            ),
            OnBoardingPage(
              image: TImages.OnBoardingImage3,
              title: TTexts.onBoardingTitle3,
              subTitle: TTexts.onBoardingSubTitle3,
            ),
          ],
        ),
        // Skip Button
        const OnBoardingSkip(),

        // Dot Navigation SmoothPageIndicator
        const OnBoardingDotNavigation(),

        // Circular Button
        const OnBoardingNextButton(),
      ],
    ));
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth() * 0.8,
            height: THelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
