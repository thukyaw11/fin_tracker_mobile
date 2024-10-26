import 'package:expense_tracker_mobile/screens/profile/w_app_bar_widget.dart';
import 'package:expense_tracker_mobile/utils/constants/app_constants.dart';
import 'package:expense_tracker_mobile/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "Help"),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightBox(),
            const Text(
              "If you have any problems with the app, you can contact customer support.",
              style: AppConstants.bodyTextStyle,
            ),
            50.heightBox(),
            const Text(
              "We would like to hear from you",
              style: AppConstants.bodyTextStyle,
            ),
            20.heightBox(),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1000))),
                  onPressed: () {
                    onClickContact();
                  },
                  child: const Text("contact")),
            )
          ],
        ),
      ),
    );
  }

  void onClickContact() async {
    const telegramUrl = "https://t.me/LiTTy_duMb_xD";
    final Uri url = Uri.parse(telegramUrl);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
