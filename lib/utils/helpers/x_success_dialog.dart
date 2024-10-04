
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void xSuccessDialog(String message, bool type_) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: type_ ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
              child: type_
                  ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 36,
              )
                  : const Icon(
                Icons.clear_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: true,
  );
}