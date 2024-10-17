import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension CustomBox on double {
  Widget widthBox() {
    return SizedBox(
      width: this,
    );
  }

  Widget heightBox({Color? bgColor}) {
    if (bgColor == null) {
      return SizedBox(
        height: this,
      );
    } else {
      return Container(
        width: double.infinity,
        height: this,
        decoration: BoxDecoration(color: bgColor),
      );
    }
  }

  double screenWidth() {
    return Get.width * this;
  }
}

extension CustomBox2 on int {
  Widget widthBox() {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget heightBox() {
    return SizedBox(
      height: toDouble(),
    );
  }
}
