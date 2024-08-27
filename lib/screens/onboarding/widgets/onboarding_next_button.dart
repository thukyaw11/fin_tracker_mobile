import 'package:expense_tracker_mobile/controllers/on_bording/on_boarding_controller.dart';
import 'package:expense_tracker_mobile/utils/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24.0,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: CircleBorder()),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
