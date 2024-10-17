import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

final class AppConstants {
  static const pageTransition = Transition.cupertino;
  static const double pagePadding = 20;
  static const transitionDuration = Duration(milliseconds: 300);
  static const bodyTextStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 20);
  static const titleTextStyle =
      TextStyle(fontWeight: FontWeight.w800, fontSize: 26);
  static const appBarTextStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
}
