import 'package:expense_tracker_mobile/screens/profile/w_app_bar_widget.dart';
import 'package:expense_tracker_mobile/utils/constants/app_constants.dart';
import 'package:expense_tracker_mobile/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    const text =
        "Fin Track is a personal finance management app designed to help you take control of your financial life with ease.\n \nWhether you're tracking your daily expenses, managing your income, setting savings goals, or creating budgets, Fin Track provides a comprehensive and user-friendly solution.\n \n The app offers intuitive features such as real-time budget alerts, personalized financial insights, and visualizations of your financial health, allowing you to make informed decisions effortlessly.\n \n With secure data encryption and a focus on privacy, Fin Track ensures that your financial information is protected at all times. Start using Fin Track today to simplify your money management and achieve your financial goals with confidence.";
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "About Fin Track"),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox(),
              const Text(
                "What is Fin Track?",
                style: AppConstants.titleTextStyle,
              ),
              30.heightBox(),
              const Text(
                text,
                style: AppConstants.bodyTextStyle,
                textAlign: TextAlign.justify, // Adds text justification
              ),
            ],
          ),
        ),
      ),
    );
  }
}
