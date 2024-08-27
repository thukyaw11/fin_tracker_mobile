import 'package:expense_tracker_mobile/controllers/on_bording/on_boarding_controller.dart';
import 'package:expense_tracker_mobile/utils/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: 4.0,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect:
              ExpandingDotsEffect(activeDotColor: Colors.black, dotHeight: 6),
        ));
  }
}
