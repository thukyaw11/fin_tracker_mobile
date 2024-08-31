import 'package:expense_tracker_mobile/utils/constants/image_strings.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 100,
          image: AssetImage(TImages.logo),
        ),
        Text(TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
