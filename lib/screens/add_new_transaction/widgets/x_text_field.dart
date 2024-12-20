import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class XTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String placeHolder;
  final String? suffixText;
  final TextInputType keyboardType;
  final bool digitsOnly;

  const XTextField({
    super.key,
    required this.controller,
    required this.placeHolder,
    this.keyboardType = TextInputType.text,
    this.digitsOnly = false,
    this.labelText,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
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
        TextField(
          keyboardType: keyboardType,
          inputFormatters: [
            if (digitsOnly) FilteringTextInputFormatter.digitsOnly
          ],
          cursorColor: AppColors.primaryColor,
          controller: controller,
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
            labelText: placeHolder,
            suffixText: suffixText,
          ),
        ),
      ],
    );
  }
}
