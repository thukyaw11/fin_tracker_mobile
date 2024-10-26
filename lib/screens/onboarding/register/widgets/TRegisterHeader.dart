import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:expense_tracker_mobile/utils/constants/image_strings.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TRegisterHeader extends StatelessWidget {
  const TRegisterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          height: 100,
          image: AssetImage(TImages.logo),
        ),
        Text(
          TTexts.registerTitle,
          style: TextStyle(color: AppColors.primaryColor, fontSize: 40),
        )
      ],
    );
  }
}
