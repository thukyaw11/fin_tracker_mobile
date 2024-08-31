import 'package:expense_tracker_mobile/utils/constants/image_strings.dart';
import 'package:expense_tracker_mobile/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class TRegisterHeader extends StatelessWidget {
  const TRegisterHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 100,
          image: AssetImage(TImages.logo),
        ),
        Text(TTexts.registerTitle,
            style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
