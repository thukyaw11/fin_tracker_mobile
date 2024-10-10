import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class XTextArea extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const XTextArea({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: labelText,
                style: const TextStyle(color: Colors.black),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red), // Style for the '*'
              ),
            ],
          ),
        ),
        const Gap(10),
        TextFormField(
          cursorColor: AppColors.primaryColor,
          controller: controller,
          maxLines: 4,
          minLines: 4,
          decoration: InputDecoration(
            focusColor: AppColors.primaryColor,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            labelText: 'Enter $labelText',
          ),
        ),
      ],
    );
  }
}
