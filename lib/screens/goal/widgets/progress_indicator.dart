import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class XProgressIndicator extends StatelessWidget {
  final double percent = 80;

  const XProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final sliderWidth = constraints.maxWidth;
        final labelPosition = (percent / 100) * sliderWidth -
            20; // Calculate label position dynamically

        return Stack(
          children: [
            SliderTheme(
              data: SliderThemeData(
                trackHeight: 8,
                thumbShape: SliderComponentShape.noThumb, // Remove thumb shape
                overlayShape: SliderComponentShape.noOverlay, // Remove overlay
              ),
              child: Slider(
                value: percent,
                min: 0,
                max: 100,
                inactiveColor: Colors.grey.shade300,
                activeColor: AppColors.primaryColor,
                onChanged: null, // Disable interaction
              ),
            ),
            Positioned(
              left: labelPosition, // Adjust the position of the label
              top: 0, // Align it vertically
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${percent.round()}%',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
