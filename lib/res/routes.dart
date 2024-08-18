import 'package:expense_tracker_mobile/res/route_names.dart';
import 'package:expense_tracker_mobile/views/home/home.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteNames.homeScreen,
            page: () => const HomePage(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(milliseconds: 250))
      ];
}
