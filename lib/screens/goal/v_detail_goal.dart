import 'package:expense_tracker_mobile/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailGoal extends StatelessWidget {
  const DetailGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Detail Goal',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.trash4,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(30),
            const Center(
              child: Text(
                "Total Saved Amount",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "400,000 Ks",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            const Gap(30),

            // Centering the LinearPercentIndicator
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width,
              lineHeight: 25.0,
              percent: 0.8,
              animation: true,
              animationDuration: 2000,
              center: const Text(
                "80.0%",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              barRadius: const Radius.circular(20),
              backgroundColor: Colors.grey,
              progressColor: AppColors.primaryColor,
            ),

            const Gap(30),
            const Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "You have ",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "100,000 Ks",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " left to  \n achieve goal!",
                    ),
                  ],
                ),
              ),
            ),
            const Gap(60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Goal",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Adopt a Kitten",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Gap(25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Deadline",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Dec 12, 2024",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Gap(25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Ongoing",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            const Gap(25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Saved Amount",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "400,000 Ks",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  )
                ],
              ),
            ),
            const Gap(25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Goal Amount",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "500,000 Ks",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
